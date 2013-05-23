@PublishedObject
----------------

> **Support**
> 
> * Requires the JDO/DataNucleus object store; not yet supported by other object stores.

This annotation on an entity type causes an events to be published by the registered implementation of a `PublishingService` if an instance of that type is inserted, updated or deleted .

A fuller description of the publishing architecture can be found [here](http://isis.apache.org/core/publishing-service.html).
