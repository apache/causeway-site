Title: Exception Recognizers [1.1.0-SNAPSHOT]

The JDO objectstore provides a number of implementations of the applib [ExceptionRecognizer](../../../core/services/exception-recognizers.html) API that will recognize SQL constraint exceptions and convert them into user-friendly error messages.  The `ExceptionRecognizerCompositeForJdoObjectStore` wraps these up into a single implementation.


### Register the Service

Register like any other service in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.objectstore.jdo.applib.service.exceprecog.ExceptionRecognizerCompositeForJdoObjectStore,\
              ...
</pre>

Alternatively, create your own implementations, for example based upon the vagaries of the JDBC driver in use.  More than one implementation of `ExceptionRecognizer` can be registered; all we be checked if an exception is thrown.
