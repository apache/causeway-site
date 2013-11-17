Title: Auditing Service

The auditing service provides a simple mechanism to capture changes to data.  It is called for each property that has changed on any domain object, as a set of pre- and post-values.

### API

The API for the service is:

    public interface AuditingService2 {
    
        @Hidden
        public void audit(
           String user, long currentTimestampEpoch, 
           String objectType, String identifier, 
           String propertyId, 
           String preValue, String postValue);
      }

> Note that the original API for this service was called `AuditingService`.  This original API has been deprecated because it accidentally omitted the `propertyId` parameter.

### Register the Service

To use, simply register your service implementation as you would any other service, in `isis.properties`:

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              com.mycompany.myapp.isis.MyAuditingService,\
              ...
</pre>


### Existing Implementations

A simple implementation of the service that writes to stderr, is available, useful for debugging:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.applib.services.audit.AuditingService2$Stderr,\
              ...
</pre>


### Limitations

This service is currently only supported when the the [JDO objectstore](../../components/objectstores/jdo/about.html) is configured.


### Alternatives

A similar service that you may prefer to use is the [Publishing Service](publishing-service.html).  While a little more complex, it is also considerably more flexible.
