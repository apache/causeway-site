Title: @DescribedAs

The `@DescribedAs` annotation is used to provide a short description of
something that features on the user interface. How this description is
used will depend upon the viewing mechanism - but it may be thought of
as being like a 'tool tip'.

Descriptions may be provided for objects, members (properties,
collections and actions), and for individual parameters within an action
method. `@DescribedAs` therefore works in a very similar manner to
`@Named` <!--(see ?)-->.

### Providing a description for an object

To provide a description for an object, use the `@DescribedAs`
annotation immediately before the declaration of that object class.

For example:

    @DescribedAs("A customer who may have originally become known to us via " +
                 "the marketing system or who may have contacted us directly.")
    public class ProspectiveSale {
       ...
    }

### Providing a description for an object member

Any member (property, collection or action) may provide a description.
To specify this description, use the `@DescribedAs` annotation
immediately before the declaration of that member.

For example:

    public class Customer {
        @DescribedAs("The name that the customer has indicated that they wish to be " +
                     "addressed as (e.g. Johnny rather than Jonathan)")
        public String getFirstName() { ... }
    }

### Providing a description for an action parameter

To provide a description for an individual action parameter, use the
`@DescribedAs` annotation in-line i.e. immediately before the parameter
declaration.

For example:

    public class Customer {
        public Order placeOrder(
                          Product product,
                          @Named("Quantity")
                          @DescribedAs("The quantity of the product being ordered")
                          int quantity) {
            Order order = createTransientInstance(Order.class);
            order.modifyCustomer(this);
            order.modifyProduct(product);
            order.setQuantity(quantity);        
            return order;
        }
        ...
    }

