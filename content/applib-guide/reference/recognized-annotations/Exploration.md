Title: @Exploration

> **Support**
> 
> * Partly supported by: Wicket viewer (equating to Wicket's DEVELOPMENT mode)

The `@Exploration` annotation marks an action method as available in
exploration mode only, and therefore not intended for use in the
production system. An exploration action may or may not also be a debug
action (annotated with `@Debug`<!--, see ?-->).

For example:

    public class Customer {
        public Order placeNewOrder() { ... }
        @Exploration
        public List<Order> listRecentOrders() { ... }
        ...
    }

See also the <!--@Prototype--> annotation<!--, ?-->.

