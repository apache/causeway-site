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

    Indicate that a serious application error has occurred. The viewer
    should again require the user to acknowledge the message, and quite
    possibly indicate further steps that the user should perform (eg
    notify the help desk).

    In this last case, no changes will be made to any objects (the
    transaction is aborted).

The precise mechanics of how each of these messages is rendered visible
to the user is determined by the viewer being used.

