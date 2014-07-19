Title: Recreating an Archetype

Isis archetypes are reverse engineered from example applications.  Once reverse engineered, the source is checked into git (replacing any earlier version of the archetype) and released.

### Check the example app

Switch to the directory containing the example application; this page uses `simpleapp`:

    cd example/application/simpleapp

Update the parent `pom.xml` to reference the *released* version of Isis core and the other components.  As of v1.6.0 this means:

    vi example/application/simpleapp/pom.xml
   
and update the appropriate `<properties>`:

    <properties>
        <isis.version>1.6.0</isis.version>
        <isis-viewer-wicket.version>1.6.0</isis-viewer-wicket.version>
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

then using mvn jetty plugin (browse to [http://localhost:8080/simpleapp-webapp/](http://localhost:8080/simpleapp-webapp/)) etc:

    cd webapp
    mvn jetty:run     
    
Check the about page and confirm built against non-SNAPSHOT versions of the Isis jars.

### Create the archetype

Before we generate the archetype, we clear out all non source code artifacts.

Start by doing the regular `mvn clean`:

    mvn clean

To view the remaining files/directories that needs removing, use:

    for a in .project .classpath .settings bin .idea target-ide; do /bin/find . -name $a -print; done
    /bin/find . -name "*.iml" -print
    /bin/find . -name "*.log" -print

To actually delete these files, use:

    for a in .project .classpath .settings bin .idea target-ide; do /bin/find . -name $a -exec rm -r {} \;; done
    /bin/find . -name "*.iml" -exec rm {} \;
    /bin/find . -name "*.log" -exec rm {} \;

Quickly check that the remaining files are all source files:

    /bin/find .

Now we can create the archetype:

    mvn archetype:create-from-project
    groovy ../../../scripts/updateGeneratedArchetypeSources.groovy -n simpleapp -v 1.2.3

where:

- `simpleapp` is the name of the source application, and 
- `1.2.3` is the version of isis core that is to be the parent of the generated archetype.

### Test the archetype

First, build the archetype:

    cd target/generated-sources/archetype
    mvn clean install
    cd ../../..

Then, *in a different session*, create a new app from the archetype:

    mkdir /tmp/test
    cd /tmp/test
    mvn archetype:generate  \
        -D archetypeCatalog=local \
        -D groupId=com.mycompany \
        -D artifactId=myapp \
        -D archetypeGroupId=org.apache.isis.archetype \
        -D archetypeArtifactId=simpleapp-archetype

Build the newly generated app and test:

    cd myapp
    mvn clean install
    mvn antrun:run -P self-host    # runs as standalone app using webconsole
    cd webapp
    mvn jetty:run                  # runs as mvn jetty plugin

### Check the archetype source code into git

Back in the *original session* (at `example/application/simpleapp`), we are ready to check the archetype source code into git.

If this is an update to an existing archetype:

    git rm -rf ../../archetype/simpleapp
    rm -rf ../../archetype/simpleapp

Make sure that the `archetype/simpleapp` directory was fully removed, otherwise the next command will not copy the regenerated source into the correct location.

Then, copy over the generated source of the archetype:

    mv target/generated-sources/archetype ../../archetype/simpleapp
    git add ../../archetype/simpleapp

Next, confirm that the `-SNAPSHOT` version of the archetype is correct:

    vi ../../archetype/simpleapp/pom.xml

If this a new archetype, then add a reference to the archetype to the root `pom.xml`, eg:

    <modules>
        ...
        <module>example/archetype/simpleapp</module>
        ...
    </modules>

Finally, commit the changes:

    git commit -am "ISIS-nnn: updating archetype"

### Setting up Eclipse IDE

If the original application projects are imported into Eclipse, note that you'll need to recreate their project configuration afterwards (right click in `Package Explorer` > `Maven` > `Update Package Configuration`)

You may also want to import the new archetype project, using `File > Import > Project > Maven > Existing Maven Project`.


### Releasing the Archetype

The procedure for releasing the archetype is the same as for any other releasable module; in essence:

    export ISISTMP= ... # as required
    export ISISART=simpleapp-archetype
    export ISISDEV=1.6.0-SNAPSHOT
    export ISISREL=1.5.0
    export ISISRC=RC1

    rm -rf $ISISTMP/checkout

    cd example/archetype/simpleapp
    mvn release:prepare -P apache-release \
                    -DreleaseVersion=$ISISREL \
                    -DdevelopmentVersion=$ISISDEV \
                    -Dtag=$ISISART-$ISISREL-$ISISRC
    mvn release:perform -P apache-release \
        -DworkingDirectory=$ISISTMP/checkout

See the [release process](release-process.html) for full details.
