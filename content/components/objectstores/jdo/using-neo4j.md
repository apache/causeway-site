Title: Using Neo4J (1.8.0).

As of 1.8.0 Apache Isis has experimental support for Neo4J, courtesy of DataNucleus' [Neo4J Datastore](http://www.datanucleus.org/products/datanucleus/datastores/neo4j.html) implementation.

The [simpleapp](../../../intro/getting-started/simpleapp-archetype.html) and [todoapp](../../../intro/getting-started/simpleapp-archetype.html) archetypes have been updated so that they can be optionally run under Neo4J.

The steps below describe the configuration steps required to update an existing app.

#### ConnectionURL

In `persistor.properties`, update the JDO `ConnectionURL` property, eg:

    isis.persistor.datanucleus.impl.javax.jdo.option.ConnectionURL=neo4j:neo4j_DB

The other connection properties (`ConnectionDriverName`, `ConnectionUserName` and `ConnectionPassword`) should be commented out.


#### Update pom.xml

Add the following dependency to the `webapp` project's `pom.xml`:

    <dependencies>
        ...
        <dependency>
            <groupId>org.datanucleus</groupId>
            <artifactId>datanucleus-neo4j</artifactId>
            <version>3.2.3</version>
        </dependency>
        ...
    </dependencies>

In the [simpleapp](../../../intro/getting-started/simpleapp-archetype.html) and [todoapp](../../../intro/getting-started/simpleapp-archetype.html) applications this is defined under the "neo4j" profile so can be activated using `-P neo4j`.


#### Try it out!

If you want to quickly try out neo4j for yourself:

* run the [simpleapp](../../../intro/getting-started/simpleapp-archetype.html) archetype (1.8.0)

* build the app:

<pre>
    mvn clean install -P neo4j
</pre>

* run the app:

<pre>
    mvn antrun:run -P self-host,neo4j -o
</pre>

If you visit the about page you should see the neo4j JAR files are linked in, and a `neo4j_DB` subdirectory within the `webapp` directory.