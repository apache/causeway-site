Title: Simplified Object Representation (1.8.0)

[//]: # (content copied to _user-guide_xxx)

> Enabling these settings makes the representations non-standard with respect to the [Restful Object spec](http://restfulobjects.org).


{note
These configuration settings should be considered beta, and are likely to change in the future in response to emerging requirements
}

The representations specified by the [Restful Object spec](http://restfulobjects.org) are very rich in hypermedia 
controls and metadata, intended to support a wide variety of possible REST clients.   As described [here](suppressing-elements-of-the-representations.html), it is possible to suppress various elements of these representations.
Even then, though, the representations may be too complex for some bespoke REST clients that require a very "flat"
object representation.

The Restful Objects viewer therefore supports generating a much simpler representation of objects.

## Global Configuration

Configuring the Restful Objects viewer globally to generate the simple object representation is done using the
following property (typically added to `WEB-INF/viewer_restfulobjects.properties`):

    isis.viewer.restfulobjects.objectPropertyValuesOnly=true

This generates a representation such as:

    {
        "title" : "Buy milk due by 2014-10-27",
        "domainType" : "TODO",
        "instanceId" : "L_0",
        "members" : {
            "description" : "Buy milk",
            "category" : "Domestic",
            "subcategory" : "Shopping",
            "complete" : false,
            "versionSequence" : 1,
            "relativePriority" : 2,
            "dueBy" : "2014-10-27",
            "cost" : "0.75",
            "notes" : null,
            "attachment" : null,
            "doc" : null
        },
        "links" : [ 
            {
                "rel" : "self",
                "href" : "http://localhost:8080/restful/objects/TODO/L_0",
                "method" : "GET",
                "type" : "application/json;profile=\"urn:org.restfulobjects:repr-types/object\"",
                "title" : "Buy milk due by 2014-10-27"
            }, 
            {
                "rel" : "describedby",
                "href" : "http://localhost:8080/restful/domain-types/TODO",
                "method" : "GET",
                "type" : "application/json;profile=\"urn:org.restfulobjects:repr-types/domain-type\""
            }
        ],
        "extensions" : {
            "oid" : "TODO:L_0"
        },
    }


## Per request

This is not currently supported (though may be in the future).

## See also

Rather than returning a completely different representation for objects, it is also possible to simply suppress certain elements;
see [here](suppressing-elements-of-the-representation.html).

On the other hand, if complete control over all representations is required, see [here](custom-representations.html). 
