title: Recognized Annotations

go back to: [documentation](../../documentation.html)

<table class="table table-bordered table-condensed table-hover">
    <tr>
        <th>Annotation</th>
        <th>Layer</th>
        <th>Purpose</th>
        <th><a href="../../components/viewers/wicket/dynamic-layouts.html">.layout.json</a> ?</th>
        <th>Deprecated?</th>
    </tr>
    <tr>
        <td><a href="./ActionInteraction.html">@ActionInteraction</a></td>
        <th>Domain</th>
        <td>Enable subscribers to either veto, validate or take further steps before/after an action has been invoked.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ActionOrder-deprecated.html">@ActionOrder</a></td>
        <th>UI</th>
        <td>Order of buttons and menu items representing actions.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./ActionSemantics.html">@ActionSemantics</a></td>
        <th>Domain</th>
        <td>Query-only, idempotent or non-idempotent.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Aggregated.html">@Aggregated</a></td>
        <th>Domain, persistence</th>
        <td>Part of an aggregate root (only partly supported)
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Audited.html">@Audited</a></td>
        <th>Domain</th>
        <td>Audit changes to an object
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./AutoComplete.html">@AutoComplete</a></td>
        <th>UI</th>
        <td>Repository method to search for entities
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bookmarkable.html">@Bookmarkable</a></td>
        <th>UI</th>
        <td>Whether (and how) to create a bookmark for visited object.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bounded.html">@Bounded</a></td>
        <th>Domain</th>
        <td>Bounded (and limited) number of instances of an entity type, translates into a drop-down for any property of
            that type.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Bulk.html">@Bulk</a></td>
        <th>UI, Domain</th>
        <td>Indicates an action is a bulk action, can be applied to multiple instances.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CollectionInteraction.html">@CollectionInteraction</a></td>
        <th>Domain</th>
        <td>Enable subscribers to either veto, validate or take further steps before/after a collection has been added to or
            removed from.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Command.html">@Command</a></td>
        <th>Domain</th>
        <td>Action invocation should be reified as a command object, optionally persistable for profiling and enhanced
            auditing, and background/async support.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CssClass.html">@CssClass</a></td>
        <th>UI</th>
        <td>Allow visual representation of individual objects or object members layout to be customized by application-specific CSS.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./CssClassFa.html">@CssClassFa</a></td>
        <th>UI</th>
        <td>So that font awesome icons can be applied to action buttons/menu items and optionally as an object icon.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Debug-deprecated.html">@Debug</a></td>
        <th>UI</th>
        <td>Action only invocable in debug mode.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./Defaulted.html">@Defaulted</a></td>
        <th>Domain</th>
        <td>Indicates that a (value) class has a default value.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./DescribedAs.html">@DescribedAs</a></td>
        <th>UI</th>
        <td>Provide a longer description/tool-tip of an object or object member.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Digits.html">@javax.validation.constraints.Digits</a></td>
        <th>Domain</th>
        <td>Precision/scale for BigDecimal values.
        </td>
        <td></td>
        <td></td>
    <tr>
        <td><a href="./Disabled.html">@Disabled</a></td>
        <th>UI/domain</th>
        <td>Object property cannot be edited, an object collection cannot be added to/removed from, or an
            object action cannot be invoked.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Encodable.html">@Encodable</a></td>
        <th>Persistence</th>
        <td>Indicates that a (value) class can be serialized/encoded.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./EqualByContent.html">@EqualByContent</a></td>
        <th>Domain</th>
        <td>Indicates that a value class has equality semantics.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Exploration-deprecated.html">@Exploration</a></td>
        <th>UI</th>
        <td>Action available in special 'exploration' mode.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./Facets.html">@Facets</a></td>
        <th>(any)</th>
        <td>Install arbitrary facets within the Isis metamodel.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./FieldOrder-deprecated.html">@FieldOrder</a></td>
        <th>UI</th>
        <td>Order of properties and collections
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./Hidden.html">@Hidden</a></td>
        <th>UI/domain</th>
        <td>Object member is not visible.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./HomePage.html">@HomePage</a></td>
        <th>UI</th>
        <td>Query-only action (on domain service) to be invoked, result of which is
            rendered as the user's home page.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Idempotent-deprecated.html">@Idempotent</a></td>
        <th>Domain</th>
        <td>Replaced by @ActionSemantics.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./Ignore-deprecated.html">@Ignore</a></td>
        <th>Domain</th>
        <td>Replaced by @Programmatic.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./Immutable.html">@Immutable</a></td>
        <th>Domain</th>
        <td>An object's state cannot be changed (properties cannot be edited, collections cannot be added to or removed
            from). Actions <i>can</i> still be invoked.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Inject.html">@javax.inject.Inject</a></td>
        <th>Domain</th>
        <td>Inject domain service into a domain object (entity or view model) or another domain service.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Mask.html">@Mask</a></td>
        <th>UI/domain</th>
        <td>How to parse/render values (not properly supported)
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./LabelAt.html">@LabelAt</a></td>
        <th>UI</th>
        <td>Positioning of property or action parmaeter label either to top or the left.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MaxLength.html">@MaxLength</a></td>
        <th>Domain</th>
        <td>Maximum length of a property value (strings).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroupLayout.html">@MemberGroupLayout</a></td>
        <th>UI</th>
        <td>Grouping of properties into groups, and organizing of properties, collections into columns.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberGroups.html">@MemberGroups</a></td>
        <th>UI</th>
        <td>Replaced by @MemberGroupLayout
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MemberOrder.html">@MemberOrder</a></td>
        <th>UI</th>
        <td>Ordering of properties, collections and actions, and also associating actions with either a property or a
            collection.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MinLength.html">@MinLength</a></td>
        <th>UI</th>
        <td>Minimum number of characters required for an auto-complete search argument.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MultiLine.html">@MultiLine</a></td>
        <th>UI</th>
        <td>Render string property over multiple lines (a textarea rather than a textbox)
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./MustSatisfy.html">@MustSatisfy</a></td>
        <th>Domain</th>
        <td>Specify arbitrary specification constraints on a class member, action parameter or object.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Named.html">@Named</a></td>
        <th>UI</th>
        <td>Override name inferred from class. Required for parameter names (prior to Java8)
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotContributed.html">@NotContributed</a></td>
        <th>UI</th>
        <td>Indicates that a domain service action is not rendered as an action on the (entity) types of its
            parameters. For 1-arg query-only actions, controls whether the domain service action is rendered as a property
            or collection on the entity type of its parameter.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotInServiceMenu.html">@NotInServiceMenu</a></td>
        <th>UI</th>
        <td>Indicates that a domain service should not be rendered in the application menu (at top of page in
            Wicket viewer).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersistable.html">@NotPersistable</a></td>
        <th>Domain/persistence</th>
        <td>Indicates that a domain object may not be programmatically persisted (partly supported).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./NotPersisted.html">@NotPersisted</a></td>
        <th>Domain/persistence</th>
        <td>Indicates that an object property is derived, is not persisted.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ObjectType.html">@ObjectType</a></td>
        <th>Domain</th>
        <td>For constructing the external identifier (URI) of an entity instance (part of its URL in both Wicket viewer and
            Restful Objects viewer).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Optional.html">@Optional</a></td>
        <th>Domain</th>
        <td>Specifies that a property or action parameter is not mandatory.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Paged.html">@Paged</a></td>
        <th>UI</th>
        <td>Number of instances to display in tables representing (parented or standalone) collections.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Parseable.html">@Parseable</a></td>
        <th>UI/domain</th>
        <td>Indicates that a (value) class can be reconstructed from a string.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Plural.html">@Plural</a></td>
        <th>UI</th>
        <td>For the irregular plural form of an entity type.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PostsPropertyChangedEvent-deprecated.html">@PostsPropertyChangedEvent</a></td>
        <th>Domain</th>
        <td>Replaced by @PropertyInteraction
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./PropertyInteraction.html">@PropertyInteraction</a></td>
        <th>Domain</th>
        <td>Enable subscribers to either veto, validate or take further steps before/after a property has been modified or
            cleared.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Programmatic.html">@Programmatic</a></td>
        <th>Domain</th>
        <td>Ignore a public method, excluded from the Isis metamodel.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Prototype.html">@Prototype</a></td>
        <th>UI</th>
        <td>Indicates that an action should only be visible in 'prototype' mode.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PublishedAction.html">@PublishedAction</a></td>
        <th>Domain</th>
        <td>Action invocation should be serialized and published by configured PublishingService (if any), eg to other
            systems.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./PublishedObject.html">@PublishedObject</a></td>
        <th>Domain</th>
        <td>Change to object should be serialized and published by configured PublishingService (if any), eg to other
            systems.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./QueryOnly-deprecated.html">@QueryOnly</a></td>
        <th>Domain</th>
        <td>Replaced by @ActionSemantics.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./RegEx.html">@RegEx</a></td>
        <th>Domain</th>
        <td>Validate change to value of string property.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Render.html">@Render</a></td>
        <th>UI</th>
        <td>Eagerly (or lazily) render the contents of a collection.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./RenderedAsDayBefore.html">@RenderedAsDayBefore</a></td>
        <th>UI</th>
        <td>Render dates as the day before; ie store [a,b) internally but render [a,b-1]) to end-user.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./RequestScoped.html">@javax.enterprise.context.RequestScoped</a></td>
        <th>Domain</th>
        <td>Specify that a domain service has request-scope (rather than a singleton).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Resolve-deprecated.html">@Resolve</a></td>
        <th>UI</th>
        <td>Replaced by @Render.
        </td>
        <td></td>
        <td>Y</td>
    </tr>
    <tr>
        <td><a href="./SortedBy.html">@SortedBy</a></td>
        <th>UI</th>
        <td>Display instances in collections in the order determined by the provided Comparator.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Title.html">@Title</a></td>
        <th>UI</th>
        <td>Indicates which of the object's properties should be used to build up a title for the object.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./TypeOf.html">@TypeOf</a></td>
        <th>Domain</th>
        <td>The type of entity stored within a collection (if cannot be otherwise inferred, eg from generics).
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./TypicalLength.html">@TypicalLength</a></td>
        <th>UI</th>
        <td>The typical length of a string property, eg to determine a sensible length for a textbox.
        </td>
        <td>Y</td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./Value.html">@Value</a></td>
        <th>Domain</th>
        <td>Specify that a class has value-semantics.
        </td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td><a href="./ViewModel.html">@ViewModel</a></td>
        <th>Domain/persistence</th>
        <td>Specify that a class is a view model (rather than a persisted entity).
        </td>
        <td></td>
        <td></td>
    </tr>
</table>
