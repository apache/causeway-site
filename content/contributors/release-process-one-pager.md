Title: Release Process (1 pager)

Summarises the steps spelt out in full [here](release-process.html)

## Set up environment

if on *nix:

    export ISISTMP=/tmp

if on Windows:

    export ISISTMP=/c/tmp

## Switch to correct directory, parameterize the release

{note
Switch to the directory containing the (parent of the) artifact(s) to be released
}

if releasing `core`, eg:

    cd core
    export ISISART=isis
    export ISISDEV=1.5.0-SNAPSHOT
    export ISISREL=1.4.0
    export ISISRC=RC1

if releasing a `component/xxx/yyy`, eg:

    cd component/xxx/yyy

    export ISISART=isis-xxx-yyy
    export ISISDEV=1.5.0-SNAPSHOT
    export ISISREL=1.4.0
    export ISISRC=RC1

then export derived props for component type and component name

    export ISISCTP=$(echo $ISISART | cut -d- -f2)
    export ISISCNM=$(echo $ISISART | cut -d- -f3)
    if [ $(echo "abc-def" | grep -v "-") ]; then export ISISCOR="Y"; else export ISISCOR="N"; fi

confirm:

    env | grep ISIS | sort
    
## Get code

Pull down latest, create branch (eg `prepare/isis-1.4.0-RC1`):

    git checkout master
    git pull --ff-only
    git checkout -d prepare/$ISISART-$ISISREL-$ISISRC 

    
Sanity check:

    rm -rf ~/.m2/repository/org/apache/isis
    mvn clean install -o



## Check code

Update parent version to non-`SNAPSHOT` (including tck project, if any):

    vi `/bin/find . -name pom.xml | grep -v target`

Newer dependencies:

    mvn versions:display-dependency-updates > /tmp/foo
    grep "\->" /tmp/foo | /bin/sort -u

Missing license headers in files:

    mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
    for a in `/bin/find . -name rat.txt -print`; do grep '!???' $a; done

Missing/spurious `supplemental-models.xml`

... if in `core`:

    mvn license:download-licenses
    groovy ../scripts/checkmissinglicenses.groovy

... if for a `component/xxx/yyy`:

    mvn license:download-licenses
    groovy ../../../scripts/checkmissinglicenses.groovy

## Commit changes

Commit any changes from the preceding steps:

    git commit -am "ISIS-nnn: updates to pom.xml etc for release"

## Release

#### Prepare:

first the dry run (you will be prompted for gpg passphrase):

    mvn release:prepare -P apache-release \
                        -DdryRun=true \
                        -DreleaseVersion=$ISISREL \
                        -DdevelopmentVersion=$ISISDEV \
                        -Dtag=$ISISART-$ISISREL
                        
then "for real": 

    mvn release:prepare -P apache-release -DskipTests=true -Dresume=false \
                        -DreleaseVersion=$ISISREL \
                        -DdevelopmentVersion=$ISISDEV \
                        -Dtag=$ISISART-$ISISREL

#### Confirm:

    rm -rf $ISISTMP/$ISISART-$ISISREL
    mkdir $ISISTMP/$ISISART-$ISISREL

    cp target/$ISISART-$ISISREL-source-release.zip $ISISTMP/$ISISART-$ISISREL/.
    pushd $ISISTMP/$ISISART-$ISISREL
    unzip $ISISART-$ISISREL-source-release.zip

    cd $ISISART-$ISISREL
    mvn clean install

    cat DEPENDENCIES

    popd

#### Perform:

if building on *nix, can use the defaults:

    mvn release:perform -P apache-release

but if using mSysGit on windows, specify a different working directory:

    mvn release:perform -P apache-release \
        -DworkingDirectory=$ISISTMP/$ISISART-$ISISREL/checkout
        
You may (again) be prompted for gpg passphrase.
 
## Nexus staging

Log onto [repository.apache.org](http://repository.apache.org) and close the staging repo.

## Git branches/tags

Push branch then tags:

    git push -u origin prepare/$ISISART-$ISISREL-$ISISRC
    git push origin refs/tags/$ISISART-$ISISREL:refs/tags/$ISISART-$ISISREL-$ISISRC
    git fetch
