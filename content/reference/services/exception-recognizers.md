Title: Exception Recognizers

The `ExceptionRecognizer` API (in the `org.apache.isis.applib.services.exceprecog` package) provides the mechanism for both the domain programmer and also for components to be able to recognize and handle certain exceptions that may be thrown by the system.

For example, the [JDO Objectstore](../../components/objectstores/jdo/about.html) provides a set of recognizers to recognize and handle SQL constraint exceptions such as uniqueness violations.  These can then be rendered back to the user as expected errors, rather than fatal stacktraces.

The `ExceptionRecognizer` interface is defined as:

<pre>
  public interface ExceptionRecognizer {
      public String recognize(Throwable ex);
  }
</pre>

If the implementation recognizes the exception then it returns a user-friendly message to be rendered (by the viewer) back to the user; otherwise it returns `null`.  There is no need for the implementation to check for exception causes; the casual chain is unwrapped by Isis core and each exception in the chain will also be passed through to the recognizer (from most specific to least).  The recognizer implementation can therefore be as fine-grained or as coarse-grained as it wishes.

Typically implementations of `ExceptionRecognizer` are registered as services (in the `isis.properties` configuration file). More than one recognizer can be registered; all we be checked if an exception is thrown.

> At the time of writing the rendering of the message is only supported by the [Wicket viewer](../../components/viewers/wicket/about.html); check documentation of other viewers to see if they provide this capability.

### Core Implementations

The `DomainObjectContainer` provided by Isis core is itself an `ExceptionRecognizer`, and will handle `ConcurrencyException`s (raised by any objectstore).  No configuration is required to enable this feature (neither can it be disabled).

Other components (such as the JDO Objectstore) may provide `ExceptionRecognizer` implementations; check the documentation for the component.


