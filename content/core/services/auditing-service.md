Title: Auditing Service

The `AuditingService` provides a simple mechanism to capture changes to data.  It is called for each property that has changed on any domain object, as a set of pre- and post-values.

> You may prefer to use the [Publishing Service](publishing-service.html) rather than the Auditing Service, since it is considerably more flexible.

The API for the service is:

<pre>
  public interface AuditingService {
    
    @Hidden
    public void audit(
       String user, long currentTimestampEpoch, 
       String objectType, String identifier, 
       String preValue, String postValue);
  }
</pre>

> This service is currently only supported by the [JDO objectstore](../../components/objectstores/jdo/about.html).

### Register the Service

A simple implementation of the service, that writes to stdout, is available.  Typically though you would write your own implementation.

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.applib.services.audit.AuditingService$Stdout,\
              ...
</pre>
