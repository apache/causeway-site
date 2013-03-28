Title: Publishing Service using JDO (1.1.0-SNAPSHOT)

The JDO objectstore provides a simple implementation of the applib [PublishingService](../../../core/services/publishing-service.html) that simply persists the event data into a `PublishedEvent` entity.

Along with the event data, the `PublishedEvent` also includes a status property with two values: `QUEUED` and `PROCESSED`.  The service also acts as a repository to search for all unprocessed events.

The intention is for an event service bus (eg [Apache ServiceMix](http://servicemix.apache.org)) to poll for unprocessed events, either directly to the database, or using the Restful Objects API.  Once processed, then the status can be updated.

Although a polling architecture introduces some overhead, it avoids the complexity of XA/JTA transactions which would otherwise be needed to ensure that events are only published atomically with committed changes to the database.

### Register the Service

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.objectstore.jdo.applib.service.publish.PublishingServiceJdo,\
              ...
</pre>

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...
