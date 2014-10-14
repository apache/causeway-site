Title: Publishing Service using JDO

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-publishing-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-publishing) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-publishing) implementation is released.**
}

The JDO objectstore provides a simple implementation of the applib [PublishingService](../../../../reference/services/publishing-service.html) that simply persists the event data into a `PublishedEvent` entity.

Along with the event data, the `PublishedEvent` also includes a status property with two values: `QUEUED` and `PROCESSED`.  The service also acts as a repository to search for all unprocessed events.

The intention is for an event service bus (eg [Apache ServiceMix](http://servicemix.apache.org)) to poll for unprocessed events, either directly to the database, or using the Restful Objects API.  Once processed, then the status can be updated.

Although a polling architecture introduces some overhead, it avoids the complexity of XA/JTA transactions which would otherwise be needed to ensure that events are only published atomically with committed changes to the database.

## Configuration (v1.5.0 onwards)

The `PublishedEvent` entity can either persist the serialized form of the event as a zipped byte array or as a CLOB.  Which is used is determined by a configuration setting (typically stored in `persistor_datanucleus.properties`, but `isis.properties` can also be used):

    # whether to persist the event data as a "clob" or as a "zipped" byte[]
    isis.persistor.datanucleus.PublishingService.serializedForm=clob

If not specified, then "zipped" is the default.

## Register the Service

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.publish.PublishingServiceJdo,\
                  ...

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...


## Related projects

Dan Haywood's [camel-isis-pubsubjdo](https://github.com/danhaywood/camel-isis-pubsubjdo) project up on github shows how to poll and process the persisted `PublishedEvent` table using [Apache Camel](http://camel.apache.org).
