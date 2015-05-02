Title: Autocreating Schema Objects (1.9.0-SNAPSHOT)

[//]: # (content copied to user-guide_how-tos_using-modules)

We use Java packages as a way to group related domain objects together; the package name forms a namespace.  We can then
reason about all the classes in that package/namespace as a single unit.  Good examples are the various
[Isis Addons](http://github.com/isisaddons) (not ASF): security, commands, auditing and so on.

In the same way that Java packages act as a namespace for domain objects, it's good practice to map domain entities to
their own (database) schemas.  As of 1.9.0-SNAPSHOT, all the IsisAddons modules do this, for example:

    @javax.jdo.annotations.PersistenceCapable( ...
            schema = "isissecurity",
            table = "ApplicationUser")
    public class ApplicationUser ... { ... }

and

    @javax.jdo.annotations.PersistenceCapable( ...
            schema = "isisaudit",
            table="AuditEntry")
    public class AuditEntry ... { ... }

This results in `CREATE TABLE` statements such as:

    CREATE TABLE IsisAddonsSecurity."ApplicationUser" (
        ...
    )

and

    CREATE TABLE IsisAddonsSecurity."ApplicationUser" (
        ...
    )

> If you don't want to use schemas, then note that the JDO annotations can be overridden by providing XML metadata;
> see [here](./overriding-annotations.html) for a write-up of how to do this.

## Listener to create DB schema objects

Unfortunately JDO/DataNucleus does not automatically create these schema objects, but it *does* provide a listener
on the initialization of each class into the JDO metamodel.  Apache Isis attaches a listener,
`CreateSchemaObjectFromClassMetadata`, that checks for the schema's existence, and creates the schema if required.

The guts of its implementation is:

    package org.apache.isis.objectstore.jdo.datanucleus;

    public class CreateSchemaObjectFromClassMetadata
            implements MetaDataListener,
                       PersistenceManagerFactoryAware,
                       DataNucleusPropertiesAware {

        @Override
        public void loaded(final AbstractClassMetaData cmd) { ... }

        protected String buildSqlToCheck(final AbstractClassMetaData cmd) {
            final String schemaName = schemaNameFor(cmd);
            return String.format("SELECT count(*) FROM INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME = '%s'", schemaName);
        }

        protected String buildSqlToExec(final AbstractClassMetaData cmd) {
            final String schemaName = schemaNameFor(cmd);
            return String.format("CREATE SCHEMA \"%s\"", schemaName);
        }
    }

This implementation works for HSQLDB, PostgreSQL and MS SQL Server, but has not been tested on other RDBMS vendors.

## Registering an Alternative Implementation

An alternative implementation can be registered and used through the following key in `WEB-INF/persistor_datanucleus.properties` (you could also put it in `isis.properties` if you prefer):

    #
    # hook to perform additional initialization when JDO class metadata is loaded
    # default implementation will attempt to run 'create schema' for the specified schema.
    #
    #isis.persistor.datanucleus.classMetadataLoadedListener=org.apache.isis.objectstore.jdo.datanucleus.CreateSchemaFromClassMetadata

Although not formal API, the default `CreateSchemaFromClassMetadata` has been designed to be easily overrideable if you
need to tweak it to support other RDBMS'.  Any implementation must implement `org.datanucleus.metadata.MetaDataListener`:

    public interface MetaDataListener {
        void loaded(AbstractClassMetaData cmd);
    }

and can optionally implement `org.apache.isis.objectstore.jdo.datanucleus.PersistenceManagerFactoryAware`:

    public interface PersistenceManagerFactoryAware {
        public void setPersistenceManagerFactory(final PersistenceManagerFactory persistenceManagerFactory);
    }

and also `org.apache.isis.objectstore.jdo.datanucleus.DataNucleusPropertiesAware`:

    public interface DataNucleusPropertiesAware {
        public void setDataNucleusProperties(final Map<String, String> properties);
    }

which provides access to the properties passed through to JDO/DataNucleus.  Often though you should find simply
overriding `buildSqlToCheck(...)` and `buildSqlToExec(...)` should suffice.

And, if you do extend the class, please [contribute back](https://issues.apache.org/jira/browse/ISIS) your improvements.