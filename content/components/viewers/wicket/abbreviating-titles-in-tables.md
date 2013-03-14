Title: Abbreviating Titles in Tables (1.2.0-SNAPSHOT)

Object titles can often be quite long if the intention is to uniquely identify the object.  While this is appropriate for the object view, it can be cumbersome within tables.

Isis' Wicket viewer provides the option to abbreviate these titles, using configuration properties.

### Viewer-specific configuration file

Because these configuration properties are specific to the Wicket viewer, it is good practice to put them into their own configuration file, `WEB-INF/viewer_wicket.properties`.  (You can put them into the regular `WEB-INF/isis.properties` file if you wish, though).

To have Isis pick up this configuration file, add the following to `WEB-INF/web.xml`:

<pre>
&lt;context-param&gt;
    &lt;param-name&gt;isis.viewers&lt;/param-name&gt;
    &lt;param-value&gt;wicket&lt;/param-value&gt;
&lt;/context-param&gt;
</pre>

If there is more than one viewer configured in the webapp, specify them as a comma-separated list, eg `wicket,restfulobjects`.


### The configuration properties

The properties themselves are:

<pre>
isis.viewer.wicket.maxTitleLengthInStandaloneTables=20
isis.viewer.wicket.maxTitleLengthInParentedTables=8
</pre>

If you wish to use the same value in both cases, you can also specify just:

<pre>
isis.viewer.wicket.maxTitleLengthInTables=15
</pre>

This is used as a fallback if the more specific properties are not provided.

If no properties are provided, then the Wicket viewer defaults to abbreviating titles to a length of `12`.
