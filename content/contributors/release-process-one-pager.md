Title: Release Process (1 pager)

See also the [full release process](release-process.html) and the [release checklist](release-checklist.html).

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
    export ISISDEV=1.7.0-SNAPSHOT
    export ISISREL=1.6.0
    export ISISRC=RC1

if releasing a `component/xxx/yyy`, eg:

    cd component/xxx/yyy

    export ISISART=isis-xxx-yyy
    export ISISDEV=1.7.0-SNAPSHOT
    export ISISREL=1.6.0
    export ISISRC=RC1

then export derived props for component type (ISISCPT) and component name (ISISCPN) and whether core or not (ISISCOR), and confirm:

    export ISISCPT=$(echo $ISISART | cut -d- -f2)
    export ISISCPN=$(echo $ISISART | cut -d- -f3)
    if [ $(echo "$ISISART" | grep -v "-") ]; then export ISISCOR="Y"; else export ISISCOR="N"; fi
    env | grep ISIS | sort
    
## Get code

If **releasing core**, then pull down latest, create branch (eg `prepare/isis-1.6.0`):

    git checkout master
    git pull --ff-only
    git checkout -b prepare/$ISISART-$ISISREL

If **releasing a component without also releasing core**, then pull down latest, create branch (eg `prepare/isis-viewer-wicket-1.6.0`):

    git checkout master
    git pull --ff-only
    git checkout -b prepare/$ISISART-$ISISREL 

If **releasing a component on top of a core release**, then omit this step (just continue in the same branch as for core).


##Update parent pom

If **releasing core**, check:
* parent is `org.apache:apache` (non-SNAPSHOT version)

If **releasing a component**, check:
* parent of component is `o.a.isis.core:isis`            (non-SNAPSHOT version)
* parent of tck modules is `o.a.isis.core:isis-core-tck` (non-SNAPSHOT version)


##Check for SNAPSHOT dependencies

Search for any non-`SNAPSHOT` usages (including tck project, if any):

    grep SNAPSHOT `/bin/find . -name pom.xml | grep -v target | sort`

or (more thoroughly):

    vi `/bin/find . -name pom.xml | grep -v target | sort`


## Sanity check

If **releasing core**, then clean all local mvn artifacts and rebuild with `-o` flag:

    rm -rf ~/.m2/repository/org/apache/isis
    mvn clean install -o

If **releasing a component without also releasing core**, then clean all local mvn artifacst and rebuild **without `-o`** flag:

    rm -rf ~/.m2/repository/org/apache/isis
    mvn clean install

If **releasing a component on top of a core release**, then do not clean, just rebuild with `-o` flag:

    mvn clean install -o

    
## Check versions

####Update plugin versions

    mvn versions:display-plugin-updates > /tmp/foo
    cat /tmp/foo

####Newer dependencies:

    mvn versions:display-dependency-updates > /tmp/foo
    grep "\->" /tmp/foo | /bin/sort -u

####Missing license headers in files:

    mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
    for a in `/bin/find . -name rat.txt -print`; do grep '!???' $a; done

####Missing/spurious `supplemental-models.xml`

    mvn license:download-licenses
    if [ "$ISISCOR" == "Y" ]; then
        groovy ../scripts/checkmissinglicenses.groovy
    else
        groovy ../../../scripts/checkmissinglicenses.groovy
    fi

    
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
                        -Dtag=$ISISART-$ISISREL-$ISISRC
                        
then "for real": 

    mvn release:prepare -P apache-release -DskipTests=true -Dresume=false \
                        -DreleaseVersion=$ISISREL \
                        -DdevelopmentVersion=$ISISDEV \
                        -Dtag=$ISISART-$ISISREL-$ISISRC

#### Confirm:

    rm -rf $ISISTMP/$ISISART-$ISISREL
    mkdir $ISISTMP/$ISISART-$ISISREL

    if [ "$ISISCOR" == "Y" ]; then
        ZIPDIR="$M2_REPO/repository/org/apache/isis/core/$ISISART/$ISISREL"
    else
        ZIPDIR="$M2_REPO/repository/org/apache/isis/$ISISCPT/$ISISART/$ISISREL"
    fi
    echo "cp \"$ZIPDIR/$ISISART-$ISISREL-source-release.zip\" $ISISTMP/$ISISART-$ISISREL/."
    cp "$ZIPDIR/$ISISART-$ISISREL-source-release.zip" $ISISTMP/$ISISART-$ISISREL/.

    pushd $ISISTMP/$ISISART-$ISISREL
    unzip $ISISART-$ISISREL-source-release.zip

    cd $ISISART-$ISISREL
    mvn clean install

    cat DEPENDENCIES

    popd

#### Perform:

    mvn release:perform -P apache-release \
        -DworkingDirectory=$ISISTMP/$ISISART-$ISISREL/checkout
     
You may (again) be prompted for gpg passphrase.

> The `workingDirectory` property is to avoid 260char path issue if building on Windows.
 
## Nexus staging

Log onto [repository.apache.org](http://repository.apache.org) and close the staging repo.

## Git branches/tags

(If component has its own branch, ie not reusing core's, then) push branch:

    git push -u origin prepare/$ISISART-$ISISREL

Then push tag:

    git push origin refs/tags/$ISISART-$ISISREL:refs/tags/$ISISART-$ISISREL-$ISISRC
    git fetch

