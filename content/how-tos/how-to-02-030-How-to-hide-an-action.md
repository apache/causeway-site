How to hide an action
---------------------

[//]: # (content copied to _user-guide_xxx)

The mechanism for hiding an action is broadly the same as for hiding a
property <!--(see ?)--> or a collection <!--(see ?)-->.

### Hiding an action permanently

To prevent a user from viewing an action at all, use the `@Hidden`
annotation. This is generally used where a `public` method on an object
is not intended to be a user action

For example:

    public class Order {
        @Hidden
        public void markAsCancelled() { ... }
        ...
    }

### Hiding an action based on the persistence state of the object

As a refinement of the above, an action may be optionally hidden using
the @Hidden annotation based on the persistence state of the object:

-   to hide the action when the object is transient, use
    `@Hidden(When.UNTIL_PERSISTED)`

-   to hide the action when the object is persistent, use
    `@Hidden(When.ONCE_PERSISTED)`

### Hiding an action under certain conditions

A `hideXxx()` method can be used to indicate that a particular object's
action should be hidden under certain conditions, typically relating to
the state of that instance.

The parameter types should match the action itself. Returning a 
value of `true` indicates that the action should be hidden.

For example:

    public class Order {
        public void applyDiscount(int percentage) { ... }
        public boolean hideApplyDiscount() {
            return isWholesaleOrder();
        }
    }

### Hiding an action for specific users or roles

It is possible to hide actions for certain users/roles by calling the
DomainObjectContainer\#getUser() method. <!--See ? for further discussion.-->

