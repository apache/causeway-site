Title: @ActionOrder

`@ActionOrder` provides a mechanism to specify the order in which
actions appear in the user interface, in which the order is specified in
one place in the class.

For example:

    @ActionOrder("PlaceNewOrder, CheckCredit")
    public class Customer {

        public Order placeNewOrder() {}

        public CreditRating checkCredit() {}

    ...
    }

The action names are not case sensitive.

Compared to `@MemberOrder`, there is (currently) one additional advantage
in that you can easily specify groupings (which may be rendered by the
viewer as sub-menus). This information may be used by the viewing
mechanism to render actions into sub-menus.

For example:

    @ActionOrder("(Account Management: PlaceOrder, CheckCredit), (Personal Details: ChangeOfAddress, AddEmail)")
    public class Customer {
        public CreditRating checkCredit() { ... }
        public void changeOfAddress() { ... }
        public Order placeNewOrder() { ... }
        public void addEmail(String emailAddress) { ... }
        ...
    }

However, `@ActionOrder` is more 'brittle' to change: if you change the
name of an existing action you will need to ensure that the
corresponding name within the `@ActionOrder` annotation is also changed.  For this reason we recommend you use `@MemberOrder` instead.



