Title: Memento Service

The `MementoService` was originally introduced to simplify the implementation of [ViewModel](../../more-advanced-topics/ViewModel.html)s, which are required to return a string representation of all of their backing state, moreover which is safe for use within a URL.

However, it can also be used to create a memento of arbitrary objects.  Indeed, it is used internally by the core implementation of [BackgroundService](./background-service.html) for capture the state of action invocations so that they can be executed by a background process.


###API

The API defined by `MementoService` is:

    public interface MementoService {
    
        public static interface Memento {
            @Programmatic
            public Memento set(String name, Object value);    
            @Programmatic
            public <T> T get(String name, Class<T> cls);
            @Programmatic
            public String asString();
            public Set<String> keySet();
        }
        
        @Programmatic
        public Memento create();
    
        @Programmatic
        public Memento parse(final String str);
    
        @Programmatic
        public boolean canSet(Object input);
    }

The types of objects that are supported by the `MementoService` are implementation-specific, but would typically include all the usual value types as well as Isis' `Bookmark` class (to represent references to arbitrary entities).    Nulls can also be set.

In the case of the default implementation provided by the core framework, the types supported are:

* `String`
* `boolean, `Boolean`
* `byte`, `Byte`
* `short`, `Short`
* `int`, `Integer`
* `long`, `Long`
* `float`, `Float`
* `double`, `Double`
* `java.math.BigDecimal`
* `java.math.BigInteger`
* `org.joda.time.LocalDate`
* `org.apache.isis.applib.services.bookmark.Bookmark`

If using another implementation, the `canSet(...)` method can be used to check if the candidate object's type is supported.


###Usage

To use in your code, simply declare the service and annotate with `@javax.inject.Inject`.  For example:

<pre>
import org.apache.isis.applib.services.memento.MementoService;

public class MyEntity {


    javax.inject.Inject
    private MementoService mementoService;
}
</pre>

###Implementations

The core framework provides a default implementation of this API:

* `org.apache.isis.core.runtime.services.memento.MementoServiceDefault`

Because the string representation of the `Memento` must be URL-safe, the default implementation returns a base-64 URL encoded representation of the underlying format (an XML string).


In fact, the `MementoServiceDefault` implementation does provide a mechanism to disable the URL encoding, but this is not part of the `MementoService` public API.  Note also that the encoding method is not pluggable.

However, you are of course free to write some other implementation of `MementoService`, perhaps based on `MementoServiceDefault` code if you wish.


### Related Services

The memento service is used by the [CommandContext](./command-context.html) service and also [BackgroundCommandService](./background-service.html).  These both use a memento to capture a representation of an action invocation.



### Register the Service

As of 1.6.0, the `MementoServiceDefault` service is automatically registered and available for injection (it is annotated with `@DomainService`).

Prior to 1.6.0, it was necessary to register the service in `isis.properties`.



