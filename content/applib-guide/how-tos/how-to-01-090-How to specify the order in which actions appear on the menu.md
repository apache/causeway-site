How to specify the order in which actions appear on the menu
------------------------------------------------------------

The `@MemberOrder` annotation provides a hint to the viewer as to the
order in which the actions should be displayed, eg in a menu.

For example:

    public class Customer {
        @MemberOrder("3")
        public void placeOrder(Product p) { ... }
        ...

        @MemberOrder("4")
        public void blackList() { ... }
        ...
    }

The syntax for the @MemberOrder is dewey decimal notation, so "3.5" and
"3.6" come between "3" and "4"; "3.5.1" comes between "3.5" and "3.6".

