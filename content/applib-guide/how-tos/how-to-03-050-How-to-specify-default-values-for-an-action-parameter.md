How to specify default values for an action parameter
-----------------------------------------------------

When an action is about to be invoked, then default values can be
provided for any or all of its parameters.

There are two different ways to specify parameters; either per
parameter, or for all parameters.

### Per-parameter syntax (preferred)

The per-parameter form is simpler and generally to be preferred.

The syntax is:

    public ParameterType defaultNActionName()

where N indicates the 0-based parameter number. For example:

    public class Customer {
        public Order placeOrder(
                 Product product,
                 @Named("Quantity") 
                 int quantity) {
            ...
        }
        public Product default0PlaceOrder() {
            return productMostRecentlyOrderedBy(this.getCustomer());
        }
        public int default1PlaceOrder() {
            return 1;
        }
    }

### All parameters syntax

The syntax for specifying all the parameter default values in one go is:

    public Object[] defaultActionName([ValueOrEntityType param]...)

returning an array which must have one element per parameter in the
action method signature of corresponding default values.

For example:

    public class Customer {
        public Order placeOrder(
                Product product,
                @Named("Quantity") 
                int quantity) {
            ...
        }
        public Object[] defaultPlaceOrder() {
            return new Object[] {
                productMostRecentlyOrderedBy(this.getCustomer()),
                1
            };
        }
        ...
    }

Note that the `defaultXxx()` method has no parameters.  This does mean that overloaded actions (more than one action with the same name but differing only in its parameter types) are not supported if using this construct.  This is not advisable in any case, since it would cause confusion to the users when rendered in the UI.