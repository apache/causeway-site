How to write a typical domain service
-------------------------------------

Services consist of a set of logically grouped actions, and as such follow the same conventions as for entities <!--(see ?)-->. However, a service cannot have (persisted) properties, nor can it have (persisted) collections.

For convenience you can inherit from `AbstractService` or one of its subclasses <!--(see ?)-->, but this is not mandatory.

### The getId() method

Optionally, a service may provide a `getId()` method:

    public String getId()

This method returns a logical identifier for a service, independent of its implementation. Currently it used only by perspectives, providing a label by which to record the services that are available for a current user's profile. <!--See ? for more about profiles and perspectives.-->

### (Suppressing) contributed actions

Any n-parameter action provided by a service will automatically be contributed to the list of actions for each of its (entity) parameters. From the viewpoint of the entity the action is called a contributed action.

For example, given a service:

    public interface Library {
        public Loan borrow(Loanable l, Borrower b);
    }

and the entities:

    public class Book implements Loanable { ... }y

and

    public class LibraryMember implements Borrower { ... }

then the `borrow(...)` action will be contributed to both `Book` and to `LibraryMember`.

This is an important capability because it helps to decouple the concrete classes from the services.

If necessary, though, this behaviour can be suppressed by annotating the service action with  `@org.apache.isis.applib.annotations.NotContributed`.

For example:

    public interface Library {
        @NotContributed
        public Loan borrow(Loanable l, Borrower b);
    }

If annotated at the interface level, then the annotation will be inherited by every concrete class. Alternatively the annotation can be applied at the implementation class level and only apply to that particular implementation.

Note that an action annotated as being `@NotContributed` will still appear in the service menu for the service. If an action should neither be contributed nor appear in service menu items, then simply annotate it as `@Hidden`.

### (Suppressing) service menu items

By default every action of a service (by which we also mean repositories and factories) will be rendered in the viewer, eg as a menu item for that service menu. This behaviour can be suppressed by annotating the action using `@org.apache.isis.applib.annotations.NotInServiceMenu`.

For example:

    public interface Library {
        @NotInServiceMenu
        public Loan borrow(Loanable l, Borrower b);
    }

Note that an action annotated as being `@NotInServiceMenu` will still be contributed. If an action should neither be contributed nor appear in service menu items, then simply annotate it as `@Hidden`.

Alternatively, this can be performed using a supporting method:

    public class LibraryImpl implements Library {
        public Loan borrow(Loanable l, Borrower b) { ... }
        public boolean notInServiceMenuBorrow() { ... }
    }

### (Suppressing) service menus

If none of the service menu items should appear, then the service itself should be annotated as `@Hidden`.

For example:

    @Hidden
    public interface EmailService {
        public void sendEmail(String to, String from, String subject, String body);
        public void forwardEmail(String to, String from, String subject, String body);
    }

