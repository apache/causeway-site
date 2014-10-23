title: Recognized Annotations

go back to: [documentation](../../documentation.html)

<table class="table table-bordered table-condensed table-hover">
<tr>
    <th>Annotation</th>
    <th>Purpose</th>
    <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a> ?</th>
    <th>Deprecated?</th>
</tr>
<tr><td><a href="./ActionInteraction.html">@ActionInteraction</a></td>
<td>Enable subscribers to either veto, validate or take further steps before/after an action has been invoked.
</td>
<td></td><td></td></tr>
<tr><td><a href="./ActionOrder-deprecated.html">@ActionOrder</a></td>
<td>UI hint for buttons, menu items
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./ActionSemantics.html">@ActionSemantics</a></td>
<td>Query-only, idempotent or non-idempotent.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Aggregated.html">@Aggregated</a></td>
<td>Part of an aggregate root (only partly supported)
</td>
<td></td><td></td></tr>
<tr><td><a href="./Audited.html">@Audited</a></td>
<td>Audit changes to an object
</td>
<td></td><td></td></tr>
<tr><td><a href="./AutoComplete.html">@AutoComplete</a></td>
<td>Repository method to search for entities
</td>
<td></td><td></td></tr>
<tr><td><a href="./Bookmarkable.html">@Bookmarkable</a></td>
<td>UI hint: whether (and how) to create a bookmark for visited object.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Bounded.html">@Bounded</a></td>
<td>Bounded (and limited) number of instances of an entity type, translates into a drop-down for any property of that type.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Bulk.html">@Bulk</a></td>
<td>Indicates an action is a bulk action, can be applied to multiple instances.
</td>
<td></td><td></td></tr>
<tr><td><a href="./CollectionInteraction.html">@CollectionInteraction</a></td>
<td>Enable subscribers to either veto, validate or take further steps before/after a collection has been added to or removed from.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Command.html">@Command</a></td>
<td>Action invocation should be reified as a command object, optionally persistable for profiling and enhanced auditing, and background/async support.
</td>
<td></td><td></td></tr>
<tr><td><a href="./CssClass.html">@CssClass</a></td>
<td>UI hint to allow individual objects or object members layout to be customized by application-specific CSS.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./CssClassFa.html">@CssClassFa</a></td>
<td>UI hint to use font awesome icons for action buttons/menu items and optionally as an object icon.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./Debug-deprecated.html">@Debug</a></td>
<td>Action only invocable in debug mode.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./Defaulted.html">@Defaulted</a></td>
<td>Indicates that a (value) class has a default value.
</td>
<td></td><td></td></tr>
<tr><td><a href="./DescribedAs.html">@DescribedAs</a></td>
<td>UI hint to provide a description of an object or object member.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./Digits.html">@javax.validation.constraints.Digits</a></td>
<td>Precision/scale for BigDecimal values.
</td>
<tr><td><a href="./Disabled.html">@Disabled</a></td>
<td>UI hint that object property cannot be edited, an object collection cannot be added to/removed from, or an object action cannot be invoked.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./Encodable.html">@Encodable</a></td>
<td>Indicates that a (value) class can be serialized/encoded.
</td>
<td></td><td></td></tr>
<tr><td><a href="./EqualByContent.html">@EqualByContent</a></td>
<td>Indicates that a value class has equality semantics.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Exploration-deprecated.html">@Exploration</a></td>
<td>Action available in special 'exploration' mode.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./Facets.html">@Facets</a></td>
<td>Install arbitrary facets within the Isis metamodel.
</td>
<td></td><td></td></tr>
<tr><td><a href="./FieldOrder-deprecated.html">@FieldOrder</a></td>
<td>UI hint for property/collection order
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./Hidden.html">@Hidden</a></td>
<td>UI hint that object member not visible.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./HomePage.html">@HomePage</a></td>
<td>Query-only action (on domain service) to be invoked, result of which is
rendered as the user's home page.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Idempotent-deprecated.html">@Idempotent</a></td>
<td>Replaced by @ActionSemantics.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./Ignore-deprecated.html">@Ignore</a></td>
<td>Replaced by @Programmatic.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./Immutable.html">@Immutable</a></td>
<td>An object's state cannot be changed (properties cannot be edited, collections cannot be added to or removed from).  Actions <i>can</i> still be invoked.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Inject.html">@javax.inject.Inject</a></td>
<td>Inject domain service into a domain object (entity or view model) or another domain service.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Mask.html">@Mask</a></td>
<td>How to parse/render values (only partly supported)
</td>
<td></td><td></td></tr>
<tr><td><a href="./MaxLength.html">@MaxLength</a></td>
<td>Maximum length of a property value (strings).
</td>
<td></td><td></td></tr>
<tr><td><a href="./MemberGroupLayout.html">@MemberGroupLayout</a></td>
<td>UI hint grouping of properties into groups, and organizing of properties, collections into columns.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./MemberGroups.html">@MemberGroups</a></td>
<td>Replaced by @MemberGroupLayout
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./MemberOrder.html">@MemberOrder</a></td>
<td>UI hint ordering properties, collections and actions, and associating actions with either a property or a collection.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./MinLength.html">@MinLength</a></td>
<td>Minimum number of characters required for an auto-complete search argument.
</td>
<td></td><td></td></tr>
<tr><td><a href="./MultiLine.html">@MultiLine</a></td>
<td>UI hint to render string property over multiple lines (a textarea rather than a textbox)
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./MustSatisfy.html">@MustSatisfy</a></td>
<td>Specify arbitrary specification constraints on a class member, action parameter or object.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Named.html">@Named</a></td>
<td>UI hint to override name inferred from class.  Required for parameter names (prior to Java8)
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./NotContributed.html">@NotContributed</a></td>
<td>UI hint indicating that a domain service action is not rendered as an action on the (entity) types of its parameters.  For 1-arg query-only actions, controls whether the domain service action is rendered as a property or collection on the entity type of its parameter.
</td>
<td></td><td></td></tr>
<tr><td><a href="./NotInServiceMenu.html">@NotInServiceMenu</a></td>
<td>UI hint indicating that a domain service should not be rendered in the application menu (at top of page in Wicket viewer).
</td>
<td></td><td></td></tr>
<tr><td><a href="./NotPersistable.html">@NotPersistable</a></td>
<td>Indicates that a domain object may not be programmatically persisted (partly supported).
</td>
<td></td><td></td></tr>
<tr><td><a href="./NotPersisted.html">@NotPersisted</a></td>
<td>Indicates that an object property is derived, is not persisted.
</td>
<td></td><td></td></tr>
<tr><td><a href="./ObjectType.html">@ObjectType</a></td>
<td>For constructing the external identifier (URI) of an entity instance (part of its URL in both Wicket viewer and Restful Objects viewer).
</td>
<td></td><td></td></tr>
<tr><td><a href="./Optional.html">@Optional</a></td>
<td>Specifies that a property or action parameter is not mandatory.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Paged.html">@Paged</a></td>
<td>UI hint for (client-side) paging of collections (parented or standalone).
</td>
<td></td><td></td></tr>
<tr><td><a href="./Parseable.html">@Parseable</a></td>
<td>Indicates that a (value) class can be reconstructed from a string.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Plural.html">@Plural</a></td>
<td>UI hint for the irregular plural form of an entity type.
</td>
<td></td><td></td></tr>
<tr><td><a href="./PostsPropertyChangedEvent-deprecated.html">@PostsPropertyChangedEvent</a></td>
<td>Replaced by @PropertyInteraction
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./PropertyInteraction.html">@PropertyInteraction</a></td>
<td>Enable subscribers to either veto, validate or take further steps before/after a property has been modified or cleared.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Programmatic.html">@Programmatic</a></td>
<td>Ignore a public method, excluded from the Isis metamodel.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Prototype.html">@Prototype</a></td>
<td>UI hint indicating that an action should only be visible in 'prototype' mode.
</td>
<td></td><td></td></tr>
<tr><td><a href="./PublishedAction.html">@PublishedAction</a></td>
<td>Action invocation should be serialized and published by configured PublishingService (if any), eg to other systems.
</td>
<td></td><td></td></tr>
<tr><td><a href="./PublishedObject.html">@PublishedObject</a></td>
<td>Change to object should be serialized and published by configured PublishingService (if any), eg to other systems.
</td>
<td></td><td></td></tr>
<tr><td><a href="./QueryOnly-deprecated.html">@QueryOnly</a></td>
<td>Replaced by @ActionSemantics.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./RegEx.html">@RegEx</a></td>
<td>Validate change to value of string property.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Render.html">@Render</a></td>
<td>UI hint to eagerly (or lazily) render the contents of a collection.
</td>
<td></td><td></td></tr>
<tr><td><a href="./RenderedAsDayBefore.html">@RenderedAsDayBefore</a></td>
<td>UI hint to render dates as the day before; ie store [a,b) internally but render [a,b-1]) to end-user.
</td>
<td></td><td></td></tr>
<tr><td><a href="./RequestScoped.html">@javax.enterprise.context.RequestScoped</a></td>
<td>Specify that a domain service has request-scope (rather than a singleton).
</td>
<td></td><td></td></tr>
<tr><td><a href="./Resolve-deprecated.html">@Resolve</a></td>
<td>Replaced by @Render.
</td>
<td></td><td>Y</td></tr>
<tr><td><a href="./SortedBy.html">@SortedBy</a></td>
<td>UI hint for collections, display in order determined by specified Comparator.
</td>
<td></td><td></td></tr>
<tr><td><a href="./Title.html">@Title</a></td>
<td>UI hint indicating which of the object's properties should be used to build up a title for the object.
</td>
<td></td><td></td></tr>
<tr><td><a href="./TypeOf.html">@TypeOf</a></td>
<td>The type of entity stored within a collection (if cannot be otherwise inferred, eg from generics).
</td>
<td></td><td></td></tr>
<tr><td><a href="./TypicalLength.html">@TypicalLength</a></td>
<td>UI hint for the typical length of a string property, eg to determine a sensible length for a textbox.
</td>
<td>Y</td><td></td></tr>
<tr><td><a href="./Value.html">@Value</a></td>
<td>Specify that a class has value-semantics.
</td>
<td></td><td></td></tr>
<tr><td><a href="./ViewModel.html">@ViewModel</a></td>
<td>Specify that a class is a view model (rather than a persisted entity).
</td>
<td></td><td></td></tr>
</table>
