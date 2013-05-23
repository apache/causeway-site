@Bulk
-----

> **Support**
> 
> * Supported by: Wicket viewer; not yet supported by other viewers.

For actions that should only be applied to a collection of objects of
the same type, annotate using @Bulk.

For example:

    public class ToDoItem {
        ...
        @Bulk
        public void markAsCompleted() {
            setCompleted(true);
        }
    }

Bulk actions cannot take arguments, nor can they be hidden, disabled or
have validation rules.
