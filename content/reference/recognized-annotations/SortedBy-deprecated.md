Title: @SortedBy

> Deprecated, use instead [@CollectionLayout#sortedBy](./CollectionLayout.html).

The `@SortedBy` annotation is an instruction hint for (`SortedSet`) collections to use the specified comparator rather than the natural ordering of the entity
(as would usually be the case).

For example, this is taken from the [quickstart archetype](../../../getting-started/quickstart-archetype.html):


    public class ToDoItem implements Comparable<ToDoItem> {

        ...
        public static class DependenciesComparator implements Comparator<ToDoItem> {
            @Override
            public int compare(ToDoItem p, ToDoItem q) {
                return ORDERING_BY_DESCRIPTION
                        .compound(Ordering.<ToDoItem>natural())
                        .compare(p, q);
            }
        }

        ...    
        @SortedBy(DependenciesComparator.class)
        public SortedSet<ToDoItem> getDependencies() { ... }


        public int compareTo(final ToDoItem other) {
            return ORDERING_BY_COMPLETE
                    .compound(ORDERING_BY_DUE_BY)
                    .compound(ORDERING_BY_DESCRIPTION)
                    .compare(this, other);
        }
        ...
    }

When the `dependencies` collection is rendered, the elements are sorted by the `description` property first:

![](images/sortedby-dependencies.png)

Without this annotation, the order would have been inverted (because the natural ordering places items not completed before those items that have been completed.
