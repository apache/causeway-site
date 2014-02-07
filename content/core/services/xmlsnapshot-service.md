Title: XML Snapshot Service [1.4.0-SNAPSHOT]

> this is a stub

### API


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


### Usage


### Implementation


### Registering the Service


### Related Services

