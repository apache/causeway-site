How to inject services into a domain entity or other service
------------------------------------------------------------

Apache Isis autowires (automatically injects) domain services into each entity, as well as into the domain services themselves, using either method injection or field injection.  The applib `DomainObjectContainer` is also a service, so can be injected in exactly the same manner.

### Method Injection

All that is required to inject a service into a entity/service is to provide an appropriate method or field.  The name
of the method does not matter, only that it is prefixed either "set" or "inject", is
public, and has a single parameter of the correct type.

For example:

    public class Customer {
        private OrderRepository orderRepository;
        public void setOrderRepository(OrderRepository orderRepository) {
            this.orderRepository = orderRepository;
        }
        ...
    }

or alternatively, using 'inject' as the prefix:

    public class Customer {
        private OrderRepository orderRepository;
        public void injectOrderRepository(OrderRepository orderRepository) {
            this.orderRepository = orderRepository;
        }
        ...
    }

Note that the method name can be anything; it doesn't need to be related to the type being injected.

### Field Injection [1.4.0-SNAPSHOT]

Field injection is also supported, using the `javax.inject.Inject annotation`.  For example:

    public class Customer {
        @javax.inject.Inject
        private OrderRepository orderRepository;
        ...
    }

Although this has the least boilerplate, do note that the `private` visibility of the field makes it harder to inject mocks within unit tests.  There are two options here: either use some reflection code to inject the mock (not typesafe/refactoring friendly), or change the visibility to default (package level) visibility and ensure that the unit tests are in the same package as the code under test.

### Constructor injection

Simply to note that constructor injection is *not* supported by Isis (and is unlikely to be, because the JDO specification for entities requires a no-arg constructor).

### Qualified services

Isis currently does not support qualified injection of services; the domain service of each type must be distinct from any other.  

If you find a requirement to inject two instances of type `SomeService`, say, then the work-around is to create trivial subclasses `SomeServiceA` and `SomeServiceB` and inject these instead.