How to specify the order in which actions appear on the menu
------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

> This material more-or-less duplicates the information to be found in [here](../components/viewers/wicket/static-layouts.html).

The `@MemberOrder` annotation provides a hint to the viewer as to the
order in which the actions should be displayed.

For example:

    public class Customer {
        @MemberOrder(sequence="3")
        public void placeOrder(Product p) { ... }
        ...

        @MemberOrder(sequence="4")
        public void blackList() { ... }
        ...
    }

The syntax for the `@MemberOrder#sequence` attribute is dewey decimal notation, so "3.5" and
"3.6" come between "3" and "4"; "3.5.1" comes between "3.5" and "3.6".

It is also possible (and common place) to associate actions with either properties or collections.  For example:

    public class Customer {

        @MemberOrder(name="Name", sequence="1")
        public String getFirstName() { ... }

        @MemberOrder(name="Name", sequence="2")
        public String getLastName() { ... }

        @MemberOrder(name="firstName")
        public void changeName(...) { ... }
        ...

        @MemberOrder(sequence="11")
        public Collection<Order> getOrders() { ... }

        @MemberOrder(name="orders", sequence="3")
        public void placeOrder(Product p) { ... }
        ...

    }

will associate the `changeName(...)` action near to the `firstName` property, and the `placeOrder(...)` action near
to the `orders` collection.

An alternative to using annotations is to use [dynamic layouts](../components/viewers/wicket/dynamic-layouts.html),
where the metadata is supplied through an external JSON file.  This has two major advantages: all the metadata resides
in a single location, and also it can be modified and reloaded on-the-fly, providing a much faster feedback loop.
