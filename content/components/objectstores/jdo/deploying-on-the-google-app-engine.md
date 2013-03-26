Title: Deploying on the Google App Engine

The Google App Engine (GAE) provides a JDO API, meaning that you can deploy Isis onto GAE using the JDO objectstore.

However, GAE is not an RDBMS, and so there are some limitations that it imposes.  This page gathers together various hints, tips and workarounds.

### Primary Keys and Owned/Unowned Relationships

All entities must have a `@PrimaryKey`.  Within GAE, the type of this key matters.

For an entity to be an aggregate root, (ie a root of an GAE entity group), its key must be a `Long`, eg:

<pre>
    @Persistent(valueStrategy=IdGeneratorStrategy.IDENTITY)
    @PrimaryKey
    private Long id;
</pre>

Any collection that holds this entity type (eg `ToDoItem#dependencies` holding a collection of `ToDoItem`s) should then be annotated with `@Unowned` (a GAE annotation).

If on the other hand you want the object to be owned (through a 1:m relationship somewhere) by some other root, then use a String:

<pre>
@PrimaryKey
@Persistent(valueStrategy = javax.jdo.annotations.IdGeneratorStrategy.IDENTITY)
@Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
private String key;
</pre>

Note: if you store a relationship with a String key it means that the parent object *owns* the child, any attempt to change the relationship raise and exception.

### Custom Types

Currently Isis' `Blob` and `Clob` types and the JODA types (`LocalDate` et al) are *not* supported in GAE.

Instead, GAE defines a [fixed set of value types](https://developers.google.com/appengine/docs/java/datastore/entities#Properties_and_Value_Types), including `BlobKey`.  Members of the Isis community have this working, though I haven't seen the code.

The above notwithstanding, Andy Jefferson at DataNucleus tells us:

> GAE JDO/JPA does support *some* type conversion, because looking at [[1]](http://code.google.com/p/datanucleus-appengine/source/browse/trunk/src/com/google/appengine/datanucleus/StoreFieldManager.java#349) for any field that is Object-based and not a relation nor Serialized it will call [[2]](http://code.google.com/p/datanucleus-appengine/source/browse/trunk/src/com/google/appengine/datanucleus/TypeConversionUtils.java#736) and that looks for a `TypeConverter` (specify `@Extension` with key of "type-converter-name" against a field and value as the `TypeConverter` class) and it should convert it. Similarly when getting the value from the datastore.

We'll update these notes as and when this gets confirmed.
