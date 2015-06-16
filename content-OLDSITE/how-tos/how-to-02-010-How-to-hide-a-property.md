How to hide a property
----------------------

[//]: # (content copied to _user-guide_xxx)

The mechanism for hiding a property is broadly the same as for hiding a
collection <!--(see ?)--> or an action <!--(see ?)-->.

<!--
For control over the entire object, see ?.
-->

### Hiding a property always

To prevent a user from viewing a property at all, use the `@Hidden`
annotation. A common use case is to hide an internal Id, eg perhaps as
required by the object store.

For example:

    public class OrderLine {
        private Integer id;
        @Hidden
        public Integer getId() { ... }
        public void setId(Integer id) { ... }
        ...
    }

### Hiding a property based on the persistence state of the object

As a refinement of the above, a property may be optionally hidden using
the @Hidden annotation based on the persistence state of the object:

-   to hide the property when the object is transient, use
    `@Hidden(When.UNTIL_PERSISTED)`

-   to hide the property when the object is persistent, use
    `@Hidden(When.ONCE_PERSISTED)`

### Hiding a property under certain conditions

A `hideXxx()` method can be used to indicate that a particular object's
property should be hidden under certain conditions, typically relating
to the state of that instance.  Returning a value of `true` indicates that the property should be
hidden.

For example:

    public class Order {
        public String getShippingInstructions() { ... }
        public void setShippingInstructions(String shippingInstructions) { ... }
        public boolean hideShippingInstructions() {
            return hasShipped();
        }
        ...
    }

### Hiding a property for specific users or roles

It is also possible to hide properties for certain users/roles by calling the
DomainObjectContainer\#getUser() method. <!-- See ?for further discussion.-->

