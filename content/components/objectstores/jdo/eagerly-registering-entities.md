Title: Eagerly Registering Entity Types [1.1.0-SNAPSHOT]

Both Apache Isis and DataNucleus have their own metamodels of the domain entities.  Isis builds its metamodel by walking the graph of types from the services registered in `isis.properties`.  The JDO objectstore then takes these types and registers them with DataNucleus.

In some cases, though, not every entity type is discoverable from the API of the service actions.  This is especially the case if you have lots of subtypes (where the action method specifies only the supertype).  In such cases the Isis and JDO metamodels is built lazily, when an instance of that (sub)type is first encountered.

Isis is quite happy for the metamodel to be lazily created, and - to be fair - DataNucleus also works well in most cases.  In some cases, though, we have found that the JDBC driver (eg HSQLDB) will deadlock if DataNucleus tries to submit some DDL (for a lazily discovered type) intermingled with DML (for updating).

In any case, it's probably not good practice to have DataNucleus work this way.  The `RegisterEntities` service can therefore be registered in order to do the eager registration.  It searches for all `@PersistenceCapable` entities under specified package(s), and registers them all.

> ***We strongly recommend that you register this service 
> as a matter of course***

### Register the Service

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.objectstore.jdo.service.RegisterEntities,\
              ...
</pre>


### Specify the Package Prefix(es)

In the `persistor_datanucleus.properties`, specify the package prefix(es) of your application, to provide a hint for finding the `@PersistenceCapable` classes.  


<pre>
isis.persistor.datanucleus.RegisterEntities.packagePrefix=com.mycompany.dom
</pre>

The value of this property can be a comma-separated list, if you wish.
