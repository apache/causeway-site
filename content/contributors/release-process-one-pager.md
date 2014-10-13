Title: Release Process (1 pager)

See also the [full release process](release-process.html) and the [release checklist](release-checklist.html).

## Switch to correct directory, parameterize the release

{note
Make sure you are in the correct directory (eg core, component/xxx/yyy or example/archetype/zzz)
}

if releasing `core`, eg:

    cd core

    export ISISTMP=/c/tmp              # or whatever
    export ISISART=isis
    export ISISDEV=1.8.0-SNAPSHOT
    export ISISREL=1.7.0
    export ISISRC=RC1

    export ISISCOR="Y"
    env | grep ISIS | sort

    
if releasing a `component/xxx/yyy`, eg:

    cd component/xxx/yyy

    export ISISTMP=/c/tmp              # or whatever
    export ISISART=isis-xxx-yyy
    export ISISDEV=1.8.0-SNAPSHOT
    export ISISREL=1.7.0
    export ISISRC=RC1

    export ISISCOR="N"
    export ISISCPT=$(echo $ISISART | cut -d- -f2)
    export ISISCPN=$(echo $ISISART | cut -d- -f3)
    env | grep ISIS | sort
    
    
eg, for Wicket viewer this is:

    cd component/viewer/wicket

    export ISISTMP=/c/tmp              # or whatever
    export ISISART=isis-viewer-wicket
    export ISISDEV=1.8.0-SNAPSHOT
    export ISISREL=1.7.0
    export ISISRC=RC1

    export ISISCOR="N"
    export ISISCPT=$(echo $ISISART | cut -d- -f2)
    export ISISCPN=$(echo $ISISART | cut -d- -f3)
        
## Get code

If **releasing core**, then pull down latest, create branch (eg `prepare/isis-1.7.0`):

    git checkout master
    git pull --ff-only
    git checkout -b prepare/$ISISART-$ISISREL

If **releasing a component without also releasing core**, then pull down latest, create branch (eg `prepare/isis-viewer-wicket-1.7.0`):

    git checkout master
    git pull --ff-only
    git checkout -b prepare/$ISISART-$ISISREL 

If **releasing a component on top of a core release**, then omit this step (just continue in the same branch as for core).


##Update parent pom

If **releasing core**, check:

* parent is `org.apache:apache` (non-SNAPSHOT version)

If **releasing a component**, check:

* parent of component is `o.a.isis.core:isis`            (non-SNAPSHOT version)
    * eg `component/viewer/wicket/pom.xml`
* parent of tck modules is `o.a.isis.core:isis-core-tck` (non-SNAPSHOT version)
    * eg `component/viewer/wicket/tck/pom.xml`


##Check for SNAPSHOT dependencies

Search for any non-`SNAPSHOT` usages (including tck project, if any):

    grep SNAPSHOT `/bin/find . -name pom.xml | grep -v target | sort`

or (more thoroughly):

    vi `/bin/find . -name pom.xml | grep -v target | sort`


## Sanity check

{note
Make sure you are in the correct directory (eg core, component/xxx/yyy or example/archetype/zzz)
}

If **releasing core**, then clean all local mvn artifacts and rebuild with `-o` flag:

    cd core
    
    rm -rf ~/.m2/repository/org/apache/isis
    mvn clean install -o

If **releasing a component without also releasing core**, then clean all local mvn artifacst and rebuild **without `-o`** flag:

    cd component/xxx/yyy
    
    rm -rf ~/.m2/repository/org/apache/isis
    mvn clean install

If **releasing a component on top of a core release**, then do not clean, just rebuild with `-o` flag:

    mvn clean install -o

    
## Check versions

####Update plugin versions

    mvn versions:display-plugin-updates > /tmp/foo
    grep "\->" /tmp/foo | /bin/sort -u

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

{note
Make sure you are in the correct directory (eg core, component/xxx/yyy or example/archetype/zzz)
}

first the dry run:

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
     
> The `workingDirectory` property is to avoid 260char path issue if building on Windows.
 
## Nexus staging

Log onto [repository.apache.org](http://repository.apache.org) and close the staging repo.

## Git branches/tags

Push branch:

    git push -u origin prepare/$ISISART-$ISISREL

Then push tag:

    git push origin refs/tags/$ISISART-$ISISREL-$ISISRC:refs/tags/$ISISART-$ISISREL-$ISISRC
    git fetch

