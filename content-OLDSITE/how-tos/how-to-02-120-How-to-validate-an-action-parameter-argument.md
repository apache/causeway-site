How to validate an action parameter argument
--------------------------------------------

[//]: # (content copied to _user-guide_xxx)

### Declarative validation

For parameters that accept a text input string, such as `String` and
`Date`, there are convenient mechanisms to validate and/or normalise the
values typed in:

-   For `Date` and number values the `@Mask` annotation may be used.

-   For `String` parameters the `@RegEx` annotation may be used.

More complex validation can also be performed imperatively (below).

### Imperative validation

A `validateXxx()` method is used to check that the set of arguments used
by an action method is valid. If the arguments are invalid then the
framework will not invoke the action.

The syntax is:

    public String validate<ActionName>([ValueOrEntityType param]...)

A non-`null` return String indicates the reason why the member cannot be
modified/action be invoked, and the viewing mechanism will display this
feedback to the user.

For example:

    public class Customer {
        public Order placeOrder(Product p, int quantity) { ... }
        public String validatePlaceOrder(Product p, int quantity) {
            if (p.isOutOfStock()) { return "Product is out of stock"; }
            if (quantity <= 0) { return "Quantity must be a positive value"; }
            return null;
        }
        ...
    }

For complex validation, you may wish to use the
`org.apache.isis.applib.util.ReasonBuffer` helper class.

