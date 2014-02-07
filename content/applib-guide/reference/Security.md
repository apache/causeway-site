Security Classes
================

> A simple set of classes to represent the currently logged on user and
> their roles.

When the user logs onto an *Isis* application, the framework constructs a
representation of their user and roles using classes from the applib.
This allows the application to inspect and act upon those details if
required.

These can be obtained from the `DomainObjectContainer`:

    final UserMemento user = container.getUser();

The user details are captured in the
`org.apache.isis.applib.security.UserMemento` class ("memento" because it
is a snapshot of their credentials at the point of logging on). 

The roles of the user can be obtained in turn:

    final List<RoleMemento> roles = user.getRoles();

Both `UserMemento` and `RoleMemento` are defined in Isis applib.


### `BackgroundService`s and `CommandContext

If using the [BackgroundService](../../core/services/background-service.html), then it is possible to persist commands that will execute corresponding actions in the background (for example under the control of a scheduler).

In this situation, the `user` obtained from `DomainObjectContainer` will be that of the scheduler process, which may not be what you want.

However, the creator of the background `Command` (the effective user, if you like), *can* be obtained from the `CommandContext` service, using:

    final String userName = commandContext.getCommand().getUser()

> *Note*: At the time of writing, the roles of the effective user are not captured. 