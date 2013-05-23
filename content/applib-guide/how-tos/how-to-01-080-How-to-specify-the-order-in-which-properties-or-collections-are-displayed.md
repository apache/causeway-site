How to specify the order in which properties or collections are displayed
-------------------------------------------------------------------------

The `@MemberOrder` annotation provides a hint to the viewer as to the
order in which the properties and collections should appear in the GUI.

For example:

    public class Customer() {
        @MemberOrder("1")
        public String getFirstName() { ... }
        ...

        @MemberOrder("2")
        public String getLastName() { ... }
        ...

        @MemberOrder("3")
        public Collection<Order> getOrders() { ... }
        ...
    }

