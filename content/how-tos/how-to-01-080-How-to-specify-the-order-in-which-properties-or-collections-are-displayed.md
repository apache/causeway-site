How to specify the order in which properties or collections are displayed
-------------------------------------------------------------------------

> This material more-or-less duplicates the information to be found in [here](../components/viewers/wicket/static-layouts.html).

The `@MemberOrder` annotation provides a hint to the viewer as to the
order in which the properties and collections should appear in the GUI.

For example:

    public class Customer {
        @MemberOrder(sequence="1")
        public String getFirstName() { ... }
        ...

        @MemberOrder(sequence="2")
        public String getLastName() { ... }
        ...

        @MemberOrder(sequence="3")
        public String getAddressLine1() { ... }
        ...

        @MemberOrder(sequence="4")
        public String getAddressLine2() { ... }
        ...

        @MemberOrder(sequence="5")
        public String getAddressTown() { ... }
        ...

        @MemberOrder(sequence="11")
        public Collection<Order> getOrders() { ... }
        ...
    }

The syntax for the `@MemberOrder#sequence` attribute is dewey decimal notation, so "3.5" and
"3.6" come between "3" and "4"; "3.5.1" comes between "3.5" and "3.6".

It is usual possible to group properties together by specifying the `name` attribute:

    public class Customer {
        @MemberOrder(name="Name", sequence="1")
        public String getFirstName() { ... }
        ...

        @MemberOrder(name="Name", sequence="2")
        public String getLastName() { ... }
        ...

        @MemberOrder(name="Address", sequence="1")
        public String getAddressLine1() { ... }
        ...

        @MemberOrder(name="Address", sequence="2")
        public String getAddressLine2() { ... }
        ...

        @MemberOrder(name="Address", sequence="3")
        public String getAddressTown() { ... }
        ...

        @MemberOrder(sequence="11")
        public Collection<Order> getOrders() { ... }
        ...
    }

Any properties not grouped will reside in the default "General" member (property) group.

The `@MemberGroupLayout` annotation (on the class) in turn specifies the layout of the member (property) groups and collections.

For example:

    @MemberGroupLayout(
        columnSpans={4,0,0,8},
        left={"Name", "Address"},
        middle={},
        right={}
    }

will place the "Name" and "Address" member groups in the first column, and place the collection(s) in the last column.

An alternative to using annotations is to use [dynamic layouts](../components/viewers/wicket/dynamic-layouts.html),
where the metadata is supplied through an external JSON file.  This has two major advantages: all the metadata resides
in a single location, and also it can be modified and reloaded on-the-fly, providing a much faster feedback loop.
