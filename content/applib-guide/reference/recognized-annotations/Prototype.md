@Prototype
----------

> **Support**
> 
> * Partly supported by: Wicket viewer (equating to Wicket's DEVELOPMENT mode)

The `@Prototype` annotation marks an action method as available in
prototype mode only, and therefore not intended for use in the
production system. A prototype action may or may not also be a debug
action (annotated with `@Debug` <!--, see ?)-->.

For example:

    public class Customer {
        public Order placeNewOrder() { ... }
        @Prototype
        public List<Order> listRecentOrders() { ... }
        ...
    }

See also the @Exploration annotation <!--, ?-->.
