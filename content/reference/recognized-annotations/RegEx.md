Title: @RegEx

The `@RegEx` annotation may be applied to any string property, or to any
parameter within an action method. It can also be applied to any
string-based value type. It serves both to validate and potentially to
normalise the format of the input. `@Regex` is therefore similar in use
to `@Mask` <!--(see ?)--> but provides more flexibility.

The syntax is:

`@RegEx(validation = "regEx string",
        format = "regEx string", caseSensitive =
        <true|false>)`

Only the first parameter is required; the `format` defaults to "no
formatting", and `caseSensitive` defaults to false.

For example, on a property:

    public class Customer {
        @RegEx(validation = "(\\w+\\.)*\\w+@(\\w+\\.)+[A-Za-z]+")
        public String getEmail() {}
        ...
    }

Or, on a parameter:

    public class Customer {
        public void updateEmail(
                @RegEx(validation = "(\\w+\\.)*\\w+@(\\w+\\.)+[A-Za-z]+")
                @Named("Email") String email) {
            ...
        }
        ...
    )

Or, on a value type:

    @Value(...)
    @RegEx(validation = "(\\w+\\.)*\\w+@(\\w+\\.)+[A-Za-z]+")
    public class EmailAddress {
       ...
    }

