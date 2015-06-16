How to prevent an action from being invoked
-------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Preventing the user from invoking an action is known as 'disabling' the
action.

The mechanism for disabling an action is broadly the same as for
disabling a property <!--(see ?)--> or a collection <!--(see ?)-->.

### Disabling an action permanently

It is possible to prevent an action from ever being invoked using the `@Disabled` annotation, exactly equivalent to the use of the annotation
for properties and collections. However, it's not a particularly
meaningful usecase: why display an action that can never be invoked? The
only reason we can think of is as a placeholder during prototyping - to
indicate to the user that an action is planned, but has not yet been
implemented.

### Disabling an action based on the persistence state of the object

Whereas annotating an action simply as `@Disabled` probably does not make
sense (see above), it does make sense to optionally disable an action
using the `@Disabled` annotation based on the persistence state of the
object:

-   to disable the action when the object is transient, use
    `@Disabled(When.UNTIL_PERSISTED)`

-   to disable the action when the object is persistent, use
    `@Disabled(When.ONCE_PERSISTED)`

### Based on the state of the object

There may be circumstances in which we do not want the user to be able
to initiate the action at all - for example because that action is not
appropriate to the current state of the object on which the action
resides. Such rules are enforced by means of a `disableXxx()` supporting
method.

The syntax is:

    public String disableActionName(ValueOrEntityType param...)

A non-`null` return `String` indicates the reason why the action may not
be invoked. The framework takes responsibility to provide this feedback
to the user.

For example:

    public class Customer {
        public Order placeOrder(Product p, int quantity) { ... }
        public String disablePlaceOrder(Product p, int quantity) { 
            return isBlackListed()?
                "Blacklisted customers cannot place orders"
                :null;
        }
        ...
    }

### Disabling an action for certain users or roles

It is possible to disable actions for certain users/roles by calling the
DomainObjectContainer\#getUser() method. <!--See ? for further discussion.-->
