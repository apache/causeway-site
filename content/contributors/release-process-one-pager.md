Title: Release Process (1 pager)

Summarises the steps spelt out in full [here](release-process.html)

## Checklist

<table class="table table-bordered table-striped table-condensed table-hover">
    <thead>
        <tr>
            <th>Artifact</th>
            <th>Env?</th>
            <th>Update parent POM version (no&nbsp;snapshots)</th>
            <th>Update TCK POM version (no&nbsp;snapshots)</th>
            <th>Newer plugin versions</th>
            <th>Newer dependencies</th>
            <th>Formatting</th>
            <th>License headers (RAT)</th>
            <th>License check</th>
            <th>Recreate archetype</th>
            <th>Commit changes</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>isis</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-objectstore-jdo</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-viewer-wicket</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-viewer-restfulobjects</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-security-shiro</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-security-file</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>quickstart_wicket_restful_jdo-archetype</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>simple_wicket_restful_jdo-archetype</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>n/a</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

<table class="table table-bordered table-striped table-condensed table-hover">
    <thead>
        <tr>
            <th>Artifact</th>
            <th>prepare dryrun</th>
            <th>prepare</th>
            <th>confirm</th>
            <th>perform</th>
            <th>stage (nexus)</th>
            <th>git push</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>isis</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-objectstore-jdo</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-viewer-wicket</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-viewer-restfulobjects</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-security-shiro</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>isis-security-file</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>quickstart_wicket_restful_jdo-archetype</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>simple_wicket_restful_jdo-archetype</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


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

then export derived props for component type (ISISCPT) and component name (ISISCPN) and whether core or not (ISISCOR), and confirm:

    export ISISCPT=$(echo $ISISART | cut -d- -f2)
    export ISISCPN=$(echo $ISISART | cut -d- -f3)
    if [ $(echo "$ISISART" | grep -v "-") ]; then export ISISCOR="Y"; else export ISISCOR="N"; fi
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

    git push -u origin prepare/$ISISART-$ISISREL-$ISISRC

Then push tag:

    git push origin refs/tags/$ISISART-$ISISREL:refs/tags/$ISISART-$ISISREL-$ISISRC
    git fetch

