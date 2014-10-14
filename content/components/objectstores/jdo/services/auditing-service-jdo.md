Title: Auditing Service using JDO

{note
In 1.6.0 this implementation was released as *org.apache.isis.core:isis-module-audit-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-audit) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-audit) implementation is released.**
}

The JDO objectstore provides a simple implementation of the applib [AuditingService](../../../../reference/services/auditing-service.html) that simply persists the event data into a `AuditEntryJdo` entity.  This is mapped to an `IsisAuditEntry` table.

> Rather than using an `AuditingService`, you may prefer to use the [Publishing Service](../../../../reference/services/publishing-service.html), since it is considerably more flexible.  A JDO [implementation](./publishing-service-jdo.html) is available.

### Register the Service

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.audit.AuditingServiceJdo,\
                  ...

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...
