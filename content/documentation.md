Title: Documentation

{documentation

{row

{col-md-4
### Elevator pitch

  - **[What's Isis?](getting-started/screenshots.html) ... in pictures**
  - [Common Use Cases](learning-more/common-use-cases.html)
  - [Online demo](http://isisdemo.mmyco.co.uk/) (ToDo App)

### Getting started

  - **[Simple Archetype](getting-started/simple-archetype.html) ([1.3.1](getting-started/release-notes/about.html))**
  - [ToDo App (Quickstart) Archetype](getting-started/quickstart-archetype.html) ([1.3.1](getting-started/release-notes/about.html))

}

{col-md-4
### Tutorials, screencasts
  - [Tutorials](learning-more/tutorials.html)
  - **[Screencasts](getting-started/screencasts.html)**

### Learning more

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
## Programming model

}

}

{row

{col-md-4

###Principles

* [About domain entities](./applib-guide/how-tos/about.html)
* [About domain services](./applib-guide/domain-services/about.html)
* [About value Types](./applib-guide/value-types/about.html)

###Pojos

* [Pojo vs Inheriting from framework](./applib-guide/how-tos/how-to-01-010-How-to-have-a-domain-object-be-a-POJO.html)
* [Registering a domain service](./applib-guide/domain-services/how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html)
* [Entity property](./applib-guide/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)
* [Built-in Value Types](./applib-guide/value-types/010-Built-in-Value-Types.html)
* [Entity title](./applib-guide/how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)
* [Entity collection](./applib-guide/how-tos/how-to-01-050-How-to-add-a-collection-to-a-domain-entity.html)
* [Entity or service action](./applib-guide/how-tos/how-to-01-060-How-to-add-an-action-to-a-domain-entity-or-service.html)
* [Names/description of action param](./applib-guide/how-tos/how-to-01-140-How-to-specify-names-or-descriptions-for-an-action-parameter.html)
* [Injecting services](./applib-guide/how-tos/how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html)

### Object management

* [Finding objects](./applib-guide/domain-services/how-to-09-040-How-to-write-a-custom-repository.html)
* [Instantiating and persisting objects](./applib-guide/domain-services/how-to-09-050-How-to-use-Factories.html)
* [Create/delete objects](./applib-guide/how-tos/how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)

}

{col-md-4

###UI hints

* [Entity icons](./applib-guide/how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)
* [Ordering prop/colls in the UI](./applib-guide/how-tos/how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html)
* [Ordering actions in the UI](./applib-guide/how-tos/how-to-01-090-How-to-specify-the-order-in-which-actions-appear-on-the-menu.html)

###Business rules

Visibility ("see it")

* [Hide a property](./applib-guide/how-tos/how-to-02-010-How-to-hide-a-property.html)
* [Hide a collection](./applib-guide/how-tos/how-to-02-020-How-to-hide-a-collection.html)
* [Hide an action](./applib-guide/how-tos/how-to-02-030-How-to-hide-an-action.html)

Usability ("use it")

* [Unmodifiable property](./applib-guide/how-tos/how-to-02-050-How-to-prevent-a-property-from-being-modified.html)
* [Unmodifiable collection](./applib-guide/how-tos/how-to-02-060-How-to-prevent-a-collection-from-being-modified.html)
* [Uninvokable action](./applib-guide/how-tos/how-to-02-070-How-to-prevent-an-action-from-being-invoked.html)

Validity ("do it")

* [Validate property](./applib-guide/how-tos/how-to-02-100-How-to-validate-user-input-for-a-property.html)
* [Validate collection add/remove](./applib-guide/how-tos/how-to-02-110-How-to-validate-an-object-being-added-or-removed-from-a-collection.html)
* [Validate action params](./applib-guide/how-tos/how-to-02-120-How-to-validate-an-action-parameter-argument.html)

}

{col-md-4

### Common constraints

* [Optional property](./applib-guide/how-tos/how-to-01-100-How-to-make-a-property-optional.html)
* [Optional action ](./applib-guide/how-tos/how-to-01-110-How-to-make-an-action-parameter-optional.html)
* [Size of string properties](./applib-guide/how-tos/how-to-01-120-How-to-specify-the-size-of-String-properties.html)
* [Size of string action params](./applib-guide/how-tos/how-to-01-130-How-to-specify-the-size-of-String-action-parameters.html)

###Drop-downs &amp; defaults

For properties:

* [Choices for property](./applib-guide/how-tos/how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html)
* [Auto-complete for property](./applib-guide/how-tos/how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html)
* [Default for property](./applib-guide/how-tos/how-to-03-017-How-to-specify-default-value-of-an-object-property.html)

For actions:

* [Choices for action param](./applib-guide/how-tos/how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)
* [Dependent choices for action params](./applib-guide/how-tos/how-to-03-022-How-to-specify-dependent-choices-for-action-parameters.html)
* [Auto-complete for action param](./applib-guide/how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html)
* [Default for action param](./applib-guide/how-tos/how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html)

For both:

* [Drop-down for limited # instances](./applib-guide/how-tos/how-to-03-030-How-to-specify-that-a-class-of-objects-has-a-limited-number-of-instances.html)
* [Auto-complete (repository-based)](./applib-guide/how-tos/how-to-03-040-How-to-find-an-entity-(for-an-action-parameter-or-property)-using-auto-complete.html)

}

}


{row

{col-md-12
## More advanced topics

}

}

{row

{col-md-4

###Idioms and patterns

* [Singleton &amp; request-scoped services](./applib-guide/domain-services/how-to-09-020-How-to-write-a-typical-domain-service.html)
* [Decoupling dependencies using contributions](how-to-01-062-How-to-decouple-dependencies-using-contributions.html)
* [Bulk actions, acting upon lists](./applib-guide/how-tos/how-to-01-065-How-to-add-an-action-to-be-called-on-every-object-in-a-list.html)
* [Bidirectional relationships](./applib-guide/how-tos/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)

###Derived props/colls

* [Derived property](./applib-guide/how-tos/how-to-04-010-How-to-make-a-derived-property.html)
* [Derived collection](./applib-guide/how-tos/how-to-04-020-How-to-make-a-derived-collection.html)
* [Inlining query-only repository action](./applib-guide/how-tos/how-to-04-030-How-to-inline-the-results-of-a-query-only-repository-action.html)
* [Trigger on property change](./applib-guide/how-tos/how-to-04-040-How-to-trigger-other-behaviour-when-a-property-is-changed.html)
* [Trigger on collection change](./applib-guide/how-tos/how-to-04-050-How-to-trigger-other-behaviour-when-an-object-is-added-or-removed.html)

###Business rules

* [All members hidden](./applib-guide/how-tos/how-to-02-040-How-to-specify-that-none-of-an-object's-members-is-visible.html)
* [All members unmodifiable](./applib-guide/how-tos/how-to-02-080-How-to-specify-that-none-of-an-object's-members-can-be-modified-or-invoked.html)
* [Immutable object](./applib-guide/how-tos/how-to-02-090-How-to-specify-that-an-object-is-immutable.html)
* [Declarative validation using @MustSatisfy](./applib-guide/how-tos/how-to-02-130-How-to-validate-declaratively-using-MustSatisfy.html)


}

{col-md-4

### UI layout & hints

* [Static and dynamic layouts](core/dynamic-layouts.html)
* [Tweaking CSS classes](./applib-guide/how-tos/how-to-tweak-the-ui-using-css-classes.html)
* [Name/description of an object](./applib-guide/how-tos/how-to-05-010-How-to-specify-a-name-or-description-for-an-object.html)
* [Name/description of a property](./applib-guide/how-tos/how-to-05-020-How-to-specify-a-name-or-description-for-a-property.html)
* [Name/description of a collection](./applib-guide/how-tos/how-to-05-030-How-to-specify-a-name-or-description-for-a-collection.html)
* [Name/description of an action](./applib-guide/how-tos/how-to-05-040-How-to-specify-names-or-description-for-an-action.html)
* [Entity icons reflecting object's state](./applib-guide/how-tos/how-to-05-050-How-to-specify-the-icon-for-an-individual-objects-state.html)

###Error handling

* [Raise message to users](./applib-guide/how-tos/how-to-06-010-How-to-pass-a-messages-and-errors-back-to-the-user.html)
* [Unexpected errors](./applib-guide/how-tos/how-to-06-020-How-to-deal-with-an-unexpected-error.html)

###Prototyping tips

* [Generic repository](./applib-guide/domain-services/how-to-09-030-How-to-use-a-generic-repository.html)


}

{col-md-4

###Persistence lifecycle

* [Initial value of property](./applib-guide/how-tos/how-to-07-010-How-to-set-up-the-initial-value-of-a-property-programmatically.html)
* [Lifecycle hooks](./applib-guide/how-tos/how-to-07-020-How-to-insert-behaviour-into-the-object-life-cycle.html)
* [Ensuring object in valid state](./applib-guide/how-tos/how-to-07-030-How-to-ensure-object-is-in-valid-state.html)
* [Non-persistable entities](./applib-guide/how-tos/how-to-07-040-How-to-specify-that-an-object-should-not-be-persisted.html)
* [Lazy loading](./applib-guide/how-tos/how-to-07-050-How-to-perform-lazy-loading.html)
* [Dirty object tracking](./applib-guide/how-tos/how-to-07-060-How-to-perform-dirty-object-tracking.html)


###Permissions

* [Hide/disable/validate per user/role](./applib-guide/how-tos/how-to-08-010-Hiding,-disabling-or-validating-for-specific-users-or-roles.html)
* [The authorization manager](./applib-guide/how-tos/how-to-08-020-How-to-use-Isis-authorization-manager.html)

###Value Types

* [Custom Value Types](./applib-guide/value-types/020-Custom-Value-Types.html)
* [Third-party Value Types](./applib-guide/value-types/030-Third-party-Value-Types.html)

}

}

{row

{col-md-12
## Applib

}

}

{row

{col-md-4

###  Reference

* [Configuration Files](core/configuration-files.html)
* [Deployment Types](core/deployment-type.html)
* [DomainObjectContainer interface](./applib-guide/reference/DomainObjectContainer.html)
* [Recognized Methods and Prefixes](./applib-guide/reference/Recognized-Methods-and-Prefixes.html)
* [Recognized Annotations](./applib-guide/reference/recognized-annotations/about.html)
* [Lifecycle callbacks](./applib-guide/how-tos/how-to-07-070-How-to-hook-into-the-object-lifecycle-using-callbacks.html)

}

{col-md-4

###  Singleton services

* [Clock, Fixtures, etc](./applib-guide/supporting-features/about.html)
* [Auditing Service](core/services/auditing-service.html)
* [Bookmark Service](core/services/bookmark-service.html)
* [Developer Utilities Service](core/services/developer-utilities-service.html)
* [Exception Recognizers](core/services/exception-recognizers.html)
* [Publishing Service](core/services/publishing-service.html)
* [Settings Services](core/services/settings-services.html)

### Request-scoped services

* [QueryResultsCache](core/services/query-results-cache.html) [1.4.0-SNAPSHOT, stub]
* [Scratchpad](core/services/scratchpad.html) [1.4.0-SNAPSHOT, stub]
* [Bulk Interaction](core/services/bulk-interaction.html) [1.4.0-SNAPSHOT, stub]

}

{col-md-4

###Supporting features

* [Security](./applib-guide/reference/Security.html)
* [Applib Events](./applib-guide/reference/Event.html)
* [Applib utility classes](applib-guide/reference/Utility.html)

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

### Dev support
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
  
### Bundled components

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


##### Applib service impl.

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
###  JDO mapping hints
<p class="display:none"/>

  - [Mapping Mandatory and Optional Properties](components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
  - [Mapping JODA Dates](components/objectstores/jdo/mapping-joda-dates.html)
  - [Mapping BigDecimals](components/objectstores/jdo/mapping-bigdecimals.html)
  - [Mapping Blobs](components/objectstores/jdo/mapping-blobs.html)
  - [Lazy Loading](components/objectstores/jdo/lazy-loading.html)
  - [Managed 1:m bidirectional relationships](components/objectstores/jdo/managed-1-to-m-relationships.html)

  
}

{col-md-4
### Applib service impl.
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
## Unreleased components
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
