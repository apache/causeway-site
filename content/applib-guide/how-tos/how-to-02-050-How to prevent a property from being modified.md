How to prevent a property from being modified
---------------------------------------------

Preventing the user from modifying a property value is known as
'disabling' the property. Note that this doesn't prevent the property
from being modified programmatically.

The mechanism for disabling a property is broadly the same as for
disabling a collection <!--(see ?)--> or a collection <!--(see ?)-->.

<!--For control over the entire object, see ?.-->

### Disabling a property permanently

To prevent a user from being able to modify the property at all, use the
`@Disabled` annotation.

For example:

    public class OrderLine {
        private int quantity;
        @Disabled
        public String getQuantity() { ... }
        public void setQuantity(int quantity) { ... }
        ...
    }

Note that a setter is still required; this is used by the framework to
recreate the object when pulled back from the persistent object store.

### Disabling a property based on the persistence state of the object

As a refinement of the above, a property may be optionally disabled
using the @Disabled annotation based on the persistence state of the
object:

-   to disable the property when the object is transient, use
    `@Disabled(When.UNTIL_PERSISTED)`

-   to disable the property when the object is persistent, use
    `@Disabled(When.ONCE_PERSISTED)`

### Disabling a property under certain conditions

A supporting `disableXxx()` method can be used to disable a particular
instance's member under certain conditions

<!--
The syntax is:
-->
>
A non-`null` return value indicates the reason why the property cannot
be modified. The framework is responsible for providing this feedback to
the user.

For example:

    public class OrderLine {
        public String getQuantity() { ... }
        public void setQuantity(int quantity) { ... }
        public String disableQuantity() { 
            if (isSubmitted()) {
                return "Cannot alter any quantity after Order has been submitted"; 
            }
            return null;
        }
    }

If there are multiple reasons to disable a property, take a look at the
`org.apache.isis.applib.util.ReasonBuffer` helper.

### Disabling a property for certain users/roles

It is possible to disable properties for certain users/roles by calling
the DomainObjectContainer\#getUser() method. <!--See ?for further
discussion.-->

