Title: Lazy Loading

By default, collections all rendered lazily and are thus also loaded lazily from the database.

However, even in the case of collections that have annotated with `@Render(Type.EAGERLY)`, these should probably still be lazily loaded.  Otherwise, there will always be an unnecessary cost when rendering the object in a table.

For example, in the `ToDoItem` (in the [wicket/restful/jdo archetype](../../../getting-started/quickstart-archetype.html)) the `dependencies` collection is as follows:

<pre>
  @javax.jdo.annotations.Persistent(table="TODO_DEPENDENCIES")
  @javax.jdo.annotations.Join(column="DEPENDING_TODO_ID")
  @javax.jdo.annotations.Element(column="DEPENDENT_TODO_ID")
  private SortedSet<ToDoItem> dependencies = new TreeSet<ToDoItem>();

  @Disabled
  @MemberOrder(sequence = "1")
  @Render(Type.EAGERLY)
  public SortedSet<ToDoItem> getDependencies() {
    return dependencies;
  }
  public void setDependencies(final SortedSet<ToDoItem> dependencies) {
    this.dependencies = dependencies;
  }
</pre>

Even though `@Render(Type.EAGERLY)`, the `@javax.jdo.annotations.Persistent` annotation leaves the `defaultFetchGroup` as its default, which for collections is "false".
