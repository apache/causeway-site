Title: Lazy Loading

By default, collections all rendered lazily and are thus also loaded lazily from the database.

However, even in the case of collections that have annotated with `@CollectionLayout(render=RenderType.EAGERLY)` (or equivalently in `.layout.json` file, or using the now deprecated `@Render(Type.EAGERLY)`, these should probably still be lazily loaded.  Otherwise, there will always be an unnecessary cost when rendering the object in a table.

For example, in the `ToDoItem` (in the [todoapp example](https://github.com/isisaddons/isis-app-todoapp/blob/61b8114a8e01dbb3c380b31cf09eaed456407570/dom/src/main/java/todoapp/dom/module/todoitem/ToDoItem.java) (non-ASF)) the `dependencies` collection is as follows:

    @javax.jdo.annotations.Persistent(table="ToDoItemDependencies")
    @javax.jdo.annotations.Join(column="dependingId")
    @javax.jdo.annotations.Element(column="dependentId")

    private Set<ToDoItem> dependencies = new TreeSet<>();

    @Collection()
    @CollectionLayout(
        render = RenderType.EAGERLY // actually, is declared in ToDoItem.layout.json file
    )
    public Set<ToDoItem> getDependencies() {
        return dependencies;
    }

Even though the Isis annotations state to render the collection eagerly, the JDO `@javax.jdo.annotations.Persistent` annotation leaves the `defaultFetchGroup` as its default, which for collections is "false".  The net result is that when Isis does request the collection to be resolved when rendering the collection, JDO will need to perform an additional query to obtain the contents.
