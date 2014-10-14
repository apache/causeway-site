Title: 'Are you sure?' idiom
----------

If providing an action that will perform irreversible changes, include a
mandatory boolean parameter that must be explicitly checked by the end-user
in order for the action to proceed.

## Screenshots

For example:

<img src="images/are-you-sure.png"/>

If the user checks the box:

<img src="images/are-you-sure-happy-case.png"/>

then the action will complete.

However, if the user fails to check the box, then a validation message is shown:

<img src="images/are-you-sure-sad-case.png"/>

## Code example

The code for this is pretty simple:

    public List<ToDoItem> delete(@Named("Are you sure?") boolean areYouSure) {
        
        container.removeIfNotAlready(this);

        container.informUser("Deleted " + container.titleOf(this));
        
        // invalid to return 'this' (cannot render a deleted object)
        return toDoItems.notYetComplete(); 
    }
    public String validateDelete(boolean areYouSure) {
        return areYouSure? null: "Please confirm you are sure";
    }

Note that the action itself does not use the boolean parameter, it is only
used by the supporting `validate` method.