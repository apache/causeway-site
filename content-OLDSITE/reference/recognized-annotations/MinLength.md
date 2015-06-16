Title: @MinLength

[//]: # (content copied to _user-guide_xxx)

The `@MinLength` annotation is used to specify the minimum number of characters in a search of an [auto-complete](../../how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html).

For example:

    public ToDoItem add(
            @TypicalLength(20)
            final ToDoItem toDoItem) {
        getDependencies().add(toDoItem);
        return this;
    }
    public List<ToDoItem> autoComplete0Add(
            final @MinLength(2) 
            String search) {
        final List<ToDoItem> list = toDoItems.autoComplete(search);
        list.removeAll(getDependencies());
        list.remove(this);
        return list;
    }
