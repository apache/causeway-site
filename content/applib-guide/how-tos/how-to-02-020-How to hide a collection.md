How to hide a collection
------------------------

The mechanism for hiding a collection is broadly the same as for hiding
a property <!--(see ?)--> or an action <!--(see ?)-->.

### Hiding a collection permanently

To prevent a user from viewing a collection at all, use the `@Hidden`
annotation.

For example:

    public class Order {
        private List<Order> cancelledOrders = new ArrayList<Order>();
        @Hidden
        public List<Order> getCancelledOrders() { ... }
        private void setCancelledOrders(List<Order> cancelledOrders) { ... }
        ...
    }

### Hiding a collection based on the persistence state of the object

As a refinement of the above, a collection may be optionally hidden
using the @Hidden annotation based on the persistence state of the
object:

-   to hide the collection when the object is transient, use
    `@Hidden(When.UNTIL_PERSISTED)`

-   to hide the collection when the object is persistent, use
    `@Hidden(When.ONCE_PERSISTED)`

### Hiding a collection under certain conditions

A `hideXxx()` method can be used to indicate that a particular object's
collection should be hidden under certain conditions, typically relating
to the state of that instance.  Returning a value of `true` indicates that the collection should be
hidden.

For example:

    public class Order {
        @Hidden
        public List<Order> getRushOrders() { ... }
        ...
    }

### Hiding a collection for specific users or roles

It is possible to hide collections for certain users/roles by calling
the DomainObjectContainer\#getUser() method. <!--See ? for further
discussion.-->

