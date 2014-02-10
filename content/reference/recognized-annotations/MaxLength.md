Title: @MaxLength

The `@MaxLength` annotation indicates the maximum number of characters
that the user may enter into a `String` property, or a `String`
parameter in an action, or for a string-based value type. It is ignored
if applied to any other type.

For example, on a property:

    public class Customer {
        @MaxLength(30)
        public String getFirstName() { ... }
        public void setFirstName(String firstName) { ... }
        ...
    }

Or, on an action parameter:

    public class CustomerRepository {
        public Customer newCustomer(
            @MaxLength(30)
            @Named("First Name") String firstName
           ,@MaxLength(30)
            @Named("Last Name") String lastName) {
        ...
    }

Or, for a value type:

    @Value(...)
    @MaxLength(30)
    public class CustomerFirstName {
        ...
    }

If the model is being persisted to a relational database then
`@MaxLength` should be specified for all `String` properties and action
parameters.
