Title: Updating the Quickstart Archetype to run with the SQL object store

These notes provided by Jason Richardson (see [ISIS-223](https://issues.apache.org/jira/browse/ISIS-223)); many thanks.

### Preamble

The following details what POM entries and isis.properties need to be updated to use the SQL Objectstore from the [quick start archetype](../../../getting-started/quickstart-archetype.html).

I did this using the ISIS quickstart version: `0.2.0-incubating`. 

* This is a PostgreSQL example

* In order to use the SQL ObjectStore the following things need to be done once the user has created their new ISIS Application.

* postgresql url base example for (`isis.persistor.sql.jdbc.connection`):  `jdbc:postgresql://host:port/database`


### Update the pom files

Add the following entry in your `projectname-objstore-dflt` POM file

		<dependency>
			<groupId>org.apache.isis.runtimes.dflt.objectstores</groupId>
			<artifactId>sql-impl</artifactId>
		</dependency>

Add the maven dependencies for your Database Drivers entry in your `projectname-objstore-dflt` POM file

		<dependency>
			<groupId>postgresql</groupId>
			<artifactId>postgresql</artifactId>
			<version>9.0-801.jdbc3</version>
		</dependency>


### Update `isis.properties`

In the projectname-webapp project in the `isis.properties` file change the `isis.persistor` property

<pre>
isis.persistor=sql
</pre>


### Configure DB URLs

In the `projectname-webapp` project add the following properties (suitable for your Database Platform):

* You will need to change the connection entry and driver entry to be specific for your database platform drivers and database server location and port.

* if you want ISIS to create your DB tables you will need to use an ID/Password that has table creation rights.

<pre>
isis.persistor.sql.jdbc.driver=org.postgresql.Driver
isis.persistor.sql.jdbc.connection=jdbc:postgresql://127.0.0.1:5432/assignments 
isis.persistor.sql.jdbc.user=postgres
isis.persistor.sql.jdbc.password=TheDatabasePassword

# PostgreSQL ISIS specific data type overides
isis.persistor.sql.datatypes.timestamp=TIMESTAMP
isis.persistor.sql.datatypes.datetime=TIMESTAMP
isis.persistor.sql.datatypes.double=DOUBLE PRECISION
</pre>


### Build

Do a maven clean and install on your main project and run it.  You should see new table(s) created in your database.
