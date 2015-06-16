Title: @Audited

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@DomainObject#auditing()](./DomainObject.html).

This annotation, which applies only to objects, indicates that if the
object is modified, then it should be submitted to the
`AuditingService`, if one has been configured.

For example:

    @Audited
    public class Customer extends AbstractDomainObject {
       ....
    }

The `AuditingService` is defined within the applib (in the
`org.apache.isis.applib.services.audit` package):

    public interface AuditingService {
        @Hidden
        public void audit(String user, long currentTimestampEpoch, String objectType, String identifier, String preValue, String postValue);
    }

At the time of writing only the JDO Object Store supported this
annotation. Check with the documentation of the object store or ask on
the mailing list to determine whether auditing is supported for other object stores.
