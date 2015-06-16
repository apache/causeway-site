title: Recognized Methods and Prefixes

[//]: # (content copied to _user-guide_xxx)

The following table lists all of the methods or method prefixes that are
recognized by *Apache Isis*' default programming model:

<table class="table table-striped table-bordered table-condensed">
<tr>
    <th>Prefix</th>
    <th>Object</th>
    <th>Property</th>
    <th>Collection</th>
    <th>Action</th>
    <th>Action Param</th>
    <th>Description</th>
</tr>
<tr>
    <td>addTo</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>add object to a collection (nb: not currently supported by Wicket viewer)<p>See also <tt>removeFrom</tt></td>
</tr>
<tr>
    <td>autoComplete</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td>Return a list of matching elements for a <a href="../how-tos/how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html">property</a> or an <a href="../how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html">action parameter</a>.  <p>Alternatively, can specify for a class using the <a href="recognized-annotations/AutoComplete.html">@AutoComplete </a> annotation.<p>See also <tt>choices</tt></td>
</tr>
<tr>
    <td>cssClass</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Provides a CSS class for this object, which is added as a style in the containing &lt;tr&gt; when rendering the object within a table, or to a containing &lt;div&gt; when rendering the object on a page.  In conjunction with <i>css/application.css</i>, can therefore provide custom styling of an object instance wherever it is rendered.
    <p>See also <tt>title</tt> and <tt>iconName</tt>.
    </td>
</tr>
<tr>
    <td>choices</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td>Provide list of choices for a <a href="../how-tos/how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html">property</a> or <a href="../how-tos/how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html">action</a> <a href="../how-tos/how-to-03-022-How-to-specify-dependent-choices-for-action-parameters.html">parameter</a><p>See also <tt>autoComplete</tt>.</td>
</tr>
<tr>
    <td>clear</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Clear a property (set it to null).  Allows business logic to be placed apart from the setter.<p>See also <tt>modify</tt></td>
</tr>
<tr>
    <td>created</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the object has just been <a href="./object-lifecycle-callbacks.html">created</a> using <tt>newTransientInstance()</tt></td>
</tr>
<tr>
    <td>default</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td>Default value for a <a href="../how-tos/how-to-03-017-How-to-specify-default-value-of-an-object-property.html">property</a> or an <a href="../how-tos/how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html">action parameter</a>.</td>
</tr>
<tr>
    <td>disable</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td>Disables (makes read-only) a <a href="../how-tos/how-to-02-050-How-to-prevent-a-property-from-being-modified.html">property</a>, a <a href="../how-tos/how-to-02-060-How-to-prevent-a-collection-from-being-modified.html">collection</a> or an <a href="../how-tos/how-to-02-070-How-to-prevent-an-action-from-being-invoked.html">action</a>.</td>
</tr>
<tr>
    <td>get</td>
    <td></td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Access the value of a property or collection.<p>See also <tt>set</tt>.</td>
</tr>
<tr>
    <td>getId</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Provides an optional unique identifier of a service.<p>If not provided, the services fully-qualified class name is used.</td>
</tr>
<tr>
    <td>hide</td>
    <td></td>
    <td>Y</td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td>Hides a <a href="../how-tos/how-to-02-010-How-to-hide-a-property.html">property</a>, a <a href="../how-tos/how-to-02-020-How-to-hide-a-collection.html">collection</a> or an <a href="../how-tos/how-to-02-030-How-to-hide-an-action.html">action</a>.</td>
</tr>
<tr>
    <td>iconName</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Provides the name of the image to render, usually alongside the title, to represent the object.  If not provided, then the class name is used to locate an image.<p>See also <tt>title</tt> and <tt>cssClass</tt></td>
</tr>
<tr>
    <td>loaded</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object has just been <a href="./object-lifecycle-callbacks.html">loaded</a> from the object store.<p>NB: this may not called by the JDO ObjectStore.</td>
</tr>
<tr>
    <td>loading</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object is just about to be <a href="./object-lifecycle-callbacks.html">loaded</a> from the object store.<p>NB: this may not called by the JDO ObjectStore.</td>
</tr>
<tr>
    <td>modify</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Modify a property (set it to a non-null) value.  Allows business logic to be placed apart from the setter.<p>See also <tt>clear</tt>.</td>
</tr>
<tr>
    <td>persisted</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object has just been <a href="./object-lifecycle-callbacks.html">persisted</a> from the object store.<p>NB: this may not called by the JDO ObjectStore</td>
</tr>
<tr>
    <td>persisting</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object is just about to be <a href="./object-lifecycle-callbacks.html">persisted</a> from the object store<p>NB: this may not called by the JDO ObjectStore in all situations</td>
</tr>
<tr>
    <td>removeFrom</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>remove object from a collection (nb: not currently supported by Wicket viewer)<p>See also <tt>addTo</tt></td>
</tr>
<tr>
    <td>removed</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object has just been <a href="./object-lifecycle-callbacks.html">persisted</a> from the object store<p>NB: this may not called by the JDO ObjectStore in all situations</td>
</tr>
<tr>
    <td>removing</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object is just about to be <a href="./object-lifecycle-callbacks.html">deleted</a> from the object store<p>NB: this may not called by the JDO ObjectStore in all situations</td>
</tr>
<tr>
    <td>set</td>
    <td></td>
    <td>Y</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Sets the value of a propery or a collection.</td>
</tr>
<tr>
    <td>toString</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Used as the fallback title for an object if there is <a href="../how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html">no <tt>title()</tt> method</a> or properties annotated with the <a href="recognized-annotations/Title.html"><tt>@Title</tt> annotation.</a></td>
</tr>
<tr>
    <td>title</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Provides a title for the object. <p>Alternatively, use the <a href="recognized-annotations/Title.html">@Title</a> annotation.
     <p>See also <tt>iconName</tt> and <tt>cssClass</tt></td>
</tr>
<tr>
    <td>updated</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object has just been <a href="./object-lifecycle-callbacks.html">updated</a> in the object store<p>NB: this may not called by the JDO ObjectStore in all situations</td>
</tr>
<tr>
    <td>updating</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Lifecycle callback for when the (persistent) object is just about to be <a href="./object-lifecycle-callbacks.html">updated</a> in the object store<p>NB: this may not called by the JDO ObjectStore in all situations</td>
</tr>
<tr>
    <td>validate</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td>Y</td>
    <td>Y</td>
    <td>Check that a proposed value of a <a href="../how-tos/how-to-02-100-How-to-validate-user-input-for-a-property.html">property</a> or an <a href="../how-tos/how-to-02-120-How-to-validate-an-action-parameter-argument.html">action parameter</a> is valid.<p>See also <tt>validateAddTo</tt> and <tt>validateRemoveFrom</tt> for collections.</td>
</tr>
<tr>
    <td>validateAddTo</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Check that a proposed object to add to a <a href="../how-tos/how-to-02-110-How-to-validate-an-object-being-added-or-removed-from-a-collection.html">collection</a> is valid.<p>See also <tt>validateRemoveFrom</tt>, and <tt>validate</tt> for properties and collections.</td>
</tr>
<tr>
    <td>validateRemoveFrom</td>
    <td></td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td>Check that a proposed object to add to a <a href="../how-tos/how-to-02-110-How-to-validate-an-object-being-added-or-removed-from-a-collection.html">collection</a> is valid.<p>See also <tt>validateAddTo</tt>, and <tt>validate</tt> for properties and collections.</td>
</tr>
</table>


There are also a number of deprecated methods (for lifecycle callbacks):

<table class="table table-striped table-bordered table-condensed">
<tr>
    <th>Prefix</th>
    <th>Object</th>
    <th>Property</th>
    <th>Collection</th>
    <th>Action</th>
    <th>Action Param</th>
    <th>See also</th>
</tr>
<tr>
    <td>deleted</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Replaced by <tt>removed</tt></td>
</tr>
<tr>
    <td>deleting</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Replaced by <tt>removing</tt></td>
</tr>
<tr>
    <td>saved</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Replaced by <tt>persisted</tt></td>
</tr>
<tr>
    <td>saving</td>
    <td>Y</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>Replaced by <tt>persisting</tt></td>
</tr>
</table>

In order to be recognized, all methods must be `public`. Any methods
that do not match are deemed to be action methods that the user can
invoke from the user interface.
