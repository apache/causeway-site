How to pass a messages and errors back to the user
--------------------------------------------------

Sometimes, within an action it is necessary or desirable to pass a
message to the user, for example to inform them of the results of their
action ('5 payments have been issued') or that the action was not
successful ('No Customer found with name John Smith').

`DomainObjectContainer` defines three methods for this purpose:

-   `informUser(String message)`

    Inform the user of some event. The user should not be expected to
    acknowledge the message; typically the viewer will display the
    message for a period of time in a non-modal notification window.

-   `warnUser(String message)`

    Warn the user of some event. Because this is more serious, the
    viewer should require the user to acknowledge the message.

-   `raiseError(String message)`

    Indicate that an application exception has occurred. The viewer
    should again require the user to acknowledge the message, and quite
    possibly indicate further steps that the user should perform (eg
    notify the help desk).


The precise mechanics of how each of these messages is rendered visible
to the user is determined by the viewer being used.


Alternative way to raise an error
---------------------------------

An alternative to calling `DomainObjectContainer#raiseError()` is to simply throw either an `org.apache.isis.applib.ApplicationException` or its superclass, `org.apache.isis.applib.RecoverableException`. Which you use is a matter of style, because the behaviour is exactly the same; internally `raiseError()` just throws the `ApplicationException`.


How to deal with an unrecoverable and unexpected error
------------------------------------------------------

Throw any exception that isn't a subclass of `RecoverableException`

The `org.apache.isis.applib.UnrecoverableException` is provided as a convenient superclass to use, but this is not required.


Handling aborted transactions
-----------------------------

If underlying transaction is aborted by the framework - for example as the result of a constraint violation in the objectstore - then the application code should *not* throw `ApplicationException` (or `RecoverableException`), it should throw some other (non-recoverable) exception.

However, the wrong type of exception being thrown will be automatically detected, and a non-recoverable exception will be thrown instead.