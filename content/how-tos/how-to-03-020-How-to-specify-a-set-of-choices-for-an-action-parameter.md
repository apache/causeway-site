How to specify a set of choices for an action parameter
-------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

The programmer may provide a set of choices for the value of any or all
of the parameters of an action. These will be made available to the user
- for example as a drop-down list.

If the type of the parameter is annotated with `@Bounded`, then it is
not necessary to specify the choices for that parameter, as the user
will automatically be offered the full set to choose from.

If this isn't the case, then - as for defaults - there are two different
ways to specify parameters; either per parameter, or for all parameters.

> **Note** Dependent choices, whereby the values are dependent on another action parameter, are [also supported](how-to-03-022-How-to-specify-dependent-choices-for-action-parameters.html).

### Per parameter syntax (preferred)

The per-parameter form is simpler and generally preferred.

The syntax is:

    public List<ParameterType> choicesNActionName()

where N indicates the 0-based parameter number.  Any subtype of `Collection` may also be used.

For example:

    public class Order {
        public Order placeOrder(
                Product product,
                @Named("Quantity") 
                int quantity) {
            ...
        }
        public List<Product> choices0PlaceOrder() {
            return lastFiveProductsOrderedBy(this.getCustomer());
        }
        public List<Integer> choices1PlaceOrder() {
            return Arrays.asList(1,2,3,4,5);
        }
        ....
    }

### All parameters syntax

The alternative mechanism is to supply all the parameter choices in one
go:

    public Object[] choices<ActionName>([<parameter type> param]...)

returning an array, which must have one element per parameter in the
method signature. Each element of the array should itself either be an
array or a list, containing the set of values representing the choices
for that parameter, or `null` if there are no choices to be specified
for that parameter.

For example:

    public class Order {
        public Order placeOrder(
                Product product,
                @Named("Quantity") 
                int quantity) {
            ...
        }
        public Object[] choicesPlaceOrder(
                Product product,
                int quantity) {
            return new Object[] {
                lastFiveProductsOrderedBy(this.getCustomer()).toArray(), 
                Arrays.asList(1,2,3,4,5)
            };
        }
        ...
    }

