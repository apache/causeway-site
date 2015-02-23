Title: Recreating an Archetype

Isis archetypes are reverse engineered from example applications.  Once reverse engineered, the source is checked into git (replacing any earlier version of the archetype) and released.

### Setup environment variables

To recreate the **simpleapp** archetype:

    cd example/application/simpleapp

    export ISISTMP=/c/tmp   # or as required
    export ISISART=simpleapp-archetype
    export ISISDEV=1.9.0-SNAPSHOT
    export ISISREL=1.8.0
    export ISISPAR=1.8.0
    export ISISRC=RC1

    export ISISCPT=$(echo $ISISART | cut -d- -f2)
    export ISISCPN=$(echo $ISISART | cut -d- -f1)

    env | grep ISIS | sort

nb: `$ISISPAR` is the version of the Isis core that will act as the archetype's parent.  Usually this is the same as `$ISISREL`.

### Check the example app

Make sure you are in the correct directory, and update the parent `pom.xml` to reference the *released* version of Isis core<!--and the other components-->:

    <properties>
        <isis.version>1.8.0</isis.version>
        ...
    </properties>

Alternatively, you could just load up each `pom.xml` and inspect manually:

    vi `/bin/find . -name pom.xml | grep -v target`

... and search for `SNAPSHOT`.


Next, check for and fix any missing license header notices:

    mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
    for a in `/bin/find . -name rat.txt -print`; do grep '!???' $a; done

Finally, double check that the app is running satisfactorily:

first, as self-hosted webconsole (browse to [http://localhost:8080](http://localhost:8080)):
  
    mvn clean install
    mvn antrun:run -P self-host

then using mvn jetty plugin:

    cd webapp
    mvn jetty:run     

Browse to [http://localhost:8080/simpleapp-webapp/](http://localhost:8080/simpleapp-webapp/).


    
Check the about page and confirm built against non-SNAPSHOT versions of the Isis jars.

### Create the archetype (manual)


{note
The archetype can be created either by hand or with a script.  The section describes the manual approach; the scripted approach is in the section after.
}

Before we generate the archetype, we clear out all non source code artifacts.

Start by doing the regular `mvn clean`:

    mvn clean

To view the remaining files/directories that needs removing, use:

    for a in .project .classpath .settings bin .idea target-ide; do /bin/find . -name $a -print; done
    /bin/find . -name "*.iml" -print
    /bin/find . -name "*.log" -print
    /bin/find . -name "pom.xml.*" -print

To actually delete these files, use:

    for a in .project .classpath .settings bin .idea target-ide; do /bin/find . -name $a -exec rm -r {} \;; done
    /bin/find . -name "*.iml" -exec rm {} \;
    /bin/find . -name "*.log" -exec rm {} \;
    /bin/find . -name "pom.xml.*" -exec rm {} \;

Quickly check that the remaining files are all source files:

    /bin/find .

Now we can create the archetype.

    mvn archetype:create-from-project

and then update the generated files:

    groovy ../../../scripts/updateGeneratedArchetypeSources.groovy -n $ISISCPN -v $ISISPAR

where:

- `$ISISCPN` is the component name set earlier (`simpleapp`)
- `$ISISPAR` is the version of isis core that is to be the parent of the generated archetype, 
    - this will usually be the same as `$ISISREL` unless a patch/interim release of the archetype.

### Test the archetype

First, build the archetype:

    cd target/generated-sources/archetype
    mvn clean install
    cd ../../..

Then, *in a different session*, create a new app from the archetype:

Set up environment variables:

To test the **simpleapp** archetype:

    export ISISTMP=/c/tmp    # or as required
    export ISISCPN=simpleapp
    env | grep ISIS | sort

Then recreate:

    rm -rf $ISISTMP/test-$ISISCPN

    mkdir $ISISTMP/test-$ISISCPN
    cd $ISISTMP/test-$ISISCPN
    mvn archetype:generate  \
        -D archetypeCatalog=local \
        -D groupId=com.mycompany \
        -D artifactId=myapp \
        -D archetypeGroupId=org.apache.isis.archetype \
        -D archetypeArtifactId=$ISISCPN-archetype

Build the newly generated app and test:

    cd myapp
    mvn clean install
    mvn antrun:run -P self-host    # runs as standalone app using webconsole
    cd webapp
    mvn jetty:run                  # runs as mvn jetty plugin

### Check the archetype source code into git

Back in the *original session* (at `example/application/simpleapp`), we are ready to check the archetype source code into git:

    git rm -rf ../../archetype/$ISISCPN
    rm -rf ../../archetype/$ISISCPN

In either case make sure that the `archetype/$ISISCPN` directory was fully removed, otherwise the next command will not copy the regenerated source into the correct location.

Then, copy over the generated source of the archetype:

    mv target/generated-sources/archetype ../../archetype/$ISISCPN
    git add ../../archetype/$ISISCPN

Next, confirm that the `-SNAPSHOT` version of the archetype is correct:

    vi ../../archetype/$ISISCPN/pom.xml

If this a new archetype, then add a reference to the archetype to the root `pom.xml`, eg:

    <modules>
        ...
        <module>example/archetype/newapp</module>
        ...
    </modules>

Finally, commit the changes:

    git commit -am "ISIS-nnn: updating $ISISCPN archetype"

    
### Create the archetype (scripted)

{note
Using the script does not generate an app from the archetype to test it works.
}

Make sure you are in the correct directory and environment variables are correct.

To recreate the **simpleapp** archetype:

    cd example/application/simpleapp

    env | grep ISIS | sort

If the environment variables look wrong, use the commands at the top of this page to setup.
The script will also double check that all required environment variables are set.

Then, run the script:

    sh ../../../scripts/recreate-archetype.sh ISIS-nnn

The script automatically commits changes; if you wish use `git log` and 
`git diff` (or a tool such as SourceTree) to review changes made.

### Releasing the Archetype

{note
Releasing the archetype is performed from the **example/archetype** directory,
NOT the *example/application* directory.
}

The procedure for releasing the archetype is the same as for any other releasable module.

First, confirm environment variables set correctly:

    env | grep ISIS | sort
    
Then switch the correct directory and release:

    cd ../../../example/archetype/$ISISCPN

    rm -rf $ISISTMP/checkout

    mvn release:prepare -P apache-release \
                    -DreleaseVersion=$ISISREL \
                    -DdevelopmentVersion=$ISISDEV \
                    -Dtag=$ISISART-$ISISREL
    mvn release:perform -P apache-release \
                    -DworkingDirectory=$ISISTMP/checkout

Next, log onto [repository.apache.org](http://repository.apache.org) and close the staging repo.

Then push branch:

    git push -u origin prepare/$ISISART-$ISISREL

and push tag:

    git push origin refs/tags/$ISISART-$ISISREL-$ISISRC:refs/tags/$ISISART-$ISISREL-$ISISRC
    git fetch

See the [release process](release-process.html) for full details.

