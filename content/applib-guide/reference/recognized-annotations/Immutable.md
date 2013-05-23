@Immutable
----------

The `@Immutable` annotation may be applied to a class, and indicates to
the framework that the state of such objects may not be changed. The
viewers will prevent any change through the user interface, and moreover
the object stores will reject any changes to the objects that might have
occurred programmatically.

For example:

    @Immutable
    public class Country {
        ...
    }

This annotation can also take a single parameter indicating when it is
to become immutable. For example:

    @Immutable(When.ONCE_PERSISTED)
    public class Email {
        ...
    }

This would allow the user to create an email object and set it up, and
then prevent any changes once it has been saved.

The acceptable values for the parameter are:

-   `When.ALWAYS`

-   `When.NEVER`

-   `When.ONCE_PERSISTED`

-   `When.UNTIL_PERSISTED`

By default the annotated property or action is always immutable (ie
defaults to `When.ALWAYS`).
