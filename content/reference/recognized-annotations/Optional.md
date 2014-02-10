Title: @Optional

By default, the system assumes that all properties of an object are
required, and therefore will not let the user save a new object unless a
value has been specified for each property. Similarly, by default, the
system assumes that all parameters in an action are required and will
not let the user execute that action unless values have been specified
for each parameter.

To indicate that either a property, or an action parameter, is optional,
use the `@Optional` annotation.

> **Note**
>
> The `@Optional`annotation has no meaning for a primitive property (or
> parameter) such as `int` - because primitives will always return a
> default value (e.g. zero). If optionality is required, then use the
> corresponding wrapper class (e.g. `java.lang.Integer`).

### Making a property optional

Annotate the getter to indicate that a property is `@Optional`. For
example:

    public class Order {
        public Product getProduct() { ... }
        
        public java.util.Date getShipDate() { ... }
        public void setShipDate(Date java.util.shipDate) { ... }

        @Optional
        public String getComments() { ... }
        public void setComments(String comments) { ... }
    }

Here the `product` and `shipDate` properties are both required, but the
`comments` property is optional.

### Making an action parameter optional

To indicate that an action may be invoked without having to specify a
value for a particular parameter, annotate with `@Optional`. For
example:

    public class Customer {
        public Order placeOrder(
                Product product
               ,@Named("Quantity") int quantity
               ,@Optional @Named("Special Instructions") String instr) {
            ...
        }
        ...
    }
