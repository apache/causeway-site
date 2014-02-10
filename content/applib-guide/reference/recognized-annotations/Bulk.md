Title: @Bulk

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

Bulk actions cannot (currently) take arguments, nor can they be hidden, disabled or
have validation rules.  What this means is that they perform appropriate checks and guards within the action.

The example given above is probably ok, because `setCompleted()` is most likely idempotent.  However, if the action also called some other method, then we should add a guard.

For example, rather than:

        @Bulk
        public void markAsCompleted() {
            setCompleted(true);
            todoTotalizer.incrementNumberCompleted();
        }

the action should instead be written:
 
        @Bulk
        public void markAsCompleted() {
            if(isCompleted()) {
                return;
            }
            setCompleted(true);
            todoTotalizer.incrementNumberCompleted();
        }
