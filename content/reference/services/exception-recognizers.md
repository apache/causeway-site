Title: Exception Recognizers

[//]: # (content copied to _user-guide_xxx)

The `ExceptionRecognizer` API (in the `org.apache.isis.applib.services.exceprecog` package) provides the mechanism for 
both the domain programmer and also for components to be able to recognize and handle certain exceptions that may be 
thrown by the system.

For example, the [JDO Objectstore](../../components/objectstores/jdo/about.html) provides a set of recognizers to 
recognize and handle SQL constraint exceptions such as uniqueness violations.  These can then be rendered back to the 
user as expected errors, rather than fatal stacktraces.

## API

The `ExceptionRecognizer` interface is defined as:

    public interface ExceptionRecognizer {
        public String recognize(Throwable ex);
    }

If the implementation recognizes the exception then it returns a user-friendly message to be rendered (by the viewer) 
back to the user; otherwise it returns `null`.  There is no need for the implementation to check for exception causes; 
the casual chain is unwrapped by Isis core and each exception in the chain will also be passed through to the 
recognizer (from most specific to least).  The recognizer implementation can therefore be as fine-grained or as 
coarse-grained as it wishes.

Typically implementations of `ExceptionRecognizer` are registered as services (in the `isis.properties` configuration 
file). More than one recognizer can be registered; all we be checked if an exception is thrown.

## Extended API (1.8.0)

The `ExceptionRecognizer2` interface extends the original `ExceptionRecognizer` interface, being defined as:

    public interface ExceptionRecognizer2 extends ExceptionRecognizer {
    
        public enum Category {
            CONSTRAINT_VIOLATION,
            NOT_FOUND,
            CONCURRENCY,
            CLIENT_ERROR,
            SERVER_ERROR,
            OTHER
        }
    
        public static class Recognition {
            private final Category category;
            private final String reason;
    
            public Recognition(Category category, String reason) {
                this.category = category;
                this.reason = reason;
            }
    
            public Category getCategory() { return category; }
            public String getReason() { return reason; }
        }
    
        public Recognition recognize2(final Throwable ex);
    }

In essence, if an exception is recognized then it is also categorized.  This lets the viewer act accordingly, for 
example to raise a 404 (see 'Support' discussion below).

## Core Implementations

The `DomainObjectContainer` provided by Isis core is itself an `ExceptionRecognizer`, and will handle 
`ConcurrencyException`s (raised by any objectstore).  No configuration is required to enable this feature (neither can 
it be disabled).

The JDO Objectstore (part of core) also provides a number of fine-grained implementations:

* `ExceptionRecognizerForSQLIntegrityConstraintViolationUniqueOrIndexException`
* `ExceptionRecognizerForJDOObjectNotFoundException`
* `ExceptionRecognizerForJDODataStoreException`

These are bundled up into a composite, `ExceptionRecognizerCompositeForJdoObjectStore`.

## Registering the Default Implementation

In most cases you should use the JDO Objectstore's `ExceptionRecognizerCompositeForJdoObjectStore` in your applicatio.
This service has *not* been annotated with `@DomainService` and so requires explicit registration in 
`WEB-INF/isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.exceprecog.ExceptionRecognizerCompositeForJdoObjectStore,\
                  ...

For simple apps this may in fact be the only service registered in `isis.properties`.

> Explicit registration is required primarily to offer maximum flexibility and control.

## Checking for additional exceptions.

If you want to recognize and handle additional exceptions (for example to capture error messages specific to the 
JDBC driver you might be using), then the recommended approach is to:

* create a fine-grained implementation of `ExceptionRecognizer` (or `ExceptionRecognizer2`) for the particular error 
message (there are some convenience implementations of the interface that you can subclass from if required)

* register your implementation in `isis.properties`.  More than one implementation of `ExceptionRecognizer` can be 
  registered; all we be checked if an exception is thrown.

Alternatively, if you prefer to register just a single `ExceptionRecognizer` service class, you could create a 
composite implementation that bundles up your fine-grained implementation; see the above 
`ExceptionRecognizerCompositeForJdoObjectStore` for inspiration.

## Support

In 1.7.0, only the [Wicket viewer](../../components/viewers/wicket/about.html) supported this API.

In 1.8.0, some checking of exception recognizers has moved deeper into core, specifically the (JDO) objectstore.
In particular, if an exception is raised from the loading of an individual object, then this is passed by the
registered ExceptionRecognizers.  If any of these recognize the exception as representing a not-found exception, then
a Isis `ObjectNotFoundException` is raised.  Both the viewers interprets this correctly (the 
[Wicket viewer](../../components/viewers/wicket/about.html) as a suitable error page, the 
[Restful Objects](../../components/viewers/restfulobjects/about.html) viewer as a 404 status return code.
 
