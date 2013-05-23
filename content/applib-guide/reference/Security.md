Security Classes
================

> A simple set of classes to represent the currently logged on user and
> their roles.

When the user logs onto an *Isis* application, the framework constructs a
representation of their user and roles using classes from the applib.
This allows the application to inspect and act upon those details if
required.

The user details are captured in the
`org.apache.isis.applib.security.UserMemento` class ("memento" because it
is a snapshot of their credentials at the point of logging on). The
`UserMemento` class defines the following properties:

-   `name` (a `String`)

-   collection of roles (as `RoleMemento`)

The `org.apache.isis.applib.security.RoleMemento` class in turn defines
two properties:

-   `name` (a `String`)

-   `description` (a `String`)

To obtain the current user, the application can call
`DomainObjectContainer#getUser()`. 
