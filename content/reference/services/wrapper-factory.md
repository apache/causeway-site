Title: Wrapper Factory

The 'wrapper' factory provides the ability to enforce business rules for programmatic interactions between domain objects.  For example, if the calling object attempts to modify an unmodifiable property on the target object, then an exception will be thrown.  Said another way: interactions are performed "as if" they are through the viewer.

This capability goes beyond enforcing the (imperative) constraints within the `hideXxx()`, `disableXxx()` and `validateXxx()` supporting methods; it also enforces (declarative) constraints such as those represented by annotations, eg `@MaxLength` or `@Regex`.

This capability is frequently used within [integration tests](../../core/integtestsupport.html), but can also be used in production code.  (There are analogies that can be drawn here with the way that JEE beans can interact through an EJB local interface).


### In a little more detail

The service works by returning a "wrapper" around a supplied domain object (a CGLIB proxy), and it is this wrapper that ensures hat the hide/disable/validate rules implies by the Isis programming model are enforced.   The wrapper can be interacted with as follows: 

* a get method for properties or collections 
* a set method for properties 
* an addTo or removeFrom method for collections 
* any action 

Calling any of the above methods may result in a (subclass of) `InteractionException` if the object disallows it.  For example, if a property is annotated with `@Hidden` then a `HiddenException` will be thrown. Similarly if an action has a `validateXxx()` method and the supplied arguments are invalid then an `InvalidException` will be thrown. 

In addition, the following methods may also be called: 

* the `title()` method 
* any `defaultXxx()` or `choicesXxx()` method 

An exception will be thrown if any other methods are thrown.


### API

The `WrapperFactory` API is defined as follows:

    @Hidden
    public interface WrapperFactory {

        public static enum ExecutionMode { EXECUTE, NO_EXECUTE }

        public <T> T wrap(T domainObject);
        public <T> T wrap(T domainObject, ExecutionMode mode);
        public <T> T unwrap(T possibleWrappedDomainObject);

        public <T> boolean isWrapper(T possibleWrappedDomainObject);

        public List<InteractionListener> getListeners();
        public boolean addInteractionListener(InteractionListener listener);
        public boolean removeInteractionListener(InteractionListener listener);
        public void notifyListeners(InteractionEvent ev);

    }

where:

* `ExecutionMode` determines whether interactions with the wrapper are 
   actually passed onto the underlying domain object.
* `wrap(...)` returns the wrapper around the underlying domain object (this 
   does nothing if the object has already been wrapped)
* `unwrap(...)` returns the underlying domain object within the wrapper (this 
   does nothing if the object is not a wrapper)

The API also provides the ability to register `InteractionListener`s with the
wrapper.


### Usage

The caller will typically obtain the target object (eg from some repository)
and then use the injected `WrapperFactory` to wrap it before interacting 
with it. 

For example:

    public class CustomerAgent {
    
        public void refundOrder(final Order order) {
            final Order wrappedOrder = wrapperFactory.wrap(order);
            try {
                wrappedOrder.refund();
            } catch(InteractionException ex) {
                container.raiseError(ex.getMessage());
                return;
            }
        }

        ...        
        private WrapperFactory wrapperFactory;    // injected
        private DomainObjectContainer container;  // injected
    }
    
Here the `Order`'s `refund()` action has various business logic.  Rather than
re-implement this logic, the `CustomerAgent` wraps the order in order to interact with it.

### Hints and Tips

The [Exception Recognizers](./exception-recognizers.html) provides the possibility 
to remove the boilerplate; any `InteractionException` could be automatically
recognized and converted into a suitable message.  The calling method could therefore
simply propogate the exception:

For example:

    public class CustomerAgent {
    
        public void refundOrder(final Order order) throws InteractionException {
            wrapperFactory.wrap(order).refund();
        }

        ...        
        private WrapperFactory wrapperFactory;    // injected
    }


> At the time of writing Isis does not provide an out-of-the-box implementation
> of such an `ExceptionRecognizer`; but it should be simple enough to write one...


### Register the Service

Register this service in `isis.properties`, eg:

    isis.services=...,\
                  org.apache.isis.core.wrapper.WrapperFactoryDefault,\
                  ...


### Maven dependencies

Add the following to your application's "dom" module's `pom.xml`:

    <dependency>
        <groupId>org.apache.isis.core</groupId>
        <artifactId>isis-core-wrapper</artifactId>
    </dependency>
