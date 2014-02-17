Title: Simple Archetype

The quickest way to get started with Apache Isis is to run the simple archetype.  This will generate a very simple one-class domain model, called `SimpleObject`, with a single property `name`.  There is also a corresponding `SimpleObjectRepository` domain service.  From this you can easily rename these initial classes, and extend to build up your own Isis domain application.

If you want to see a more functionally complete example, also check out the [ToDo app (quickstart) archetype](quickstart-archetype.html); this will give you a good idea of what makes up a not-too-complex Isis application.  In fact, we recommend that you run both archetypes: this simple archetype generates a very simple application for you to refactor and extend, while the ToDo app provides to guide your own development.

## Generating the App

Create a new directory, and `cd` into that directory.

Then run the following command:

<pre>
mvn archetype:generate  \
    -D archetypeGroupId=org.apache.isis.archetype \
    -D archetypeArtifactId=simple_wicket_restful_jdo-archetype \
    -D archetypeVersion=1.3.1 \
    -D groupId=com.mycompany \
    -D artifactId=myapp \
    -D version=1.0-SNAPSHOT \
    -B
</pre>
where:

- `groupId` represents your own organization, and
- `artifactId` is a unique identifier for this app within your organization.
- `version` is the initial (snapshot) version of your app

The archetype generation process will then run; it only takes a few seconds.

## Building the App

Switch into the root directory of your newly generated app, and build your app:

<pre>
cd myapp
mvn clean install
</pre>

where `myapp` is the `artifactId` entered above.

## Running the App

The `simple_wicket_restful_jdo` archetype generates a single WAR file, configured to run both the [Wicket viewer](../../components/viewers/wicket/about.html) and the [Restful Objects viewer](../../components/viewers/wicket/about.html).  The archetype also configures the [JDO Objectstore](../../components/objectstores/jdo/about.html) to use an in-memory HSQLDB connection.  

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

Alternatively, you could run the WAR in a Maven-hosted Jetty instance, though you need to `cd` into the `webapp` module:

<pre>
cd webapp
mvn jetty:run -D jetty.port=9090
</pre>

In the above, we've passed in a property to indicate a different port from the default port (8080).

Note that if you use `mvn jetty:run`, then the context path changes; check the console output (eg [http://localhost:9090/myapp-webapp](http://localhost:9090/myapp-webapp)).

Finally, you can also run the app by deploying to a standalone servlet container such as [Tomcat](http://tomcat.apache.org).

## Using the App

The archetype provides a welcome page that explains the classes and files generated, and provides detailed guidance and what to do next.

The app itself is configured to run using shiro security, as configured in the `WEB-INF/shiro.ini` config file.  To log in, use `sven/pass`.

## Modifying the App

Once you are familiar with the generated app, you'll want to start modifying it.  There is plenty of guidance on this site; check out the 'programming model how-tos' section on the main [documentation](../../documentation.html) page first).

If you use Eclipse, do also install the [Eclipse templates](../resources/editor-templates.html); these will help you follow the Isis naming conventions.  

## App Structure

As noted above, the generated app is a very simple application consisting of a single domain object that can be easily renamed and extended. The intention is not to showcase all of Isis' capabilities; rather it is to allow you to very easily modify the generated application (eg rename `SimpleObject` to `Customer`) without having to waste time deleting lots of generated code.

<table class="table table-striped table-bordered table-condensed">
<tr><th>Module</th><th>Description</th></tr>
<tr><td>myapp</td><td>The parent (aggregator) module</td></tr>
<tr><td>myapp-dom</td><td>The domain object model, consisting of <tt>SimpleObject</tt> and <tt>SimpleObjects</tt> (repository) domain service.</td></tr>
<tr><td>myapp-fixture</td><td>Domain object fixtures used for initializing the system when being demo'ed or for unit testing.</td></tr>
<tr><td>myapp-integtests</td><td>End-to-end <a href="../../core/integtestsupport.html">integration tests</a>, that exercise from the UI through to the database</td></tr>
<tr><td>myapp-webapp</td><td>Run as a webapp (from <tt>web.xml</tt>) using either the Wicket viewer or the RestfulObjects viewer</td></tr>
</table>

If you run into issues, please don't hesitate to ask for help on the [users mailing list](../../support.html).
