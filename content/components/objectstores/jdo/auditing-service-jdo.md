Title: Auditing Service using JDO (1.1.0-SNAPSHOT)

The JDO objectstore provides a simple implementation of the applib [AuditingService](../../../core/services/auditing-service.html) that simply persists the event data into a `AuditEntry` entity.

> Rather than using an `AuditingService`, you may prefer to use the [Publishing Service](../../../core/services/publishing-service.html), since it is considerably more flexible.  A JDO [implementation](publishing-service-jdo.html) is available.

### Register the Service

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.objectstore.jdo.applib.service.audit.AuditingServiceJdo,\
              ...
</pre>

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...