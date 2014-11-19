Title: Auditing Service

The auditing service provides a simple mechanism to capture changes to data.  It is called for each property that has changed on any domain object, as a set of pre- and post-values.

## API

The API for the service is:

    public interface AuditingService3 {
    
        @Programmatic
        public void audit(
                final UUID transactionId, String targetClassName, final Bookmark target, 
                String memberIdentifier, final String propertyName, 
                final String preValue, final String postValue, 
                final String user, final java.sql.Timestamp timestamp);
      }

> **BREAKING CHANGE!!!** The previous APIs for this service (`AuditingService` and `AuditingService2`) have been removed.  The new API is a superset of these previous APIs.  The change was made so that the auditing service would be consistent with the related [Publishing](./publishing-service.html) and the [Command Context](./command-context.html) services.

## API [1.3.0]

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

## Implementations

For 1.7.0+, please see the [Isis addon audit](http://github.com/isisaddons/isis-module-audit) module.

If you just want to debug (writing to stderr), you can instead configure `org.apache.isis.applib.services.audit.AuditingService3$Stderr`


## Usage

#### Explicitly marking an object as audited

The typical way to indicate that an object should be audited is to annotate it with the [@Audited](../recognized-annotations/Audited.html) annotation, for example:

    @Audited
    public class ToDoItem ... {
        ... 
    }

#### Making auditing the default

As an alternative to annotating every object with `@Audited`, alternatively this can be configured as the default.  Add the following to `isis.properties`:

    isis.services.audit.objects=all 

To prevent an object from being audited (even if globally enabled), use the `@Audited` annotation with the `disabled` attribute:

    @Audited(disabled=true)
    public class NotAuditedObject { ... }

To disable globally, use:    
    
    isis.services.audit.objects=none

If the key is not present in `isis.properties`, then objects are not audited by default.


## Register the Service

See the [Isis addon audit](http://github.com/isisaddons/isis-module-audit) module for details.


### Related Services

A similar service that you may want to use alongside or instead of the auditing service is the [Publishing Service](publishing-service.html).
