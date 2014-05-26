Title: Mapping Blobs (and Clobs)

> *Note:* prior to 1.5.0-snapshot, the Isis mapping for `Blob`s and `Clob`s is broken (the mapping classes are not correctly registered with DataNucleus), and so the `Blob` or `Clob` are stored as a serialized Java object... not ideal.

Isis configures JDO/DataNucleus so that the properties of type `org.apache.isis.applib.value.Blob` and `org.apache.isis.applib.value.Clob` can also be persisted.

As for [Joda dates](mapping-joda-dates.html), this requires the `@javax.jdo.annotations.Persistent` annotation.  However, whereas for dates one would always expect this value to be retrieved eagerly, for blobs and clobs it is not so clear cut.

### Mapping Blobs

For example, in the `ToDoItem` class (of the [quickstart archetype](../../../getting-started/quickstart-archetype.html)) the `attachment` property (as of 1.5.0-snapshot) is as follows:

<pre>
  @javax.jdo.annotations.Persistent(defaultFetchGroup="false", columns = {
      @javax.jdo.annotations.Column(name = "attachment_name"),
      @javax.jdo.annotations.Column(name = "attachment_mimetype"),
      @javax.jdo.annotations.Column(name = "attachment_bytes", jdbcType="BLOB", sqlType = "BLOB")
  })
  private Blob attachment;

  @Optional
  public Blob getAttachment() {
    return attachment;
  }
  public void setAttachment(final Blob attachment) {
    this.attachment = attachment;
  }
</pre>

The three `@javax.jdo.annotations.Column` annotations are required because the mapping classes that Isis provides ([IsisBlobMapping](https://github.com/apache/isis/blob/isis-1.4.0/component/objectstore/jdo/jdo-datanucleus/src/main/java/org/apache/isis/objectstore/jdo/datanucleus/valuetypes/IsisBlobMapping.java#L59) and [IsisClobMapping](https://github.com/apache/isis/blob/isis-1.4.0/component/objectstore/jdo/jdo-datanucleus/src/main/java/org/apache/isis/objectstore/jdo/datanucleus/valuetypes/IsisClobMapping.java#L59)) map to 3 columns.  (It is not an error to omit these `@Column` annotations, but without them the names of the table columns are simply suffixed `_0`, `_1`, `_2` etc.

If the `Blob` or `Clob` is mandatory, then use:

<pre>
  @javax.jdo.annotations.Persistent(defaultFetchGroup="false", columns = {
      @javax.jdo.annotations.Column(name = "attachment_name", allowsNull="false"),
      @javax.jdo.annotations.Column(name = "attachment_mimetype", allowsNull="false"),
      @javax.jdo.annotations.Column(name = "attachment_bytes", jdbcType="BLOB", sqlType = "BLOB", allowsNull="false")
  })
  private Blob attachment;

  @Mandatory
  public Blob getAttachment() {
    return attachment;
  }
  public void setAttachment(final Blob attachment) {
    this.attachment = attachment;
  }
</pre>

> Instead of `@Mandatory`, using `@javax.jdo.annotations.Column(allowsNull="false")` will also work.  However, as this last `@Column` annotation is only for Isis' benefit (DataNucleus ignores it in the presence of the `Persistent#columns` attribute) we prefer to use `@Mandatory` instead.


### Mapping Clobs

Mapping `Clob`s works in a very similar way, but the `@Column#sqlType` attribute will be `CLOB`:

<pre>
  @javax.jdo.annotations.Persistent(defaultFetchGroup="false", columns = {
      @javax.jdo.annotations.Column(name = "attachment_name"),
      @javax.jdo.annotations.Column(name = "attachment_mimetype"),
      @javax.jdo.annotations.Column(name = "attachment_chars", sqlType = "CLOB")
  })
  private Clob doc;

  @Mandatory
  public Clob getDoc() {
    return doc;
  }
  public void setDoc(final Clob doc) {
    this.doc = doc;
  }
</pre>

or `VARCHAR`:

<pre>
      @javax.jdo.annotations.Column(name = "attachment_chars", sqlType = "VARCHAR", length=2048)
</pre>


# Mapping to VARBINARY or VARCHAR

Instead of mapping to a `Blob` or `Clob` datatype, you might also specify map to a `VARBINARY` or `VARCHAR`.  In this case you will need to specify a length.  For example:

<pre>
      @javax.jdo.annotations.Column(name = "attachment_bytes", sqlType = "VARBINARY", length=2048)
</pre>

or

<pre>
      @javax.jdo.annotations.Column(name = "attachment_chars", sqlType = "VARCHAR", length=2048)
</pre>

Support and maximum allowed length will vary by database vendor.
