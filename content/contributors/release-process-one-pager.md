Title: Release Process (1 pager)

Summarises the steps spelt out in full [here](release-process.html)

## Switch to correct directory, parameterize the release

{note
Switch to the directory containing the (parent of the) artifact(s) to be released
}

... if for `core`, eg:

    cd core
    export ARTIFACT=isis
    export REL=1.4.0
    export DEV=1.5.0-SNAPSHOT
    export RC=RC1
    export PASSPHRASE="..."

... if for a `component/xxx/yyy`, eg:

    cd component/xxx/yyy

    export ARTIFACT=isis-xxx-yyy
    export REL=1.4.0
    export DEV=1.5.0-SNAPSHOT
    export RC=RC1
    export PASSPHRASE="..."


## Get code

Pull down latest, create branch (eg `prepare/isis-1.4.0-RC1`):

    git checkout master
    git pull --ff-only
    git checkout -d prepare/$ARTIFACT-$REL-$RC 

    
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

Prepare:

    mvn release:prepare -P apache-release \
                        -D dryRun=true \
                        --batch-mode -Dgpg.passphrase=$PASSPHRASE \
                        -DreleaseVersion=$REL \
                        -DdevelopmentVersion=$DEV \
                        -Dtag=$ARTIFACT-$REL
    mvn release:prepare -P apache-release -D skipTests=true -Dresume=false \
                        -DreleaseVersion=$REL \
                        -DdevelopmentVersion=$DEV \
                        -Dtag=$ARTIFACT-$REL

Confirm:

    rm -rf /tmp/$ARTIFACT-$REL
    mkdir /tmp/$ARTIFACT-$REL

    cp target/$ARTIFACT-$REL-source-release.zip /tmp/$ARTIFACT-$REL/.
    pushd /tmp/$ARTIFACT-$REL
    unzip $ARTIFACT-$REL-source-release.zip

    cd $ARTIFACT-$REL
    mvn clean install

    cat DEPENDENCIES

    popd

Perform:

    mvn release:perform -P apache-release

