title: Recognized Annotations

go back to: [documentation](../../documentation.html)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Layer</th>
        <th>Purpose</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./ActionLayout.html">@ActionLayout</a></td>
        <td>UI</td>
        <td>User interface hints for actions</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./AutoComplete.html">@AutoComplete</a></td>
        <td>UI</td>
        <td>Repository method to search for entities</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CollectionLayout.html">@CollectionLayout</a></td>
        <td>UI</td>
        <td>User interface hints for collections</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Digits.html">@javax.validation.constraints.Digits</a></td>
        <td>Domain</td>
        <td>Precision/scale for BigDecimal values.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DomainObjectLayout.html">@DomainObjectLayout</a></td>
        <td>UI</td>
        <td>User interface hints for domain object (entities and view models)</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./DomainService.html">@DomainService</a></td>
        <td>Domain</td>
        <td>Class is a domain service (rather than an entity or view model)</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DomainServiceLayout.html">@DomainServiceLayout</a></td>
        <td>UI</td>
        <td>User interface hints for domain services</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Facets.html">@Facets</a></td>
        <td>(any)</td>
        <td>Install arbitrary facets within the Isis metamodel.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./HomePage.html">@HomePage</a></td>
        <td>UI</td>
        <td>Query-only action (on domain service) to be invoked, result of which is
            rendered as the user's home page.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Inject.html">@javax.inject.Inject</a></td>
        <td>Domain</td>
        <td>Inject domain service into a domain object (entity or view model) or another domain service.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroupLayout.html">@MemberGroupLayout</a></td>
        <td>UI</td>
        <td>Grouping of properties into groups, and organizing of properties, collections into columns.</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MemberOrder.html">@MemberOrder</a></td>
        <td>UI</td>
        <td>Ordering of properties, collections and actions, and also associating actions with either a property or a
            collection.</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MinLength.html">@MinLength</a></td>
        <td>UI</td>
        <td>Minimum number of characters required for an auto-complete search argument.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotContributed.html">@NotContributed</a></td>
        <td>UI</td>
        <td>Indicates that a domain service action is not rendered as an action on the (entity) types of its
            parameters. For 1-arg query-only actions, controls whether the domain service action is rendered as a property
            or collection on the entity type of its parameter.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotInServiceMenu.html">@NotInServiceMenu</a></td>
        <td>UI</td>
        <td>Indicates that a domain service should not be rendered in the application menu (at top of page in
            Wicket viewer).</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersisted.html">@NotPersisted</a></td>
        <td>Domain, Persistence</td>
        <td>Indicates that an object property is derived, is not persisted.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ParameterLayout.html">@PropertyLayout</a></td>
        <td>UI</td>
        <td>Layout hints for an action parameter (currently: its label position either to top or the left).</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Programmatic.html">@Programmatic</a></td>
        <td>Domain</td>
        <td>Ignore a public method, excluded from the Isis metamodel.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PropertyLayout.html">@PropertyLayout</a></td>
        <td>UI</td>
        <td>Layout hints for a property (currently: its label position either to top or the left).</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./RequestScoped.html">@RequestScoped</a></td>
        <td>Domain</td>
        <td>Specify that a domain service has request-scope (rather than a singleton).  (In <code>javax.enterprise.context</code> package).</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Title.html">@Title</a></td>
        <td>UI</td>
        <td>Indicates which of the object's properties should be used to build up a title for the object.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ViewModel.html">@ViewModel</a></td>
        <td>Domain, Persistence</td>
        <td>Specify that a class is a view model (as opposed to an entity or domain service).
            <br/>Alternatively, use <tt>@DomainObject(nature=VIEW_MODEL)</tt>.
        </td>
        <td></td>
    </tr>
</table>


## Annotations that have been deprecated (1.8.0-SNAPSHOT)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Layer</th>
        <th>Purpose</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./ActionOrder-deprecated.html" >@ActionOrder</a></td>
        <td>UI</td>
        <td>Order of buttons and menu items representing actions.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ActionInteraction.html">@ActionInteraction</a></td>
        <td>Domain</td>
        <td>Enable subscribers to either veto, validate or take further steps before/after an action has been invoked.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ActionSemantics.html">@ActionSemantics</a></td>
        <td>Domain</td>
        <td>Query-only, idempotent or non-idempotent.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Audited.html">@Audited</a></td>
        <td>Domain</td>
        <td>Audit changes to an object</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bookmarkable.html">@Bookmarkable</a></td>
        <td>UI</td>
        <td>Whether (and how) to create a bookmark for visited object.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bounded.html">@Bounded</a></td>
        <td>Domain</td>
        <td>Bounded (and limited) number of instances of an entity type, translates into a drop-down for any property of
            that type.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bulk.html">@Bulk</a></td>
        <td>UI, Domain</td>
        <td>Indicates an action is a bulk action, can be applied to multiple instances.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CollectionInteraction.html">@CollectionInteraction</a></td>
        <td>Domain</td>
        <td>Enable subscribers to either veto, validate or take further steps before/after a collection has been added to or
            removed from.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Command.html">@Command</a></td>
        <td>Domain</td>
        <td>Action invocation should be reified as a command object, optionally persistable for profiling and enhanced
            auditing, and background/async support.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CssClass-deprecated.html">@CssClass</a></td>
        <td>UI</td>
        <td>Allow visual representation of individual objects or object members layout to be customized by application-specific CSS.
        <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@DomainObjectLayout</code>, <code>@PropertyLayout</code>, <code>@CollectionLayout</code>, <code>@ActionLayout</code> and <code>@ParameterLayout</code>
        </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./CssClassFa-deprecated.html">@CssClassFa</a></td>
        <td>UI</td>
        <td>So that font awesome icons can be applied to action buttons/menu items and optionally as an object icon.
        <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@ActionLayout</code>
        </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Debug-deprecated.html" >@Debug</a></td>
        <td>UI</td>
        <td>Action only invocable in debug mode.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DescribedAs-deprecated.html">@DescribedAs</a></td>
        <td>UI</td>
        <td>Provide a longer description/tool-tip of an object or object member.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@DomainObjectLayout</code>, <code>@PropertyLayout</code>, <code>@CollectionLayout</code>, <code>@ActionLayout</code> and <code>@ParameterLayout</code>
        </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Disabled.html">@Disabled</a></td>
        <td>UI, Domain</td>
        <td>Object property cannot be edited, an object collection cannot be added to/removed from, or an
            object action cannot be invoked.</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Exploration-deprecated.html"  >@Exploration</a></td>
        <td>UI</td>
        <td>Action available in special 'exploration' mode.
            <br/>Deprecated in 1.8.0-SNAPSHOT
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./FieldOrder-deprecated.html"  >@FieldOrder</a></td>
        <td>UI</td>
        <td>Order of properties and collections
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Hidden-deprecated.html">@Hidden</a></td>
        <td>UI, Domain</td>
        <td>Object member is not visible.
            <br/>Deprecated in 1.8.0-SNAPSHOT
        </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Idempotent-deprecated.html"  >@Idempotent</a></td>
        <td>Domain</td>
        <td>Replaced by @ActionSemantics.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Ignore-deprecated.html"  >@Ignore</a></td>
        <td>Domain</td>
        <td>Replaced by @Programmatic.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Immutable.html">@Immutable</a></td>
        <td>Domain</td>
        <td>An object's state cannot be changed (properties cannot be edited, collections cannot be added to or removed
            from). Actions <i>can</i> still be invoked.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Mask-deprecated.html">@Mask</a></td>
        <td>UI/domain</td>
        <td>How to parse/render values (never properly supported)
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MaxLength.html">@MaxLength</a></td>
        <td>Domain</td>
        <td>Maximum length of a property value (strings).</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroups-deprecated.html">@MemberGroups</a></td>
        <td>UI</td>
        <td>Replaced by @MemberGroupLayout</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MultiLine-deprecated.html">@MultiLine</a></td>
        <td>UI</td>
        <td>Render string property over multiple lines (a textarea rather than a textbox).
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@PropertyLayout</code> and <code>@ParameterLayout</code>
            </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./MustSatisfy.html">@MustSatisfy</a></td>
        <td>Domain</td>
        <td>Specify arbitrary specification constraints on a class member, action parameter or object.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Named-deprecated.html">@Named</a></td>
        <td>UI</td>
        <td>Override name inferred from class. Required for parameter names (prior to Java8).
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@DomainServiceLayout</code>, <code>@DomainObjectLayout</code>, <code>@PropertyLayout</code>, <code>@CollectionLayout</code>, <code>@ActionLayout</code> and <code>@ParameterLayout</code>
            </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./ObjectType.html">@ObjectType</a></td>
        <td>Domain</td>
        <td>For constructing the external identifier (URI) of an entity instance (part of its URL in both Wicket viewer and
            Restful Objects viewer).</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Optional.html">@Optional</a></td>
        <td>Domain</td>
        <td>Specifies that a property or action parameter is not mandatory.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Paged-deprecated.html">@Paged</a></td>
        <td>UI</td>
        <td>Number of instances to display in tables representing (parented or standalone) collections.
            <br/>Deprecated in 1.8.0-SNAPSHOT</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./Plural-deprecated.html">@Plural</a></td>
        <td>UI</td>
        <td>For the irregular plural form of an entity type.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@DomainObjectLayout</code>
            </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PostsPropertyChangedEvent-deprecated.html"  >@PostsPropertyChangedEvent</a></td>
        <td>Domain</td>
        <td>Replaced by @PropertyInteraction
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PropertyInteraction.html">@PropertyInteraction</a></td>
        <td>Domain</td>
        <td>Enable subscribers to either veto, validate or take further steps before/after a property has been modified or
            cleared.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Prototype-deprecated.html">@Prototype</a></td>
        <td>UI</td>
        <td>Indicates that an action should only be visible in 'prototype' mode.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@ActionLayout</code>
            </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./PublishedAction.html">@PublishedAction</a></td>
        <td>Domain</td>
        <td>Action invocation should be serialized and published by configured PublishingService (if any), eg to other
            systems.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PublishedObject.html">@PublishedObject</a></td>
        <td>Domain</td>
        <td>Change to object should be serialized and published by configured PublishingService (if any), eg to other
            systems.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./QueryOnly-deprecated.html"  >@QueryOnly</a></td>
        <td>Domain</td>
        <td>Replaced by @ActionSemantics.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./RegEx.html">@RegEx</a></td>
        <td>Domain</td>
        <td>Validate change to value of string property.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Render-deprecated.html">@Render</a></td>
        <td>UI</td>
        <td>Eagerly (or lazily) render the contents of a collection.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@CollectionLayout</code>
            </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./RenderedAsDayBefore-deprecated.html">@RenderedAsDayBefore</a></td>
        <td>UI</td>
        <td>Render dates as the day before; ie store [a,b) internally but render [a,b-1]) to end-user.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@PropertyLayout</code> and <code>@ParameterLayout</code>
            </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Resolve-deprecated.html"  >@Resolve</a></td>
        <td>UI</td>
        <td>Replaced by <code>@Render</code>.</td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./SortedBy-deprecated.html">@SortedBy</a></td>
        <td>UI</td>
        <td>Display instances in collections in the order determined by the provided Comparator.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@CollectionLayout</code>
            </td>
        <td>Yes</td>
    </tr>
    <tr>
        <td><a href="./TypeOf.html">@TypeOf</a></td>
        <td>Domain</td>
        <td>The type of entity stored within a collection (if cannot be otherwise inferred, eg from generics).
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./TypicalLength-deprecated.html">@TypicalLength</a></td>
        <td>UI</td>
        <td>The typical length of a string property, eg to determine a sensible length for a textbox.
            <br/>Deprecated in 1.8.0-SNAPSHOT, see <code>@PropertyLayout</code> and <code>@ParameterLayout</code>
        </td>
        <td>Yes</td>
    </tr>
</table>

## Annotations with incomplete/partial support (1.8.0-SNAPSHOT)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Layer</th>
        <th>Purpose</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a>?</th>
    </tr>
    <tr>
        <td><a href="./Aggregated.html">@Aggregated</a></td>
        <td>Domain, Persistence</td>
        <td>Part of an aggregate root</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Defaulted.html">@Defaulted</a></td>
        <td>Domain</td>
        <td>Indicates that a (value) class has a default value.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Encodable.html">@Encodable</a></td>
        <td>Persistence</td>
        <td>Indicates that a (value) class can be serialized/encoded.
        </td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./EqualByContent.html">@EqualByContent</a></td>
        <td>Domain</td>
        <td>Indicates that a value class has equality semantics.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersistable.html">@NotPersistable</a></td>
        <td>Domain, Persistence</td>
        <td>Indicates that a domain object may not be programmatically persisted (partly supported).</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Parseable.html">@Parseable</a></td>
        <td>UI/domain</td>
        <td>Indicates that a (value) class can be reconstructed from a string.</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Value.html">@Value</a></td>
        <td>Domain</td>
        <td>Specify that a class has value-semantics.
        </td>
        <td></td>
    </tr>
</table>

