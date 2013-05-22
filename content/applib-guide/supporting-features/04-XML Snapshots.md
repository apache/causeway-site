XML Snapshots
=============

> Generating XML snapshots from domain objects.

The *Apache Isis* framework provides the capability to generate XML snapshots (and if required corresponding XSD schemas) based on graphs of domain objects. This is done using the
`org.apache.isis.core.runtime.snapshot.XmlSnapshot` class.

Generating an XML Snapshot
--------------------------

The `XmlSnapshot` can be created either directly or using a builder.

### Basic Usage

The standard usage is to instantiate directly.

    XmlSnapshot snapshot = new XmlSnapshot(customer);
    Element customerAsXml = snapshot.getXmlElement();

This will return the Customer's fields, titles of simple references, number of items in collections.

In order to use the `XmlSnapshot`, the domain object must implement `org.apache.isis.applib.snapshot.Snapshottable`. This is just a marker interface.

### Including other Elements

It's also possible to instruct the `XmlSnapshot` to "walk" the object graph and include other information within the generated XML.

For example:

    XmlSnapshot snapshot = new XmlSnapshot(customer);
    snapshot.include("placeOfBirth");   // (1)
    snapshot.include("orders/product"); // (2)
    Element customerAsXml = snapshot.getXmlElement();

In (1), we indicate that we want to also navigate to another domain object represented by simple reference `"placeOfBirth"`; in (2), we indicate that we want to navigate the `"orders"` collection (presumably of `Order`s) and for each referenced `Order`, to navigate in turn its `"product"` reference (presumably to a `Product` class).

Note that `XmlSnapshot` is mutable, in that calls to its `getXmlElement()` may return different XML structures based on whether additional paths have been `include()`d, or whether the state of the domain objects themselves have changed.

Using the Fluent API
--------------------

An `XmlSnapshot` can also be constructed using an alternative "fluent" API:

    XmlSnapshot snapshot = 
         XmlSnapshot.create(customer)
                    .includePath("placeOfBirth")
                    .include("orders/product")
                    .build();
    Element customerAsXml = snapshot.getXmlElement();

The SnapshottableWithInclusions interface
-----------------------------------------

As already mentioned, in order to be snapshotted a domain object must implement the `Snapshottable` interface. This is just a marker interface, so implementing it is trivial.

Alternatively, the domain object can choose to implement the
sub-interface, `SnapshottableWithInclusions`. This moves the
responsibility for determining what is included within the snapshot from the caller to the snapshottable object itself:

    public interface SnapshottableWithInclusions extends Snapshottable {
        List<String> snapshotInclusions();
    }

If necessary, both approaches can be combined.

Generating an XSD schema
------------------------

As well as obtaining the XML snapshot, it is also possible to obtain an XSD schema that the XML snapshot conforms to.

    XmlSnapshot snapshot = ...;
    Element customerAsXml = snapshot.getXmlElement();
    Element customerXsd = snapshot.getXsdElement();

This can be useful for some tools. Note that for the XSD to be correct, the object being snapshotted must have non-null values for the paths that are `include()`'d. If this isn't done then the XSD will not be correct reflect for another snapshotted object that does have non-null values.

Hints and Tips
--------------

As an alternative to using `include()`, you might consider building a non-persisted domain object (a "view model") which can reference only the relevant information required for the snapshot.

For example, if only the 5 most recent Orders for a Customer were required, a `CustomerAndRecentOrders` view model could hold a collection of just those 5 `Order`s.

Typically such view models would implement `SnapshottableWithInclusions`.

