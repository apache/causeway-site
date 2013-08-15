Title: Mapping Blobs


Isis configures JDO/DataNucleus so that the properties of type `org.apache.isis.applib.value.Blob` and `org.apache.isis.applib.value.Clob` can also be persisted.

As for [Joda dates](mapping-joda-dates.html), this requires the `@javax.jdo.annotations.Persistent` annotation.  However, whereas for dates one would always expect this value to be retrieved eagerly, for blobs and clobs it is not so clear cut.

For example, in the `ToDoItem` (in the [wicket/restful/jdo archetype](../../../getting-started/quickstart-archetype.html)) the `attachment` property is as follows:

<pre>
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
</pre>

Here we can see that the property is hidden in standalone tables, and so there's no need to retrieve it eagerly.  The converse of this the object is rendered by itself, then the attachment property will be retrieved as a one separate query; this seems like a reasonable compromise.

