How to prevent a collection from being modified
-----------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Preventing the user from adding to or removing from a collection is
known as 'disabling' the collection.

The mechanism for disabling a collection is broadly the same as for
disabling a property <!--(see ?)--> or a action <!--(see ?)-->.

### Disabling a collection permanently

Some, though not all, viewers allow the user to directly manipulate the
contents of a collection. For example, the DnD viewer will allow new
objects to be "dropped" into a collection, and existing objects removed
from a collection.

Although it is possible to associate behaviour with such actions (see
?), it may be preferred to only allow modification through actions. Or,
the application may be deployed using a viewer that doesn't fully
support direct manipulation of collections.

In either case, annotate the collection using the `@Disabled`
annotation.

For example:

    public class Order {
        private List<Order> cancelledOrders = new ArrayList<Order>();
        @Disabled
        public List<Order> getCancelledOrders() { ... }
        private void setCancelledOrders(List<Order> cancelledOrders) { ... }
        ...
    }

### Disabling a collection based on the persistence state of the object

As a refinement of the above, a collection may be optionally disabled
using the @Disabled annotation based on the persistence state of the
object:

-   to disable the collection when the object is transient, use
    `@Disabled(When.UNTIL_PERSISTED)`

-   to disable the collection when the object is persistent, use
    `@Disabled(When.ONCE_PERSISTED)`

### Disabling a collection under certain conditions

A `disableXxx()` method can be used to disable a particular instance's
collection under certain conditions:

<!--
The syntax is:

-->

For example:

    public class Department {
        public List<Employee> getEmployees() { ... }
        private void setEmployees(List<Employee> employees) { ... }
        public void disableEmployees() {
            return isClosed()? "This department is closed" : null;
        }
        ...
    }

### Disabling a collection for specific users or roles

It is possible to disable collections for certain users/roles by calling
the DoymainObjectContainer\#getUser() method. <!--See ? for further
discussion.-->

