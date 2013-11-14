Title: ToDo App (Quickstart) Archetype

The todo app (quickstart) archetype will generate a reasonably complete application for tracking to-do items, based around a single domain class `ToDoItem` and repository, `ToDoItems`.

While not quite a "kitchen-sink" example (there is, after all, just a single domain class), the app nevertheless demonstrates a good number of Isis' capabilities.  In particular, the use of contributed actions etc is demonstrated by `ToDoItemContributions`; view models are demonstrated by `ToDoItemsByCategoryViewModel` and `ToDoItemsByDateRangeViewModel`; a dashboard is demonstrated by `ToDoAppDashboard`. 

Running this archetype is a good way to get familiar with the structure of a not-too-complex Isis application.  However, to get started with your own application, we generally recommend that you can run the alternative [simple archetype](simple-archetype.html).  This will generate a completely stripped back and minimal application for you to refactor and extend; you can then use this ToDo app to guide your own development.

### Generating the App

Create a new directory, and `cd` into that directory.

Then run the following command:

<pre>
mvn archetype:generate  \
    -D archetypeGroupId=org.apache.isis.archetype \
    -D archetypeArtifactId=quickstart_wicket_restful_jdo-archetype \
    -D archetypeVersion=1.3.1 \
    -D groupId=com.mycompany \
    -D artifactId=myapp \
    -D version=1.0-SNAPSHOT \
    -B
</pre>
where:

- `groupId` represents your own organization, and
- `artifactId` is a unique identifier for this app within your organization.
- `version` is the initial (snapshot) version of your app.

The archetype generation process will then run; it only takes a few seconds.

### Building the App

Switch into the root directory of your newly generated app, and build your app:

<pre>
cd myapp
mvn clean install
</pre>

where `myapp` is the `artifactId` entered above.

### Running the App

The `quickstart_wicket_restful_jdo` archetype generates a single WAR file, configured to run both the [Wicket viewer](../components/viewers/wicket/about.html) and the [Restful Objects viewer](../components/viewers/wicket/about.html).  The archetype also configures the [JDO Objectstore](../components/objectstores/jdo/about.html) to use an in-memory HSQLDB connection.  

Once you've built the app, you can run the WAR in a variety of ways. 

The recommended approach when getting started is to run the self-hosting version of the WAR, allowing Isis to run as a standalone app; for example:

<pre>
java -jar viewer-webapp/target/myapp-viewer-webapp-1.0-SNAPSHOT-jetty-console.war
</pre>

This can also be accomplished using an embedded Ant target provided in the build script:

<pre>
mvn antrun:run
</pre>
The first is to simply deploying the generated WAR (`webapp/target/myapp-webapp-1.0-SNAPSHOT.war`) to a servlet container.

Alternatively, you could run the WAR in a Maven-hosted Jetty instance, using:

<pre>
mvn jetty:run
</pre>

If you do this, note that the context path changes; check the console output.

Finally, you can also run the app by deploying to a standalone servlet container such as [Tomcat](http://tomcat.apache.org).

### Using the App

The archetype provides a welcome page that explains the classes and files generated, and provides detailed guidance and what to do next.

The app itself is configured to run using shiro security, as configured in the `WEB-INF/shiro.ini` config file.  To log in, use `sven/pass`.

### Modifying the App

Once you are familiar with the generated app, you'll want to start modifying it.  There is plenty of guidance on this site (check out the [getting started](../documentation.html) section first).

If you use Eclipse, do also install the [Eclipse templates](../getting-started/editor-templates.html); these will help you follow the Isis naming conventions.  

#### App Structure

As noted above, the generated app is a reasonably complete application for tracking to-do items.  It consists of the following modules: 

<table>
<tr><th>Module</th><th>Description</th></tr>
<tr><td>myapp</td><td>The parent (aggregator) module</td></tr>
<tr><td>myapp-dom</td><td>The domain object model, consisting of <tt>ToDoItem</tt> and <tt>ToDoItems</tt> (repository) domain service.</td></tr>
<tr><td>myapp-fixture</td><td>Domain object fixtures used for initializing the system when being demo'ed or for unit testing.</td></tr>
<tr><td>myapp-integtests</td><td>End-to-end <a href="../core/integtestsupport.html">integration tests</a>, that exercise from the UI through to the database</td></tr>
<tr><td>myapp-webapp</td><td>Run as a webapp (from <tt>web.xml</tt>) using either the Wicket viewer or the RestfulObjects viewer</td></tr>
</table>

If you run into issues, please don't hesitate to ask for help on the [users mailing list](../support.html).
