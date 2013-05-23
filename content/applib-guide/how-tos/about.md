title: How-tos

##How to write a basic Domain Entity or Service

Domain entities are instances of some class, usually (the vast majority)
being persisted. Domain services are singletons that act typically act
as factories and repositories. Domain entities have state in the form of
properties and collections; domain services do not. Both domain entities
and services have behaviour, in the form of actions.

* [How to have a domain entity be a POJO](./how-to-01-010-How-to-have-a-domain-entity-be-a-POJO.html)

* [How to have a domain service be a POJO](./how-to-01-020-How-to-have-a-domain-service-be-a-POJO.html)

* [How to add a property to a domain entity](./how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)

* [How to specify a title for a domain entity](./how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)

* [How to add a collection to a domain entity](./how-to-01-050-How-to-add-a-collection-to-a-domain-entity.html)

* [How to add an action to a domain entity or service](./how-to-01-060-How-to-add-an-action-to-a-domain-entity-or-service.html)

* [How to specify the icon for a domain entity](./how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)

* [How to specify the order in which properties or collections are displayed](./how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html)

* [How to specify the order in which actions appear on the menu](./how-to-01-090-How-to-specify-the-order-in-which-actions-appear-on-the-menu.html)

* [How to make a property optional](./how-to-01-100-How-to-make-a-property-optional.html)

* [How to make an action parameter optional](./how-to-01-110-How-to-make-an-action-parameter-optional.html)

* [How to specify the size of String properties](./how-to-01-120-How-to-specify-the-size-of-String-properties.html)

* [How to specify the size of String action parameters](./how-to-01-130-How-to-specify-the-size-of-String-action-parameters.html)

* [How to specify names or descriptions for an action parameter](./how-to-01-140-How-to-specify-names-or-descriptions-for-an-action-parameter.html)

* [How to inject services into a domain entity or other service](./how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html)

* [How to create or delete objects within your code](./how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)


##How to add business rules

Business rules can be added to domain objects in a number of ways. As
well as the business logic encapsulated by domain object actions, the
framework also supports a number of conventions that allow a domain
entity or service's members to be made visible or hidden, to be enabled
or disabled (greyed out), and to validate arguments when invoking an
action, setting a new value for a property, or if adding a new element
to a collection.

Or, in other words: "see it, use it, do it".

* [How to hide a property](./how-to-02-010-How-to-hide-a-property.html)

* [How to hide a collection](./how-to-02-020-How-to-hide-a-collection.html)

* [How to hide an action](./how-to-02-030-How-to-hide-an-action.html)

* [How to specify that none of an object's members is visible](./how-to-02-040-How-to-specify-that-none-of-an-object's-members-is-visible.html)

* [How to prevent a property from being modified](./how-to-02-050-How-to-prevent-a-property-from-being-modified.html)

* [How to prevent a collection from being modified](./how-to-02-060-How-to-prevent-a-collection-from-being-modified.html)

* [How to prevent an action from being invoked](./how-to-02-070-How-to-prevent-an-action-from-being-invoked.html)

* [How to specify that none of an object's members can be modified or invoked](./how-to-02-080-How-to-specify-that-none-of-an-object's-members-can-be-modified-or-invoked.html)

* [How to specify that an object is immutable](./how-to-02-090-How-to-specify-that-an-object-is-immutable.html)

* [How to validate user input for a property](./how-to-02-100-How-to-validate-user-input-for-a-property.html)

* [How to validate an object being added or removed from a collection](./how-to-02-110-How-to-validate-an-object-being-added-or-removed-from-a-collection.html)

* [How to validate an action parameter argument](./how-to-02-120-How-to-validate-an-action-parameter-argument.html)

* [How to validate declaratively using MustSatisfy](./how-to-02-130-How-to-validate-declaratively-using-MustSatisfy.html)


##How to provide drop-downs and default values

Invoking actions or setting properties requires that the user specify a
valid value; of the correct type, and that passes any validation rules
that may have been defined. To make things are easier for the user, you
can provide lists of choices; viewers typically render these values in a
drop-down list box.

In a similar vein, there may be a default value for an action parameter;
this can also be specified.

* [How to specify a set of choices for a property](./how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html)

* [How to specify a set of choices for an action parameter](./how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)

* [How to specify that a class of objects has a limited number of instances](./how-to-03-030-How-to-specify-that-a-class-of-objects-has-a-limited-number-of-instances.html)

* [How to find an entity (for an action parameter or property) using auto-complete](./how-to-03-040-How-to-find-an-entity-(for-an-action-parameter-or-property)-using-auto-complete.html)

* [How to specify default values for an action parameter](./how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html)


##How to derive properties and collections, and other side-effects

The *Isis* viewers will automatically render the state of properties and
collections, but the values of such need not be persisted; they can be
derived from other information available to the object.

* [How to make a derived property](./how-to-04-010-How-to-make-a-derived-property.html)

* [How to make a derived collection](./how-to-04-020-How-to-make-a-derived-collection.html)

* [How to inline the results of a query-only repository action](./how-to-04-030-How-to-inline-the-results-of-a-query-only-repository-action.html)

* [How to trigger other behaviour when a property is changed](./how-to-04-040-How-to-trigger-other-behaviour-when-a-property-is-changed.html)

* [How to trigger other behaviour when an object is added or removed](./how-to-04-050-How-to-trigger-other-behaviour-when-an-object-is-added-or-removed.html)

* [How to set up and maintain bidirectional relationships](./how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)


##How to provide additional UI hints

With the exception of value types for action parameters <!--(see ?)-->, Isis
can normally infer a reasonable name for entity/service and its class
members. However, these defaults can be overridden if required. One
possible case is where the desired name is a reserved word in Java (eg
"default", or "package").

A slightly more advanced use-case is to specify an icon not for an
entity's type, but for an entity instance. Typically this reflects that
instance's state, eg with an overlay on top of the base icon. For
example, this allows the user to distinguish between an Order that has
been placed vs one that has been shipped.

* [How to specify a name or description for an object](./how-to-05-010-How-to-specify-a-name-or-description-for-an-object.html)

* [How to specify a name or description for a property](./how-to-05-020-How-to-specify-a-name-or-description-for-a-property.html)

* [How to specify a name or description for a collection](./how-to-05-030-How-to-specify-a-name-or-description-for-a-collection.html)

* [How to specify names or description for an action](./how-to-05-040-How-to-specify-names-or-description-for-an-action.html)

* [How to specify the icon for an individual objects state](./how-to-05-050-How-to-specify-the-icon-for-an-individual-objects-state.html)



##How to deal with errors

Things go wrong. *Isis* handles many of the usual error conditions, but
your app may also wish to notify the user also when something goes awry.

* [How to deal with errors](./how-to-06-000-How-to-deal-with-errors.html)

* [How to pass a messages and errors back to the user](./how-to-06-010-How-to-pass-a-messages-and-errors-back-to-the-user.html)

* [How to deal with an unexpected error](./how-to-06-020-How-to-deal-with-an-unexpected-error.html)


##How to handle the entity persistence lifecycle

*Isis* automatically persists domain entities, performing both lazy
loading and dirty object tracking. As an application programmer you can
get visibility into and influence this behaviour.


* [How to set up the initial value of a property programmatically](./how-to-07-010-How-to-set-up-the-initial-value-of-a-property-programmatically.html)

* [How to insert behaviour into the object life cycle](./how-to-07-020-How-to-insert-behaviour-into-the-object-life-cycle.html)

* [How to ensure object is in valid state](./how-to-07-030-How-to-ensure-object-is-in-valid-state.html)

* [How to specify that an object should not be persisted](./how-to-07-040-How-to-specify-that-an-object-should-not-be-persisted.html)

* [How to perform lazy loading](./how-to-07-050-How-to-perform-lazy-loading.html)

* [How to perform dirty object tracking](./how-to-07-060-How-to-perform-dirty-object-tracking.html)


##How to handle security concerns

* [Hiding, disabling or validating for specific users or roles](./how-to-08-010-Hiding,-disabling-or-validating-for-specific-users-or-roles.html)

* [How to use Isis authorization manager](./how-to-08-020-How-to-use-Isis-authorization-manager.html)



