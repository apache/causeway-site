Title: Exception Recognizers

The JDO objectstore provides a number of implementations of the applib [ExceptionRecognizer](../../../reference/services/exception-recognizers.html) API that will recognize SQL constraint exceptions and convert them into user-friendly error messages.  The `ExceptionRecognizerCompositeForJdoObjectStore` wraps these up into a single implementation.


### Register the Service

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.exceprecog.ExceptionRecognizerCompositeForJdoObjectStore,\
                  ...

Alternatively, create your own implementations, for example based upon the vagaries of the JDBC driver in use.  More than one implementation of `ExceptionRecognizer` can be registered; all we be checked if an exception is thrown.
