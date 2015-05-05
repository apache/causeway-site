Title: @NotPersisted

[//]: # (content copied to _user-guide_xxx)

The `@NotPersisted` annotation indicates that the property is not to be
persisted.

> **Note**
>
> In many cases the same thing can be achieved simply by providing the
> property with a 'getter' but no 'setter'.

For example:

    public class Order {

        @NotPersisted
        public Order getPreviousOrder() {...}
        public void setPreviousOrder(Order previousOrder) {...}

        ...
    }
