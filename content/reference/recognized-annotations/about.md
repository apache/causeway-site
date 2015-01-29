title: Recognized Annotations

go back to: [documentation](../../documentation.html)

### Domain objects, services and members

`@Xxx` specify domain-layer metadata, `@XxxLayout` specify view-layer metadata

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Purpose</th>
        <th>Layer</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./Action.html">@Action</a></td>
        <td>Domain semantics for actions</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ActionLayout.html">@ActionLayout</a></td>
        <td>User interface hints for actions</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Collection.html">@Collection</a></td>
        <td>Domain semantics for collections</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CollectionLayout.html">@CollectionLayout</a></td>
        <td>User interface hints for collections</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./DomainObject.html">@DomainObject</a></td>
        <td>Domain semantics for domain object (entities and optionally view models, see also <code>@ViewModel</code>)</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DomainObjectLayout.html">@DomainObjectLayout</a></td>
        <td>User interface hints for domain object (entities and optionally view models, see also
            <code>@ViewModelLayout</code>)</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./DomainService.html">@DomainService</a></td>
        <td>Class is a domain service (rather than an entity or view model)</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DomainServiceLayout.html">@DomainServiceLayout</a></td>
        <td>User interface hints for domain services</td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Parameter.html">@Parameter</a></td>
        <td>Domain semantics for action parameters</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ParameterLayout.html">@PropertyLayout</a></td>
        <td>Layout hints for an action parameter (currently: its label position either to top or the left).</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Property.html">@Property</a></td>
        <td>Domain semantics for properties</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PropertyLayout.html">@PropertyLayout</a></td>
        <td>Layout hints for a property (currently: its label position either to top or the left).</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./ViewModel.html">@ViewModel</a></td>
        <td>Specify that a class is a view model (as opposed to an entity or domain service); alternatively <code>@DomainObject(nature=VIEW_MODEL)</code>.
        </td>
        <td>Domain, Persistence</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ViewModelLayout.html">@ViewModelLayout</a></td>
        <td>User interface hints for view models (use with <code>@ViewModel</code>, else see <code>@DomainObjectLayout</code>)</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
</table>

## Other Isis annotations

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Purpose</th>
        <th>Layer</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./AutoComplete.html">@AutoComplete</a></td>
        <td>Repository method to search for entities</td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Facets.html">@Facets</a></td>
        <td>Install arbitrary facets within the Isis metamodel.
        </td>
        <td>(any)</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./HomePage.html">@HomePage</a></td>
        <td>Query-only action (on domain service) to be invoked, result of which is
            rendered as the user's home page.</td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroupLayout.html">@MemberGroupLayout</a></td>
        <td>Grouping of properties into groups, and organizing of properties, collections into columns.</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MemberOrder.html">@MemberOrder</a></td>
        <td>Ordering of properties, collections and actions, and also associating actions with either a property or a
            collection.</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Programmatic.html">@Programmatic</a></td>
        <td>Ignore a public method, excluded from the Isis metamodel.</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MinLength.html">@MinLength</a></td>
        <td>Minimum number of characters required for an auto-complete search argument.
        </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersisted.html">@NotPersisted</a></td>
        <td>Indicates that an object property is derived, is not persisted.</td>
        <td>Domain, Persistence</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Title.html">@Title</a></td>
        <td>Indicates which of the object's properties should be used to build up a title for the object.
        </td>
        <td>UI</td>
        <td></td>
    </tr>
</table>


## Java EE Annotations

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Purpose</th>
        <th>Layer</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./RequestScoped.html">@javax.enterprise.context.RequestScoped</a></td>
        <td>Specify that a domain service has request-scope (rather than a singleton).</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Inject.html">@javax.inject.Inject</a></td>
        <td>Inject domain service into a domain object (entity or view model) or another domain service.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Digits.html">@javax.validation.constraints.Digits</a></td>
        <td>Precision/scale for BigDecimal values.</td>
        <td>Domain</td>
        <td></td>
    </tr>
</table>


## Annotations that have been deprecated (1.8.0-SNAPSHOT)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Purpose</th>
        <th>Layer</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./ActionOrder-deprecated.html" >@ActionOrder</a></td>
        <td>Order of buttons and menu items representing actions.
        <br/>Use instead <code>@MemberOrder</code> or dynamic layout.
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./ActionInteraction.html">@ActionInteraction</a></td>
        <td>Enable subscribers to either veto, validate or take further steps before/after an action has been invoked.
        <br/>Use instead <code>@Action#domainEvent()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ActionSemantics.html">@ActionSemantics</a></td>
        <td>Query-only, idempotent or non-idempotent.
        <br/>Use instead <code>@Action#semantics()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Audited.html">@Audited</a></td>
        <td>Audit changes to an object.
        <br/>Use instead <code>@DomainObject#auditing()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bookmarkable.html">@Bookmarkable</a></td>
        <td>Whether (and how) to create a bookmark for visited object.
        <br/>Use instead <code>@DomainObjectLayout#bookmarking()</code>
        </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bounded.html">@Bounded</a></td>
        <td>Bounded (and limited) number of instances of an entity type, translates into a drop-down for any property of
            that type.
        <br/>Use instead <code>@DomainObject#bounded()</code>
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bulk.html">@Bulk</a></td>
        <td>Indicates an action is a bulk action, can be applied to multiple instances.
        <br/>Use instead <code>@Action#invokeOn()</code>
        </td>
        <td>UI, Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CollectionInteraction.html">@CollectionInteraction</a></td>
        <td>Enable subscribers to either veto, validate or take further steps before/after a collection has been added to or
            removed from.
        <br/>Use instead <code>@Collection#domainEvent()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Command.html">@Command</a></td>
        <td>Action invocation should be reified as a command object, optionally persistable for profiling and enhanced
            auditing, and background/async support.
        <br/>Use instead <code>@Action#command()</code>.</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CssClass-deprecated.html">@CssClass</a></td>
        <td>Allow visual representation of individual objects or object members layout to be customized by application-specific CSS.
        <br/>Use instead <code>@DomainObjectLayout#cssClass()</code>, <code>@PropertyLayout#cssClass()</code>, <code>@CollectionLayout#cssClass()</code>, <code>@ActionLayout#cssClass()</code> and <code>@ParameterLayout#cssClass()</code>
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./CssClassFa-deprecated.html">@CssClassFa</a></td>
        <td>So that font awesome icons can be applied to action buttons/menu items and optionally as an object icon.
        <br/>Use instead <code>@ActionLayout#cssClassFa()</code>
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Debug-deprecated.html" >@Debug</a></td>
        <td>Action only invocable in debug mode.
        </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DescribedAs-deprecated.html">@DescribedAs</a></td>
        <td>Provide a longer description/tool-tip of an object or object member.
            <br/>Use instead <code>@DomainObjectLayout#describedAs()</code>, <code>@PropertyLayout#describedAs()</code>, <code>@CollectionLayout#describedAs()</code>, <code>@ActionLayout#describedAs()</code> and <code>@ParameterLayout#describedAs()</code>
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Disabled.html">@Disabled</a></td>
        <td>Object property cannot be edited, an object collection cannot be added to/removed from, or an
            object action cannot be invoked.
            <br/>Use instead <code>@Property#editing()</code> and <code>@Collection#editing()</code>, see also <code>@DomainObject#editing()</code>.
        </td>
        <td>UI, Domain</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Exploration-deprecated.html"  >@Exploration</a></td>
        <td>Action available in special 'exploration' mode.
            <br/>Use <code>@Action#restrictTo()</code> instead (combines exploration and prototyping modes).
        </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./FieldOrder-deprecated.html"  >@FieldOrder</a></td>
        <td>Order of properties and collections.
            <br/>Use instead <code>@MemberOrder</code> or dynamic layout.
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Hidden-deprecated.html">@Hidden</a></td>
        <td>Object member is not visible.
            <br/>Use instead <code>@Action#hidden()</code>, <code>@Property#hidden()</code> or <code>@Collection#hidden()</code>.
        </td>
        <td>UI, Domain</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Idempotent-deprecated.html"  >@Idempotent</a></td>
        <td>Use instead <code>@Action#semantics</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Ignore-deprecated.html"  >@Ignore</a></td>
        <td>Use instead <code>@Programmatic</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Immutable.html">@Immutable</a></td>
        <td>An object's state cannot be changed (properties cannot be edited, collections cannot be added to or removed
            from). Actions <i>can</i> still be invoked.
            <br/>Use instead <code>@DomainObject#editing()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Mask-deprecated.html">@Mask</a></td>
        <td>How to parse/render values (never properly supported)
        </td>
        <td>UI/domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MaxLength.html">@MaxLength</a></td>
        <td>Maximum length of a property value (strings).
            <br/>Use instead <code>@Property#maxLength()</code> or <code>@Parameter#maxLength()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroups-deprecated.html">@MemberGroups</a></td>
        <td>Use instead <code>@MemberGroupLayout</code> or dynamic layout.</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MultiLine-deprecated.html">@MultiLine</a></td>
        <td>Render string property over multiple lines (a textarea rather than a textbox).
            <br/>Use instead <code>@PropertyLayout#multiLine()</code> and <code>@ParameterLayout#multiLine()</code>
            </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MustSatisfy.html">@MustSatisfy</a></td>
        <td>Specify arbitrary specification constraints on a property or action parameter.
            <br/>Use instead <code>@Property#mustSatisfy()</code> or <code>@Parameter#mustSatisfy()</td>.
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Named-deprecated.html">@Named</a></td>
        <td>Override name inferred from class. Required for parameter names (prior to Java8).
            <br/>Use instead <code>@DomainServiceLayout#named()</code>, <code>@DomainObjectLayout#named()</code>, <code>@PropertyLayout#named()</code>, <code>@CollectionLayout#named()</code>, <code>@ActionLayout#named()</code> and <code>@ParameterLayout#named()</code>
            </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./NotContributed.html">@NotContributed</a></td>
        <td>Indicates that a domain service action is not rendered as an action on the (entity) types of its
            parameters. For 1-arg query-only actions, controls whether the domain service action is rendered as a property
            or collection on the entity type of its parameter.
            <br/>Use instead <code>@DomainService#nature()</code> to whether any of the actions in a domain service should appear in the menu bars, and use <code>@ActionLayout</code> to specify whether any individual action should be contributed only as an action or as an association (property or collection).
            </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotInServiceMenu.html">@NotInServiceMenu</a></td>
        <td>Indicates that a domain service should not be rendered in the application menu (at top of page in
            Wicket viewer).
            <br/>Use instead <code>@DomainService#nature()</code> to specify <i>none</i> of the actions in a domain service should appear in the menu bars.
            </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ObjectType.html">@ObjectType</a></td>
        <td>For constructing the external identifier (URI) of an entity instance (part of its URL in both Wicket viewer and
            Restful Objects viewer).
            <br/>Use instead <code>@DomainObject#objectType()</code>.
            </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Optional.html">@Optional</a></td>
        <td>Specifies that a property or action parameter is not mandatory.
            <br/>Use instead <code>@Property#optionality()</code> or <code>@Parameter#optionality()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Paged-deprecated.html">@Paged</a></td>
        <td>Number of instances to display in tables representing (standalone or parented) collections.
            <br/>Use instead <code>@DomainObjectLayout#paged()</code> or <code>@CollectionLayout#paged()</td>.
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Plural-deprecated.html">@Plural</a></td>
        <td>For the irregular plural form of an entity type.
            <br/>Use instead <code>@DomainObjectLayout#plural()</code>
            </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PostsPropertyChangedEvent-deprecated.html"  >@PostsPropertyChangedEvent</a></td>
        <td>Use instead <code>@Property#domainEvent()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PropertyInteraction.html">@PropertyInteraction</a></td>
        <td>Enable subscribers to either veto, validate or take further steps before/after a property has been modified or
            cleared.
            <br/>Use instead <code>@Property#domainEvent()</code>.
            </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Prototype-deprecated.html">@Prototype</a></td>
        <td>Indicates that an action should only be visible in 'prototype' mode.
            <br/>Use instead <code>@Action#restrictTo()</code>
            </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./PublishedAction.html">@PublishedAction</a></td>
        <td>Action invocation should be serialized and published by configured PublishingService (if any), eg to other
            systems.
            <br/>Use instead <code>@Action#publishing()</code>.
            </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PublishedObject.html">@PublishedObject</a></td>
        <td>Change to object should be serialized and published by configured PublishingService (if any), eg to other
            systems.
            <br/>Use instead <code>@DomainObject#publishing()</code>.
            </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./QueryOnly-deprecated.html"  >@QueryOnly</a></td>
        <td>Use instead <code>@Action#semantics()</code></td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./RegEx.html">@RegEx</a></td>
        <td>Validate change to value of string property.
        <br/>Use instead <code>@Property#regexPattern()</code> or <code>@Parameter#regexPattern()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Render-deprecated.html">@Render</a></td>
        <td>Eagerly (or lazily) render the contents of a collection.
            <br/>Use instead <code>@CollectionLayout#render()</code>
            </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./RenderedAsDayBefore-deprecated.html">@RenderedAsDayBefore</a></td>
        <td>Render dates as the day before; ie store [a,b) internally but render [a,b-1]) to end-user.
            <br/>Use instead <code>@PropertyLayout#renderedAsDayBefore()</code> and <code>@ParameterLayout#renderedAsDayBefore()</code>.
            </td>
        <td>UI</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Resolve-deprecated.html"  >@Resolve</a></td>
        <td>Use instead <code>@CollectionLayout#render()</code>.</td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./SortedBy-deprecated.html">@SortedBy</a></td>
        <td>Display instances in collections in the order determined by the provided Comparator.
            <br/>Use instead <code>@CollectionLayout#sortedBy()</code>
            </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./TypeOf.html">@TypeOf</a></td>
        <td>The type of entity stored within a collection (if cannot be otherwise inferred, eg from generics).
            <br/>Use instead <code>@Collection#typeOf()</code>.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./TypicalLength-deprecated.html">@TypicalLength</a></td>
        <td>The typical length of a string property, eg to determine a sensible length for a textbox.
            <br/>Use instead <code>@PropertyLayout#typicalLength()</code> and <code>@ParameterLayout#typicalLength()</code>.
        </td>
        <td>UI</td>
        <td>Yes</td>
    </tr>
</table>

## Annotations with incomplete/partial support (1.8.0-SNAPSHOT)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Purpose</th>
        <th>Layer</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./Aggregated.html">@Aggregated</a></td>
        <td>Part of an aggregate root</td>
        <td>Domain, Persistence</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Defaulted.html">@Defaulted</a></td>
        <td>Indicates that a (value) class has a default value.</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Encodable.html">@Encodable</a></td>
        <td>Indicates that a (value) class can be serialized/encoded.
        </td>
        <td>Persistence</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./EqualByContent.html">@EqualByContent</a></td>
        <td>Indicates that a value class has equality semantics.</td>
        <td>Domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersistable.html">@NotPersistable</a></td>
        <td>Indicates that a domain object may not be programmatically persisted (partly supported).</td>
        <td>Domain, Persistence</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Parseable.html">@Parseable</a></td>
        <td>Indicates that a (value) class can be reconstructed from a string.</td>
        <td>UI/domain</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Value.html">@Value</a></td>
        <td>Specify that a class has value-semantics.
        </td>
        <td>Domain</td>
        <td></td>
    </tr>
</table>

