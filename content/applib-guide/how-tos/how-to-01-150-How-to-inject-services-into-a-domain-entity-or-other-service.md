How to inject services into a domain entity or other service
------------------------------------------------------------

All that is required to inject a service into an entity (or indeed into
another service) is to provide an appropriately typed setter. The name
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

Note that we consider `DomainObjectContainer` to be a service too; hence
it can be injected in exactly the same manner.
