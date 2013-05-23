How to specify the icon for an individual object's state
--------------------------------------------------------

As discussed elsewhere <!--in ?-->, the `iconName()` method may be used to specify an
object. The value returned from this method need not be static, and so
it can be used to represent the state of an individual object.

For example, an instance of Product could use a photograph of the
product as an icon, using:

    public class Product {
        public String iconName() {
            return "Product-" + getPhotograph();
        }
        ...
    }

Alternatively, an Order might vary the icon according to the status of
the object:

    public class Order {
        public String iconName() {
            return "Order-" + getStatus();
        }
        ...
    }
