How to specify names and/or descriptions for an action parameter
----------------------------------------------------------------

Unlike with properties, the framework cannot pick up the names of
parameters that you use within the domain code. By default parameters
will be labelled only with the type of the object required (e.g.
'String:' or 'Customer:)

If you want a parameter to have a different name (such as 'First Name',
'Last Name') then that parameter should be marked up with an `@Named`
annotation - very often taking the same form as the parameter name used
in the code. Alternatively though, you could create a user-defined value
type, using `@Value` (see ?).

Similarly, any parameter may be given a short user-description using the
`@DescribedAs` annotation. The framework takes responsibility to make
this available to the user.

For example:

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

