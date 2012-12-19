Title: Recreating an Archetype

Isis archetypes are reverse engineered from example applications.  Once reverse engineered, the source is checked into git (replacing any earlier version of the archetype) and released.

### Check the example app

Switch to the directory containing the example application; this page uses `quickstart_wicket_restful_jdo`:

<pre>
cd example/application/quickstart_wicket_restful_jdo
</pre>

Make sure that the app's `pom.xml`:

- has the correct `-SNAPSHOT` version
- references *released* versions of Isis core and the other components

Finally, double check that the app is running satisfactorily.  

### Create the archetype

Before we generate the archetype, we clear out all non source code artifacts.

To view the files/directories that needs removing, use:
<pre>
for a in .project .classpath .settings bin target-ide; do find . -name $a -print; done
find . -name "*.log" -print
</pre>

To actually delete these files, use:
<pre>
for a in .project .classpath .settings bin target-ide; do find . -name $a -exec rm -r {} \;; done
find . -name "*.log" -exec rm {} \;
</pre>

Now we can create the archetype:

<pre>
mvn clean archetype:create-from-project
groovy ../../../scripts/updateGeneratedArchetypeSources.groovy
</pre>


### Test the archetype

First, build the archetype:

<pre>
cd target/generated-resources/archetype
mvn clean install
cd ../../..
</pre>

Then, *in a different session*, create a new app from the archetype:
<pre>
mkdir /tmp/test
cd /tmp/test
mvn archetype:generate  \
    -D archetypeCatalog=local \
    -D archetypeGroupId=org.apache.isis.archetype \
    -D archetypeArtifactId=quickstart_wicket_restful_jdo-archetype \
    -D groupId=com.mycompany \
    -D artifactId=myapp
</pre>

Build the newly generated app:
<pre>
cd myapp
mvn clean install
</pre>

And test.  For example:
<pre>
cd viewer-wicket
mvn antrun:run
</pre>

### Check the archetype source code into git

Back in the *original session* (at `example/application/quickstart_wicket_restful_jdo`), we are ready to check the archetype source code into git.

If this is an update to an existing archetype:

<pre>
git rm -rf ../../archetype/quickstart_wicket_restful_jdo
rm -rf ../../archetype/quickstart_wicket_restful_jdo
</pre>

Then, copy over the generated source of the archetype:

<pre>
cp -r target/generated-sources/archetype \
        ../../archetype/quickstart_wicket_restful_jdo
git add ../../archetype/quickstart_wicket_restful_jdo
</pre>

Next, confirm that the `-SNAPSHOT` version of the archetype is correct:

<pre>
vi ../../archetype/quickstart_wicket_restful_jdo/pom.xml
</pre>

If this a new archetype, then add a reference to the archetype to the root `pom.xml`, eg:

<pre>
&lt;modules&gt;
    ...
    &lt;module&gt;example/archetype/quickstart&lt;/module&gt;
    ...
&lt;/modules&gt;
</pre>

Finally, commit the changes:
<pre>
git commit -m "ISIS-nnn: updating archetype"
</pre>

### Setting up Eclipse IDE

If the original application projects are imported into Eclipse, note that you'll need to recreate their project configuration afterwards (right click in `Package Explorer` > `Maven` > `Update Package Configuration`)

You may also want to import the new archetype project, using `File > Import > Project > Maven > Existing Maven Project`.


### Releasing the Archetype

The procedure for releasing the archetype is the same as for any other releasable module; in essence:

<pre>
cd example/archetype/quickstart_wicket_restful_jdo
mvn release:prepare -P apache-release
mvn release:perform -P apache-release
</pre>

See the [release process](release-process.html) for full details.
