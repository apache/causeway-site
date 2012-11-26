Title: Quickstart Archetype (0.2.0-incubating)

The quickest way to get started with Apache Isis is to run the quickstart archetype.  This will generate a simple one-class domain model, for tracking to-do items.  The intention is not to showcase all of Isis' capabilities; rather it is to allow you to very easily modify the generated app to your own domain.

### Generating the App

Create a new directory, and `cd` into that directory.

Then run the following command:

<pre>
mvn archetype:generate  \
    -D archetypeGroupId=org.apache.isis \
    -D archetypeArtifactId=quickstart-archetype \
    -D archetypeVersion=0.2.0-incubating \
    -D groupId=com.mycompany \
    -D artifactId=myapp
</pre>
where:

- `groupId` represents your own organization, and
- `artifactId` is a unique identifier for this app within your organization.

You'll then be prompted for some further properties; you can generally leave these as the default:

- enter a version, eg `1.0-SNAPSHOT`
- enter a package
- confirm the entry

The archetype generation process will then run; it only takes a few seconds.

### Building the App

Switch into the root directory of your newly generated app, and build your app:

<pre>
cd myapp
mvn clean install
</pre>

where `myapp` is the `artifactId` entered above.

### Running the App

Once you've built the app, you can run it in a variety of ways.

The first is to simply deploying the generated WAR (`webapp/target/myapp-webapp-1.0-SNAPSHOT.war`) to a servlet container.

Alternatively, you could run the WAR in a Maven-hosted Jetty instance, using:

<pre>
mvn jetty:run
</pre>

If you do this, note that the context path changes; check the console output.

In addition to the standard WAR< the archetype also builds a self-hosted version of the WAR.  You can therefore also simply run the WAR as a standalone app:

<pre>
java -jar webapp/target/myapp-webapp-1.0-SNAPSHOT-jetty-console.war
</pre>

This can also be accomplished using an embedded Ant target provided in the build script:

<pre>
mvn antrun:run
</pre>

### Using the App

The app itself is configured to run using basic security, as configured in the `security_file.passwords` config file.  to log in, use `sven/pass`.

### App Structure

As noted above, the generated app is a very simple application consisting of a single domain object for tracking to-do items. The intention is not to showcase all of Isis' capabilities; rather it is to allow you to very easily modify the generated application (eg rename `ToDoItem` to `Customer`) without having to waste time deleting lots of generated code.

<table>
<tr><th>Module</th><th>Description</th></tr>
<tr><td>myapp</td><td>The parent (aggregator) module</td></tr>
<tr><td>myapp-dom</td><td>The domain object model, consisting of <tt>ToDoItem</tt> and <tt>ToDoItems</tt> (repository) interface.</td></tr>
<tr><td>myapp-fixture</td><td>Domain object fixtures used for initializing the system when being demo'ed or for unit testing.</td></tr>
<tr><td>myapp-objstore-dflt</td><td>Implementation of <tt>ToDoItems</tt> repository, for the default (in-memory) object store.</td></tr>
<tr><td>myapp-webapp	</td><td>Run as a webapp (from <tt>web.xml</tt>) using either the HTML viewer or the JSON (RESTful) viewer</td></tr>
<tr><td>myapp-tests-bdd</td><td>Run domain object tests using Isis' integration with the Concordion BDD framework.</td></tr>
<tr><td>myapp-tests-junit</td><td>Run domain object tests using Isis' custom test runner for JUnit runner</td></tr>
</table>

The most significant omission with the generated application is that it is configured only to support the default in-memory object store. What this means is that any changes you make to objects will not be persisted between runs. If you'd like to use other viewers and object stores, ask for help on the [users mailing list](../support.html).