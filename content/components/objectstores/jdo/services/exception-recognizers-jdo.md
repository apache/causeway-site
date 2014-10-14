Title: Exception Recognizers

The JDO objectstore provides a number of implementations of the applib [ExceptionRecognizer](../../../../reference/services/exception-recognizers.html) API that will recognize SQL constraint exceptions and convert them into user-friendly error messages.  The `ExceptionRecognizerCompositeForJdoObjectStore` wraps these up into a single implementation.

## Register the Service

These service must be registered in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.exceprecog.ExceptionRecognizerCompositeForJdoObjectStore,\
                  ...

(In many cases this will be the only service registered in `isis.properties`).

## Checking for additional exceptions.

If you want to recognize and handle additional exceptions (for example to capture error messages specific to the JDBC driver you might be using), then the recommended approach is to:
* create a fine-grained implementation of `ExceptionRecognizer` for the particular error message (there are some convenience implementations of the interface that you can subclass from if required)
* register your implementation in `isis.properties`.  More than one implementation of `ExceptionRecognizer` can be registered; all we be checked if an exception is thrown.

Alternatively, if you prefer to register just a single `ExceptionRecognizer` service class, you could create a composite implementation that bundles up your fine-grained implementation; see the above `ExceptionRecognizerCompositeForJdoObjectStore` for inspiration.


