@FieldOrder
-----------

> **Note**
>
> The recommended mechanism for specifying the order in which fields are
> listed to the user is `@MemberOrder` <!--(see ?)-->

> **Support**
> 
> * Not supported by: Wicket viewer


`@FieldOrder` provides a mechanism to specify the order in which fields
appear in the user interface, in which the order is specified in one
place in the class.

For example:

    @FieldOrder("Name, Address, DateOfBirth, RecentOrders")
    public class Customer {
        public Date getDateOfBirth() {...}
        public List<Order> getRecentOrders() {...}
        public String getAddress() {...}
        public String getName() {...}
        ...
    }

The field names are not case sensitive.

However, `@FieldOrder` is more 'brittle' to change: if you change the
name of an existing property you will need to ensure that the
corresponding name within the `@FieldOrder` annotation is also changed.
