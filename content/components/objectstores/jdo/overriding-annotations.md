Title: Overriding Annotations

The JDO Objectstore (or rather, the underlying DataNucleus implementation) builds its own persistence metamodel by
 reading both annotations on the class and also by searching for metadata in XML files.  The metadata in the XML files
 takes precedence over the annotations, and so can be used to override metadata that is "hard-coded" in annotations.

For example, as of 1.9.0-SNAPSHOT the various [Isis addons](http://www.isisaddons.org) modules (not ASF) use schemas
for each entity.  For example, the `AuditEntry` entity in the [audit module](http://github.com/isisaddons/isis-module-audit)
is annotated as:

    @javax.jdo.annotations.PersistenceCapable(
            identityType=IdentityType.DATASTORE,
            schema = "IsisAddonsAudit",
            table="AuditEntry")
    public class AuditEntry {
        ...
    }

This will map the `AuditEntry` class to a table `"IsisAddonsAudit"."AuditEntry"`; that is using a custom schema to own the object.

Suppose though that for whatever reason we didn't want to use a custom schema but would rather use the default.  We can override
the above annotation using a `package.jdo` file:

    <?xml version="1.0" encoding="UTF-8" ?>
    <jdo xmlns="http://xmlns.jcp.org/xml/ns/jdo/jdo"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/jdo/jdo
            http://xmlns.jcp.org/xml/ns/jdo/jdo_3_0.xsd" version="3.0">

        <package name="org.isisaddons.module.audit.dom">
            <class name="AuditEntry" schema="PUBLIC" table="IsisAddonsAuditEntry">
            </class>
        </package>
    </jdo>

This file should be placed can be placed in `src/main/java/META-INF` within your application's `dom` module.

## Some notes and caveats

* The same approach should work for any other JDO metadata, but some experimentation might be required.  For example, in writing up the above example we found that writing `schema=""` (in attempt to say, "use the default schema") actually caused the original annotation value was used.

* Forcing the schema to "PUBLIC" worked, but it isn't ideal because the name "PUBLIC" is not vendor-neutral (it works for HSQLDB, but MS SQL Server uses "dbo" as its default).

* As of 1.9.0-SNAPSHOT note that Apache Isis will automatically (attempt) to create the owning schema for a given table if it does not exist.  This behaviour can be customized, as described [here](./autocreating-schema-objects.html).

