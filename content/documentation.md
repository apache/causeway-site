Title: Documentation

{documentation

{row

{col-md-4
### Elevator Pitch

  - [What's Isis?](getting-started/screenshots.html) ... in pictures
  - [Common Use Cases](learning-more/common-use-cases.html)
  - [Online demo](http://isisdemo.mmyco.co.uk/) (ToDo App)

### Getting Started

  - **[Simple Archetype](getting-started/simple-archetype.html) ([1.3.1](getting-started/release-notes/about.html))**
  - [ToDo App (Quickstart) Archetype](getting-started/quickstart-archetype.html) ([1.3.1](getting-started/release-notes/about.html))

}

{col-md-4
### Tutorials, Screencasts
  - [Tutorials](learning-more/tutorials.html)
  - [Screencasts](getting-started/screencasts.html)

### Learning More

  - [Articles, Conferences, Podcasts](learning-more/articles-and-presentations.html)
  - [Books](learning-more/books.html)
  - [Naked Objects PhD thesis](learning-more/resources/Pawson-Naked-Objects-thesis.pdf) (Pawson)
  - [Downloadable Presentations](learning-more/presentations.html)

}

{col-md-4
### Resources

  - **[Editor templates](getting-started/editor-templates.html)**
  - [Icons](getting-started/icons.html)
  - **[Programming Model Cheat Sheet](getting-started/cheat-sheet.html)**

### Releases

- [Release Matrix](release-matrix.html)

}

}

{row

{col-md-12
## How-tos

*Apache Isis* works using convention-over-configuration; you write your domain objects following a set of conventions, and these are interpreted by the framework in order to render, persist, remote or otherwise interact with your domain model.  These conventions are together known as the *Apache Isis Programming Model*. 

}

}

{row

{col-md-4

###Entities

* [About writing domain entities](./applib-guide/how-tos/about.html)

###How to write a basic Domain Entity or Service

* [How to have a domain entity be a POJO](./applib-guide/how-tos/how-to-01-010-How-to-have-a-domain-entity-be-a-POJO.html)

* [How to have a domain service be a POJO](./applib-guide/how-tos/how-to-01-020-How-to-have-a-domain-service-be-a-POJO.html)

* [How to add a property to a domain entity](./applib-guide/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)

* [How to specify a title for a domain entity](./applib-guide/how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)

* [How to add a collection to a domain entity](./applib-guide/how-tos/how-to-01-050-How-to-add-a-collection-to-a-domain-entity.html)

* [How to add an action to a domain entity or service](./applib-guide/how-tos/how-to-01-060-How-to-add-an-action-to-a-domain-entity-or-service.html)

* [How to decouple dependencies using contributions](how-to-01-062-How-to-decouple-dependencies-using-contributions.html)

* [How to add an action to be called on every object within a list](./applib-guide/how-tos/how-to-01-065-How-to-add-an-action-to-be-called-on-every-object-in-a-list.html)

* [How to specify the icon for a domain entity](./applib-guide/how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)

* [How to specify the order in which properties or collections are displayed](./applib-guide/how-tos/how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html)

* [How to specify the order in which actions appear on the menu](./applib-guide/how-tos/how-to-01-090-How-to-specify-the-order-in-which-actions-appear-on-the-menu.html)

* [How to make a property optional](./how-to-01-100-How-to-make-a-property-optional.html)

* [How to make an action parameter optional](./applib-guide/how-tos/how-to-01-110-How-to-make-an-action-parameter-optional.html)

* [How to specify the size of String properties](./how-to-01-120-How-to-specify-the-size-of-String-properties.html)

* [How to specify the size of String action parameters](./how-to-01-130-How-to-specify-the-size-of-String-action-parameters.html)

* [How to specify names or descriptions for an action parameter](./how-to-01-140-How-to-specify-names-or-descriptions-for-an-action-parameter.html)

* [How to inject services into a domain entity or other service](./how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html)

* [How to create or delete objects within your code](./how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)


###How to add business rules

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


###How to provide drop-downs and default values

Invoking actions or setting properties requires that the user specify a
valid value; of the correct type, and that passes any validation rules
that may have been defined. To make things are easier for the user, you
can provide lists of choices; viewers typically render these values in a
drop-down list box.

In a similar vein, there may be a default value for an action parameter;
this can also be specified.

For properties:

* [How to specify a set of choices for a property](./how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html)

* [How to specify an auto-complete for a property](./how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html)

* [How to specify the default value of an object property](./how-to-03-017-How-to-specify-default-value-of-an-object-property.html)

For actions:

* [How to specify a set of choices for an action parameter](./how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)

* [How to specify dependent choices for action parameters (eg category/subcategory)](./how-to-03-022-How-to-specify-dependent-choices-for-action-parameters.html)

* [How to specify an auto-complete for an action parameter](./how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html)

* [How to specify default values for an action parameter](./how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html)



For both:

* [How to specify (for an action parameter or property) that a class has a limited number of instances](./how-to-03-030-How-to-specify-that-a-class-of-objects-has-a-limited-number-of-instances.html)

* [How to find an entity (for an action parameter or property) using auto-complete](./how-to-03-040-How-to-find-an-entity-(for-an-action-parameter-or-property)-using-auto-complete.html)



###How to derive properties and collections, and other side-effects

The *Isis* viewers will automatically render the state of properties and
collections, but the values of such need not be persisted; they can be
derived from other information available to the object.

* [How to make a derived property](./how-to-04-010-How-to-make-a-derived-property.html)

* [How to make a derived collection](./how-to-04-020-How-to-make-a-derived-collection.html)

* [How to inline the results of a query-only repository action](./how-to-04-030-How-to-inline-the-results-of-a-query-only-repository-action.html)

* [How to trigger other behaviour when a property is changed](./how-to-04-040-How-to-trigger-other-behaviour-when-a-property-is-changed.html)

* [How to trigger other behaviour when an object is added or removed](./how-to-04-050-How-to-trigger-other-behaviour-when-an-object-is-added-or-removed.html)

* [How to set up and maintain bidirectional relationships](./how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)


###How to provide additional UI hints

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



###How to deal with errors

Things go wrong. *Isis* handles many of the usual error conditions, but
your app may also wish to notify the user also when something goes awry.

* [How to pass a messages and errors back to the user](./how-to-06-010-How-to-pass-a-messages-and-errors-back-to-the-user.html)

* [How to deal with an unexpected error](./how-to-06-020-How-to-deal-with-an-unexpected-error.html)


###How to handle the entity persistence lifecycle

*Isis* automatically persists domain entities, performing both lazy
loading and dirty object tracking. As an application programmer you can
get visibility into and influence this behaviour.


* [How to set up the initial value of a property programmatically](./how-to-07-010-How-to-set-up-the-initial-value-of-a-property-programmatically.html)

* [How to insert behaviour into the object life cycle](./how-to-07-020-How-to-insert-behaviour-into-the-object-life-cycle.html)

* [How to ensure object is in valid state](./how-to-07-030-How-to-ensure-object-is-in-valid-state.html)

* [How to specify that an object should not be persisted](./how-to-07-040-How-to-specify-that-an-object-should-not-be-persisted.html)

* [How to perform lazy loading](./how-to-07-050-How-to-perform-lazy-loading.html)

* [How to perform dirty object tracking](./how-to-07-060-How-to-perform-dirty-object-tracking.html)

* [How to hook into the object lifecycle using callbacks](./how-to-07-070-How-to-hook-into-the-object-lifecycle-using-callbacks.html)


###How to control access to entity features

*Isis* allows you to control access to entities either using application logic or through a pluggable authorisation manager.

* [How to write application logic to hide, disable and validate for specific users/roles](./how-to-08-010-Hiding,-disabling-or-validating-for-specific-users-or-roles.html)

* [How to use Isis' authorization manager](./how-to-08-020-How-to-use-Isis-authorization-manager.html)

}

{col-md-4

###Domain Services

* [About domain services](./applib-guide/domain-services/about.html)

* [How to register domain services, repositories and factories](./applib-guide/domain-services/how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html)

* [How to write a typical domain service](./applib-guide/domain-services/how-to-09-020-How-to-write-a-typical-domain-service.html)

* [How to use a generic repository](./applib-guide/domain-services/how-to-09-030-How-to-use-a-generic-repository.html)

* [How to write a custom repository](./applib-guide/domain-services/how-to-09-040-How-to-write-a-custom-repository.html)

* [How to use Factories](./applib-guide/domain-services/how-to-09-050-How-to-use-Factories.html)

###Value Types

* [About value Types](./applib-guide/value-types/about.html)
* [Built-in Value Types](./applib-guide/value-types/010-Built-in-Value-Types.html)
* [Custom Value Types](./applib-guide/value-types/020-Custom-Value-Types.html)
* [Third-party Value Types](./applib-guide/value-types/030-Third-party-Value-Types.html)

}

{col-md-4

###Supporting Features

* [Clock, Fixtures, etc](./applib-guide/supporting-features/about.html)
* [Applib utility classes](applib-guide/reference/Utility.html)


###  Config Files

* [Configuration Files](core/configuration-files.html)
* [Static and dynamic layouts](core/dynamic-layouts.html)

}

}

{row

{col-md-12
## Reference

}

}

{row

{col-md-4

###  Applib

* [Deployment Types](core/deployment-type.html)
* [Recognized Methods and Prefixes](./applib-guide/reference/Recognized-Methods-and-Prefixes.html)
* [Recognized Annotations](./applib-guide/reference/recognized-annotations/about.html)
* [DomainObjectContainer interface](./applib-guide/reference/DomainObjectContainer.html)
* [Security](./applib-guide/reference/Security.html)
* [Applib Utility Classes](./applib-guide/reference/Utility.html)
* [Applib Events](./applib-guide/reference/Event.html)

}

{col-md-4

###  Services

  - [Initializing Services](core/services/initializing-services.html)
  - [Auditing Service](core/services/auditing-service.html)
  - [Bookmark Service](core/services/bookmark-service.html)
  - [Developer Utilities Service](core/services/developer-utilities-service.html)
  - [Exception Recognizers](core/services/exception-recognizers.html)
  - [Publishing Service](core/services/publishing-service.html)
  - [Settings Services](core/services/settings-services.html)

}

{col-md-4

### Customisation

  - [Finetuning the Programming Model](core/metamodel-finetuning-the-programming-model.html)

}

}

{row

{col-md-12
## Core [1.3.0](core/release-notes/about.html)

}

}

{row

{col-md-4

### Dev Support
<p class="display:none"/>

  * [Unit Test Support](core/unittestsupport.html)
  * [Integration Test Support](core/integtestsupport.html)
  * [BDD/Integ Test Support](core/specsupport-and-integtestsupport.html)
  * [Wrapper Factory](core/wrapper.html) [stub]

}

{col-md-4

### Runtime
<p class="display:none"/>

  * [Core Runtime](core/runtime.html) [stub]
  * [Webserver](core/webserver.html) [stub]

}

{col-md-4
  
### Bundled Components

  - [Bytecode Enhancers](core/bytecode.html) [stub]
  - [Bypass Security](core/bypass-security.html) [stub]
  - [In-memory Object Store](core/inmemory-objectstore.html) [stub]
  - [In-memory Profile Store](core/inmemory-profilestore.html) [stub]

}

}


{row

{col-md-12
## Viewers
}

{col-md-4
###  Wicket [1.3.1](components/viewers/wicket/release-notes/about.html)

  - [About](components/viewers/wicket/about.html)
  - [Titles in tables](components/viewers/wicket/titles-in-tables.html)
  - [Static and dynamic layouts](core/dynamic-layouts.html)
  - [Suppressing 'remember me'](components/viewers/wicket/suppressing-remember-me.html)
  - [The About page](components/viewers/wicket/configuring-the-about-page.html)
  - [Customizing the viewer](components/viewers/wicket/customizing-the-viewer.html)

}

{col-md-4
###  RestfulObjects [2.1.0](components/viewers/restfulobjects/release-notes/about.html)
<p class="display:none"/>

  - [About](components/viewers/restfulobjects/about.html)


##### Applib Service Implementations

- [Event Serializer per RO Spec](components/viewers/restfulobjects/event-serializer-rospec.html)
}

{col-md-4
### DHTMLX

  - [About](third-party/viewers/dhtmlx/about.html)

Note: this viewer is third-party open source (outside Apache)

}

}


{row

{col-md-12
## JDO/DataNucleus Object Store [1.3.0](components/objectstores/jdo/release-notes/about.html)
}

{col-md-4
###  Configuration

  - [About](components/objectstores/jdo/about.html)
  - [DataNucleus and Eclipse](components/objectstores/jdo/datanucleus-and-eclipse.html)
  - [DataNucleus and Maven](components/objectstores/jdo/datanucleus-and-maven.html)
  - [`persistence.xml` file](components/objectstores/jdo/persistence_xml.html)
  - [Using a JNDI Datasource](components/objectstores/jdo/using-jndi-datasource.html)
  - [Using the `IsisJdoSupport` service](components/objectstores/jdo/isisjdosupport-service.html)
  - [Enabling Logging](components/objectstores/jdo/enabling-logging.html)
  - [Deploying on the Google App Engine](components/objectstores/jdo/deploying-on-the-google-app-engine.html)

}

{col-md-4
###  JDO Mapping Hints
<p class="display:none"/>

  - [Mapping Mandatory and Optional Properties](components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
  - [Mapping JODA Dates](components/objectstores/jdo/mapping-joda-dates.html)
  - [Mapping BigDecimals](components/objectstores/jdo/mapping-bigdecimals.html)
  - [Mapping Blobs](components/objectstores/jdo/mapping-blobs.html)
  - [Lazy Loading](components/objectstores/jdo/lazy-loading.html)
  - [Managed 1:m bidirectional relationships](components/objectstores/jdo/managed-1-to-m-relationships.html)

  
}

{col-md-4
### Applib Service Implementations
<p class="display:none"/>

  - [Eagerly Registering Entity Types](components/objectstores/jdo/eagerly-registering-entities.html)
  - [Publishing Service on JDO](components/objectstores/jdo/publishing-service-jdo.html) 
  - [Auditing Service on JDO](components/objectstores/jdo/auditing-service-jdo.html)
  - [Exception Recognizers](components/objectstores/jdo/exception-recognizers-jdo.html)
  - [Settings Services on JDO](components/objectstores/jdo/settings-services-jdo.html) [1.3.0]

  
}

}


{row

{col-md-12
## Security
}

{col-md-4
### Shiro [1.3.0](components/security/shiro/release-notes/about.html)

  - [About](components/security/shiro/about.html)
  - [Configuring Isis to use Shiro](components/security/shiro/configuring-shiro.html)
  - [Configuring Shiro to use LDAP](components/security/shiro/using-ldap.html)
  - [Shiro Realm Mappings](components/security/shiro/shiro-realm-mappings.html)
  - [Format of Isis Permissions](components/security/shiro/format-of-permissions.html)

}

{col-md-4
### File [1.0.1](components/security/file/release-notes/about.html)
<p class="display:none"/>

  - [About](components/security/file/about.html)

}

{col-md-4
}

}

{row

{col-md-12
## Unreleased Components
}

{col-md-4
###  NoSQL Object Store [0.2.0-incubating](components/objectstores/nosql/release-notes/about.html)

- [About](components/objectstores/nosql/about.html)

----------

###XML Object Store [0.2.0-incubating](components/objectstores/xml/release-notes/about.html)
- [About](components/objectstores/xml/about.html)

}

{col-md-4
###  Scimpi Viewer [0.2.0-incubating](components/viewers/scimpi/release-notes/about.html)

  - [About](components/viewers/scimpi/about.html)

----------

###  DnD Viewer [0.2.0-incubating](components/viewers/dnd/release-notes/about.html)

  - [About](components/viewers/dnd/about.html)

}


{col-md-4
###Groovy Programming Model [0.2.0-incubating](components/progmodels/groovy/release-notes/about.html)

  - [About](components/progmodels/groovy/about.html)

----------

###XML Profile Store [0.2.0-incubating](components/profilestores/xml/release-notes/about.html)

  - [About](components/profilestores/xml/about.html)

}

}

{row

{col-md-12
##  Other Topics
}

{col-md-4

###  Contributors

  - [Contributing](contributors/contributing.html)
  - [Development Environment](contributors/development-environment.html)
  - [Building Isis](contributors/building-isis.html)
  - [Git Policy](contributors/git-policy.html)
  - [Git Cookbook](contributors/git-cookbook.html)
  - [Versioning Policy](contributors/versioning-policy.html)

}

{col-md-4
###  Committers

  - [Updating the CMS site](contributors/updating-the-cms-site.html)
  - [Applying Patches](contributors/applying-patches.html)
  - [Recreating an archetype](contributors/recreating-an-archetype.html)
  - [Snapshot process](contributors/snapshot-process.html)
  - [Release process](contributors/release-process.html)
  - [Release branch and tag names](contributors/release-branch-and-tag-names.html)
  - [Verifying releases](contributors/verifying-releases.html)
  - [Key generation](contributors/key-generation.html)

###  PMC

  - [Notes](contributors/pmc-notes.html)


}

{col-md-4
### Plugins

  - [Maven Plugin](other/maven-plugin.html) [stub]
  - [Eclipse IDE Plugin](other/eclipse-plugin.html) [stub]

<!--

----------

###Kemble
- [About](components/progmodels/kemble/about.html) [stub]
-->


###  Mothballed Components

These are no longer under active development

  - [HTML Viewer](components/viewers/html/about.html) (use Wicket)
  - [LDAP Security](components/security/ldap/about.html) (use Shiro)
  - [SQL Security](components/security/sql/about.html) (use Shiro)
  - [SQL Profile Store](components/profilestores/sql/about.html)
  - [SQL Object Store](components/objectstores/sql/about.html) (use JDO)
  - [BDD (Concordion)](components/viewers/bdd/about.html) (use Cucumber-JVM in unittestsupport and integtestsupport)

}

}

}
