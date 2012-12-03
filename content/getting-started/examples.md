Title: Examples

The following examples are zipped-up versions of the `examples/` directory, configured to run against the current SNAPSHOT.

* if you've built Isis from the source code, then these examples will run against your local cached Isis modules

* If you **haven't** built Isis from source code, then these examples will pull down the current snapshots on the [Apache snapshot repo](https://repository.apache.org/index.html).

In both cases the domain object model is a very simple todo application.  No prizes for originality there, but we wanted a one domain class that you could easily refactor for your own purposes.

### Wicket/Restful Objects/JDO

This example configures two webapps: the [Wicket viewer](../components/viewers/wicket/about.html) and the [Restful Objects viewer](../components/viewers/restfulobjects/about.html).  In both cases the webapps run against [JDO Object store](../components/objectstores/jdo/about.html).

The default configuration is an HSQLDB in-memory database, so changes are not persisted and are not shared between the webapps if run concurrently.  This can easily be changed though by editing the `persistor_datanucleus.properties` file (in `src/main/webapp/WEB-INF` for both webapps).

To build the example:

* download the [tarfile](resources/quickstart_wicket_restful_jdo.tar.gz) and unzip using `gunzip` and `tar xvf`
* build using Maven:
<pre>
  mvn clean install
</pre>

To run the Wicket viewer, use:

<pre>
cd viewer-wicket
mvn antrun:run
</pre>

which runs a self-hosted WAR file.  Alternatively you can deploy the WAR file (in the `target` directory) to a servlet container.

To run the Restful Objects viewer, use:

<pre>
cd viewer-restfulobjects
mvn antrun:run
</pre>

### DnD/Junit/BDD (Concordion)

This example demonstrates the use of domain object testing using the [junit viewer](../components/viewers/junit/about.html), BDD-style testing using the [BDD viewer](../components/viewers/bdd/about.html), as well as using the [DnD viewer](../components/viewers/dnd/about.html) to explore the domain model.  The viewers are configured to use the [in-memory objectstore](../components/objectstores/inmemory/about.html), so changes are never persisted between runs.

To build the example:

* download the [tarfile](resources/quickstart_dnd_junit_bdd.tar.gz) and unzip using `gunzip` and `tar xvf`
* build using Maven:
<pre>
  mvn clean install
</pre>

The act of building will actually execute the tests.  Running the BDD tests also generates a transcript, which you can find in `/tmp/concordion/bdd/stories/AllStories.html`.  

To run the DnD viewer, use:

<pre>
cd viewer-dnd
mvn antrun:run
</pre>
