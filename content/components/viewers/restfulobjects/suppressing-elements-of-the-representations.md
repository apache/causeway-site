Title: Suppressing Elements of the Representations

[//]: # (content copied to _user-guide_restful-objects-viewer)

> Enabling these settings makes the representations non-standard with respect to the [Restful Object spec](http://restfulobjects.org).
> In the future the spec may be updated to allow such extensions.


{note
These configuration settings should be considered beta, and are likely to change in the future in response to emerging requirements
}

The representations specified by the [Restful Object spec](http://restfulobjects.org) are very rich in hypermedia 
controls and metadata, intended to support a wide variety of possible REST clients.  However, if an application is 
providing its REST API only for a small well-defined set of REST clients, then it is possible to suppress (remove) 
various elements of these representations.

## Global Configuration

Suppressing of elements can be done using globally using the following properties (typically added to 
`WEB-INF/viewer_restfulobjects.properties`):

    isis.viewer.restfulobjects.suppressDescribedByLinks=true
    isis.viewer.restfulobjects.suppressUpdateLink=true
    isis.viewer.restfulobjects.suppressMemberId=true
    isis.viewer.restfulobjects.suppressMemberLinks=true
    isis.viewer.restfulobjects.suppressMemberExtensions=true
    isis.viewer.restfulobjects.suppressMemberDisabledReason=true

where, respectively, these suppress:

* "describedby" links (on all representations)  
* "update" link (on object representation)
* "id" json-prop for object members (on object representation and member detail representations)
* "links" json-prop for object members (on the object representation and member detail representations)
* "extensions" json-prop for object members (on the object representation and member detail representations)
* "disabledReason" json-prop for object members (on the object representation and member detail representations)

The defaults for all of these is false, meaning that the hypermedia/metadata is NOT suppressed.

## Per request

This is not currently supported (though may be in the future).

## See also

If even simpler representations (of objects) are required, see [here](simplified-object-representation.html).

If complete control over all representations is required, see [here](custom-representations.html). 
