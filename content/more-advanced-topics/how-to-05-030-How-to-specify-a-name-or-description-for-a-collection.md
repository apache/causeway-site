How to specify a name and/or description for a collection
---------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

### Specifying the name for a collection

By default the framework will use the collection name itself to label
the collection on the user interface. If you wish to override this, use
the `@Named` annotation on the collection.

For example:

    public class Customer {
        @Named("Placed Orders")
        public List<Order> getOrders() { ... }
        ...
    }

### Specifying a description for a collection

An additional description can be provided on a collection using the
`@DescribedAs` annotation. The framework will take responsibility to
make this description available to the user, for example in the form of
a tooltip.

For example:

    public class Customer {
        @DescribedAs("Those orders that have been placed (and possibly shipped) " + 
                     "by this customer given name by which this customer is known")
        public List<Order> getOrders() { ... }
        ...
    }

