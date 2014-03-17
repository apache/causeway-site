Title: @Exploration

> **Support**
> 
> * Partly supported by: Wicket viewer (equating to Wicket's DEVELOPMENT mode)

The `@Exploration` annotation marks an action method as available in
exploration mode only, and therefore not intended for use in the
production system. 


For example:

    public class Customer {
        public Order placeNewOrder() { ... }
        @Exploration
        public List<Order> listRecentOrders() { ... }
        ...
    }

    
#### See also

See also the [@Prototype](./prototype.html) annotation.
