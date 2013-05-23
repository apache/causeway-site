@NotPersistable
---------------

> **Support**
> 
> * Not supported by: Wicket viewer

The `@NotPersistable` annotation indicates that transient instances of
this class may be created but may not be persisted. The framework will
not provide the user with an option to 'save' the object, and attempting
to persist such an object programmatically would be an error.

For example:

    public class InputForm {
        // members and actions here
    }

This annotation can also take a single parameter indicating whether it
is only the user that cannot persist the object, for example the
following code would prevent the user from saving the object (via the
viewer) but still allow the program to persist the object.

For example:

    @NotPersistable(By.USER)
    public class InputForm {
        ...
    }

The acceptable values for the parameter are:

-   `By.USER`

-   `By.USER_OR_PROGRAM`

By default the annotated object is effectively transient (ie default to
`By.USER_OR_PROGRAM`).