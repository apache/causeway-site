Title: XML Snapshot Service [1.4.0-SNAPSHOT]

The *Apache Isis* framework provides the capability to generate XML snapshots (and if required corresponding XSD schemas) based on graphs of domain objects. 

## API

The API of `XmlSnapshotService` is:

    public interface XmlSnapshotService {
    
        public interface Snapshot {
            public Document getXmlDocument();
            public Document getXsdDocument();
            
            public String getXmlDocumentAsString();    
            public String getXsdDocumentAsString();    
        }
    
        public interface Builder {
            public void includePath(final String path);
            public void includePathAndAnnotation(final String path, final String annotation);
        }
        
        public static class Exception extends RuntimeException { ... }
    
        @Programmatic
        public XmlSnapshotService.Snapshot snapshotFor(final Object domainObject);
    
        @Programmatic
        public XmlSnapshotService.Builder builderFor(final Object domainObject);
    
        public Document asDocument(String xmlStr);
    
        public <T> T getChildElementValue(final Element el, final String tagname, final Class<T> expectedCls);
    
        public Element getChildElement(final Element el, final String tagname);
        
        public String getChildTextValue(final Element el);
    }


where:

* `asDocument()` is a convenience to convert xml string back into a W3C Document
* `getChildElementValue()` is a convenience to extract the value of an XML element, based on its type.
* `getChildElement()` is a convenience method to walk XML document.
* `getChildTextValue()` is a convenience method to obtain value of child text node.


## Usage

### Basic Usage

The most straight-forward usage of this service is simply:

    XmlSnapshot snapshot = xmlsnapshotService.snapshotFor(customer);
    Element customerAsXml = snapshot.getXmlElement();

This will return an XML (document) element that contains the names and values of each
of the customer's value properties, along with the titles of reference properties, and also the number of items in collections.

### Including other Elements

The contents of the snapshot can be adjusted by including "paths" to other references or collections.  To do this, the
builder is used.  We start by obtaining a builder:

    XmlSnapshot.Builder builder = xmlsnapshotService.builderFor(customer);
    
Suppose now that we want the snapshot to also include details of the customer's address, where `address` in this case
is a reference property to an instance of the `Address` class.  We can "walk-the-graph" by including these references within
the builder.

    builder.includePath("address");
    
We could then go further and include details of every order in the customer's `orders` collection, and details of every
product of every order:

    builder.includePath("orders/product");

When all paths are included, then the builder can build the snapshot:

    XmlSnapshot snapshot = builder.build();
    Element customerAsXml = snapshot.getXmlElement();
    
All of this can be strung together in a fluent API:

    Element customerAsXml = xmlsnapshotService.builderFor(customer)
                            .includePath("address")
                            .includePath("orders/product")
                            .build()
                            .getXmlElement();
    
> As you might imagine, the resultant XML document can get quite large very quickly with only a few "include"s.
    
#### Automatically including other elements

If the domain object being snapshotted implements the `SnapshottableWithInclusions` interace, then this moves the
responsibility for determining what is included within the snapshot from the caller to the snapshottable object itself:

    public interface SnapshottableWithInclusions extends Snapshottable {
        List<String> snapshotInclusions();
    }

If necessary, both approaches can be combined.

#### Generating an XSD schema

As well as obtaining the XML snapshot, it is also possible to obtain an XSD schema that the XML snapshot conforms to.

    XmlSnapshot snapshot = ...;
    Element customerAsXml = snapshot.getXmlElement();
    Element customerXsd = snapshot.getXsdElement();

This can be useful for some tools. Note that for the XSD to be correct, the object being snapshotted must have non-null values for the paths that are `include()`'d. If this isn't done then the XSD will not be correct reflect for another snapshotted object that does have non-null values.

### Hints and Tips

As an alternative to using `include()`, you might consider building a view model domain object which can reference only the relevant information required for the snapshot.  For example, if only the 5 most recent Orders for a Customer were required, a `CustomerAndRecentOrders` view model could hold a collection of just those 5 `Order`s.  Typically such view models would implement `SnapshottableWithInclusions`.

One reason for doing this is to provide a stable API between the domain model and whatever it is that might be consuming the XML.  With a view model you can refactor the domain entities but still preserve a view model such that the XML is the same.


### Registering the Service

## Registering the services

Register the concrete implementation (from isis-core) in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.core.runtime.services.xmlsnapshot.XmlSnapshotServiceDefault,\
                  ...

### Related Services

The [memento service](./memento-service.html) also provides a mechanism for generating string representations of domain objects.

The [bookmark service](./bookmark-service.html) provides a mechanism for obtaining a string representations of a single domain object.