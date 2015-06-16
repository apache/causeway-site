How to specify names and/or descriptions for an action parameter
----------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Unlike with properties, the framework cannot pick up the names of
parameters that you use within the domain code. By default parameters
will be labelled only with the type of the object required (e.g.
'String:' or 'Customer:)

If you want a parameter to have a different name (as is usually the case for value types such as strings and ints)
then that parameter should be annotated with the `@Named` annotation (prior to 1.8.0) or its replacement,
the `@ParameterLayout(named=...)` annotation (as of 1.8.0).

Similarly, any parameter may be given a short user-description using the
`@DescribedAs` annotation (prior to 1.8.0) or its replacement, `@ParameterLayout(describedAs=...)`.

For example (as of 1.8.0):

    public class Customer {
        public Order placeOrder(
                Product p,
                @ParameterLayout(
                    named="Quantity",
                    describedAs="The number of units of the specified product in this order"
                )
                int quantity) {
            ...
        }
        ...
    }

or (prior to 1.8.0):

    public class Customer {
        public Order placeOrder(
                Product p,
                @Named("Quantity")
                @DescribedAs("The number of units of the specified product in this order")
                int quantity) {
            ...
        }
        ...
    }

