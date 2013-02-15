Title: Dates, Blobs and Lazy Loading

### Joda Dates

Isis' JDO objectstore bundles DataNucleus' [built-in support](http://www.datanucleus.org/plugins/store.types.jodatime.html) for Joda `LocalDate` and `LocalDateTime` datatypes, meaning that entity properties of these types will be persisted as appropriate data types in the database tables.

It is, however, necessary to annotate your properties with `@javax.jdo.annotations.Persistent`, otherwise the data won't actually be persisted.  (See the [JDO docs](http://db.apache.org/jdo/field_types.html) for more details on this).

Moreover, these datatypes are *not* in the default fetch group, meaning that JDO/DataNucleus will perform an additional `SELECT` query for each attribute.  To avoid this extra query, the annotation should indicate that the property is in the default fetch group.

For example, the `ToDoItem` (in the [wicket/restful/jdo archetype](../../../getting-started/quickstart-archetype.html)) defines the `dueBy` property as follows:

<pre>
public class ToDoItem ... {

    ...

    // {{ DueBy (property)
    @javax.jdo.annotations.Persistent(defaultFetchGroup="true")
    private LocalDate dueBy;

    @MemberOrder(name="Detail", sequence = "3")
    @Optional
    public LocalDate getDueBy() {
        return dueBy;
    }

    public void setDueBy(final LocalDate dueBy) {
        this.dueBy = dueBy;
    }

    ...
}
</pre>

{note
In DataNucleus 3.2, it will no longer be necessary to specify the "default fetch group" because this flag is [switched on](http://datanucleus.svn.sourceforge.net/viewvc/datanucleus/platform/store.types.jodatime/trunk/plugin.xml?revision=16602&content-type=text%2Fplain).  See [ISIS-303](https://issues.apache.org/jira/browse/ISIS-303) as to when this is incorporated into Isis JDO Objectstore.
}

### Blobs and Clobs

In addition to the support for Joda types, Isis also configures JDO/DataNucleus so that the properties of type `org.apache.isis.applib.value.Blob` and `org.apache.isis.applib.value.Clob` can also be persisted.

Again, this requires the `@javax.jdo.annotations.Persistent` annotation.  However, whereas for dates one would always expect this value to be retrieved eagerly, for blobs and clobs it is not so clear cut.

For example, in the `ToDoItem` (in the [wicket/restful/jdo archetype](../../../getting-started/quickstart-archetype.html)) the `attachment` property is as follows:

<pre>
public class ToDoItem ... {

    ...
    // {{ Attachment (property)
    @javax.jdo.annotations.Persistent(defaultFetchGroup="false")
    private Blob attachment;

    @Optional
    @MemberOrder(name="Detail", sequence = "7")
    @Hidden(where=Where.STANDALONE_TABLES)
    public Blob getAttachment() {
        return attachment;
    }

    public void setAttachment(final Blob attachment) {
        this.attachment = attachment;
    }
    // }}

    ...
}
</pre>

Here we can see that the property is hidden in standalone tables, and so there's no need to retrieve it eagerly.  The converse of this the object is rendered by itself, then the attachment property will be retrieved as a one separate query; this seems like a reasonable compromise.

### Lazy Loading

Lazy loading is a much more important consideration for collections.  By default, these are all rendered lazily and are thus also loaded lazily from the database.

However, even in the case of collections that have annotated with `@Render(Type.EAGERLY)`, these should probably still be lazily loaded.  Otherwise, there will always be an unnecessary cost when rendering the object in a table.

For example, in the `ToDoItem` (in the [wicket/restful/jdo archetype](../../../getting-started/quickstart-archetype.html)) the `dependencies` collection is as follows:

<pre>
public class ToDoItem ... {

    ...
    // {{ dependencies (Collection)
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
    // }}
    ...
}
</pre>

Even though `@Render(Type.EAGERLY)`, the `@javax.jdo.annotations.Persistent` annotation leaves the `defaultFetchGroup` as its default, which for collections is "false".
