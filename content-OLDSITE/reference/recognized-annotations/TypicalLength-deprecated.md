Title: @TypicalLength

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@PropertyLayout#typicalLength()](./PropertyLayout.html) and [@ParameterLayout#typicalLength()](./ParameterLayout.html) or [dynamic layouts](../../components/viewers/wicket/dynamic-layouts.html).

The `@TypicalLength` annotation indicates the typical length of a
`String` property or `String` parameter in an action. It can also be
specified for string-based value types.

The information is generally used by the viewing mechanism to determine
the space that should be given to that property or parameter in the
appropriate view. If the typical length is the same as the `@MaxLength`
<!--(see ?)--> then there is no need to specify `@TypicalLength` as well. If
the value specified is zero or negative then it will be ignored.

For example, for a property:

    public class Customer {
        @MaxLength(30)
        @TypicalLength(20)
        public String getFirstName() { ... }
        public void setFirstName(String firstName) { ... }
    }

Or, for a parameter:

    public class CustomerRepository {
        public Customer newCustomer(
                @TypicalLength(20)
                @Named("First Name") String firstName
               ,@TypicalLength(20)
                @Named("Last Name") String lastName) {
            ...
        }
        ...
    }

Or, for value type:

    @Value(...)
    @TypicalLength(20)
    public class FirstName {
        ...
    }
