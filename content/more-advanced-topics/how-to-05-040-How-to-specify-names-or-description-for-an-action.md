How to specify names and/or description for an action
-----------------------------------------------------

### Specifying the name for an action

By default the framework will use the action name itself to label the
menu item on the user interface. If you wish to override this, use the
`@Named` annotation on the action.

For example:

    public class Customer {
        @Named("Place Order")
        public void createOrder() { ... }
        ...
    }

### Specifying a description for an action

An additional description can be provided on an action using the
`@DescribedAs` annotation. The framework will take responsibility to
make this description available to the user, for example in the form of
a tooltip.

For example:

    public class Customer {
        @DescribedAs("Places an order, causing a shipping note "+
                     "to be generated and invoice to be dispatched")
        public void createOrder() { ... }
        ...
    }
