Title: @Named

The `@Named` annotation is used when you want to specify the way
something is named on the user interface i.e. when you do not want to
use the name generated automatically by the system. It can be applied to
objects, members (properties, collections, and actions) and to
parameters within an action method.

> **Warning**
>
> Generally speaking it is better to rename the property, collection or
> action. The only common case where `@Named` is common is to rename
> parameters for built-in value types. Even here though a custom value
> type can be defined using `@Value` so that the value type is used as the
> parameter name. `@Named` may also be used if the name needs punctuation
> or other symbols in the name presented to the user.

### Specifying the name of an object

By default the name of an object is derived, reflectively from the class
name. To specify a different name for an object, use the `@Named`
annotation in front of the class declaration.

For example:

    @Named("Customer")
    public class CustomerImpl implements Customer{
       ...
    }

See also the `@Plural` annotation <!--, ?-->.

### Specifying the name of a class member

By default, the name of a class member (a property, collection or
action) presented to the user is derived, reflectively, from the name of
the member defined in the program code. To specify a different name use
the `@Named
          `annotation immediately before the member declaration.

For example:

    public class Customer {
        
        public String getFirstName() { ... }

        
        public String getSurname() { ... }

        public CreditRating getCreditRating() { ... }
    }

Note that the framework provides a separate and more powerful mechanism
for internationalisation.

### Specifying the name for an action parameter

The most common usage of `@Named` is be to specify names for the
parameters of an action. This is because the parameter name declared in
the code for the action method cannot be picked up reflectively (by
default, the user interface will use the type of the parameter as the
name; for a `String` or a `Boolean`, this is almost certainly not what is
required).

To specify the name of a parameter, the `@Named` annotation is applied
'in-line' (i.e. preceding the individual parameter declaration.

For example:

    public class Customer {
        public Order placeOrder(
                Product product
               ,@Named("Quantity")
                int quantity) {
            Order order = newTransientInstance(Order.class);
            order.modifyCustomer(this);
            order.modifyProduct(product);
            order.setQuantity(quantity);        
            return order;
        }
        ...
    }

An alternative is to use a value type (though this introduces additional mapping complexity for both viewers and objectstore) <!--, as described in ?-->.
