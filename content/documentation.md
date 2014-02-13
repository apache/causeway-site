Title: Documentation

{documentation

{row

{col-md-4
#### Elevator pitch

- **[What's Isis?](intro/elevator-pitch/isis-in-pictures.html) ... in pictures**
- [Common Use Cases](intro/elevator-pitch/common-use-cases.html)
- [Online demo](http://isisdemo.mmyco.co.uk/) (ToDo App)

#### Getting started

- **[Simple Archetype](intro/getting-started/simple-archetype.html) ([1.3.1](archetypes/release-notes/about.html))**

}

{col-md-4
#### Tutorials, screencasts

    - [Tutorials](intro/tutorials/tutorials.html)
    - **[Screencasts](intro/tutorials/screencasts.html)**

#### Learning more

- [Articles, Conferences, Podcasts](intro/learning-more/articles-and-presentations.html)
- [Books](intro/learning-more/books.html)
- [Naked Objects PhD thesis](intro/learning-more/Pawson-Naked-Objects-thesis.pdf) (Pawson)

}

{col-md-4
#### Resources

    - [Downloadable Presentations](intro/resources/downloadable-presentations.html)
    - **[Editor templates](intro/resources/editor-templates.html)**
    - [Icons](intro/resources/icons.html)
    - **[Programming Model Cheat Sheet](intro/resources/cheat-sheet.html)**

#### Releases

- [Release Matrix](./release-matrix.html)

}

}

{row

{col-md-12
## How-tos (programming model)

}

}

{row

{col-md-4

#### Pojos

* [Pojo vs Inheriting from framework](./how-tos/how-to-01-010-How-to-have-a-domain-object-be-a-POJO.html)
* [Registering a domain service](./how-tos/how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html)
* [Entity property](./how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)
* [Entity title](./how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)
* [Entity collection](./how-tos/how-to-01-050-How-to-add-a-collection-to-a-domain-entity.html)
* [Entity or service action](./how-tos/how-to-01-060-How-to-add-an-action-to-a-domain-entity-or-service.html)
* [Names/description of action param](./how-tos/how-to-01-140-How-to-specify-names-or-descriptions-for-an-action-parameter.html)
* [Injecting services](./how-tos/how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html)

#### Object management

* [Finding objects](./how-tos/how-to-09-040-How-to-write-a-custom-repository.html)
* [Instantiating and persisting objects](./how-tos/how-to-09-050-How-to-use-Factories.html)
* [Create/delete objects](./how-tos/how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)

#### UI hints

* [Entity icons](./how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)
* [Ordering prop/colls in the UI](./how-tos/how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html)
* [Ordering actions in the UI](./how-tos/how-to-01-090-How-to-specify-the-order-in-which-actions-appear-on-the-menu.html)

}

{col-md-4


#### Business rules

Visibility ("see it")

* [Hide a property](./how-tos/how-to-02-010-How-to-hide-a-property.html)
* [Hide a collection](./how-tos/how-to-02-020-How-to-hide-a-collection.html)
* [Hide an action](./how-tos/how-to-02-030-How-to-hide-an-action.html)

Usability ("use it")

* [Unmodifiable property](./how-tos/how-to-02-050-How-to-prevent-a-property-from-being-modified.html)
* [Unmodifiable collection](./how-tos/how-to-02-060-How-to-prevent-a-collection-from-being-modified.html)
* [Uninvokable action](./how-tos/how-to-02-070-How-to-prevent-an-action-from-being-invoked.html)

Validity ("do it")

* [Validate property](./how-tos/how-to-02-100-How-to-validate-user-input-for-a-property.html)
* [Validate collection add/remove](./how-tos/how-to-02-110-How-to-validate-an-object-being-added-or-removed-from-a-collection.html)
* [Validate action params](./how-tos/how-to-02-120-How-to-validate-an-action-parameter-argument.html)

#### Common constraints

* [Optional property](./how-tos/how-to-01-100-How-to-make-a-property-optional.html)
* [Optional action ](./how-tos/how-to-01-110-How-to-make-an-action-parameter-optional.html)
* [Size of string properties](./how-tos/how-to-01-120-How-to-specify-the-size-of-String-properties.html)
* [Size of string action params](./how-tos/how-to-01-130-How-to-specify-the-size-of-String-action-parameters.html)

}

{col-md-4


#### Drop-downs &amp; defaults

For properties:

* [Choices for property](./how-tos/how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html)
* [Auto-complete for property](./how-tos/how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html)
* [Default for property](./how-tos/how-to-03-017-How-to-specify-default-value-of-an-object-property.html)

For actions:

* [Choices for action param](./how-tos/how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)
* [Dependent choices for action params](./how-tos/how-to-03-022-How-to-specify-dependent-choices-for-action-parameters.html)
* [Auto-complete for action param](./how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html)
* [Default for action param](./how-tos/how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html)

For both:

* [Drop-down for limited # instances](./how-tos/how-to-03-030-How-to-specify-that-a-class-of-objects-has-a-limited-number-of-instances.html)
* [Auto-complete (repository-based)](./how-tos/how-to-03-040-How-to-find-an-entity-(for-an-action-parameter-or-property)-using-auto-complete.html)

}

}


{row

{col-md-12
## More advanced topics

}

}

{row

{col-md-4

#### Prototyping tips

* [Deployment Types](more-advanced-topics/deployment-type.html)
* [Fixtures](./more-advanced-topics/03-Fixtures-and-SwitchUser.html)
* [Generic repository](./more-advanced-topics/how-to-09-030-How-to-use-a-generic-repository.html)

#### Idioms and patterns

* [Singleton &amp; request-scoped services](./more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html)
* [Decoupling dependencies using contributions](./more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html)
* [Bulk actions, acting upon lists](./more-advanced-topics/how-to-01-065-How-to-add-an-action-to-be-called-on-every-object-in-a-list.html)
* [Bidirectional relationships](./more-advanced-topics/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)
* [View models](./more-advanced-topics/ViewModel.html)

#### More UI layout hints

* [Static and dynamic layouts](more-advanced-topics/dynamic-layouts.html)
* [Tweaking CSS classes](./more-advanced-topics/how-to-tweak-the-ui-using-css-classes.html)
* [Name/descr. of an object](./more-advanced-topics/how-to-05-010-How-to-specify-a-name-or-description-for-an-object.html)
* [Name/descr. of a property](./more-advanced-topics/how-to-05-020-How-to-specify-a-name-or-description-for-a-property.html)
* [Name/descr. of a collection](./more-advanced-topics/how-to-05-030-How-to-specify-a-name-or-description-for-a-collection.html)
* [Name/descr. of an action](./more-advanced-topics/how-to-05-040-How-to-specify-names-or-description-for-an-action.html)
* [Entity icons reflecting object's state](./more-advanced-topics/how-to-05-050-How-to-specify-the-icon-for-an-individual-objects-state.html)


}

{col-md-4

#### Business rules

* [All members hidden](./more-advanced-topics/how-to-02-040-How-to-specify-that-none-of-an-object's-members-is-visible.html)
* [All members unmodifiable](./more-advanced-topics/how-to-02-080-How-to-specify-that-none-of-an-object's-members-can-be-modified-or-invoked.html)
* [Immutable object](./more-advanced-topics/how-to-02-090-How-to-specify-that-an-object-is-immutable.html)
* [Declarative validation using @MustSatisfy](./more-advanced-topics/how-to-02-130-How-to-validate-declaratively-using-MustSatisfy.html)

#### Derived props/colls

* [Derived property](./more-advanced-topics/how-to-04-010-How-to-make-a-derived-property.html)
* [Derived collection](./more-advanced-topics/how-to-04-020-How-to-make-a-derived-collection.html)
* [Inlining query-only repository action](./more-advanced-topics/how-to-04-030-How-to-inline-the-results-of-a-query-only-repository-action.html)
* [Trigger on property change](./more-advanced-topics/how-to-04-040-How-to-trigger-other-behaviour-when-a-property-is-changed.html)
* [Trigger on collection change](./more-advanced-topics/how-to-04-050-How-to-trigger-other-behaviour-when-an-object-is-added-or-removed.html)


}

{col-md-4

#### Error handling

* [Raise message/errors to users](./more-advanced-topics/how-to-06-010-How-to-pass-a-messages-and-errors-back-to-the-user.html)
* [Exception Recognizer](./reference/services/exception-recognizers.html) service

#### Persistence lifecycle

* [Initial value of property](./more-advanced-topics/how-to-07-010-How-to-set-up-the-initial-value-of-a-property-programmatically.html)
* [Lifecycle hooks](./more-advanced-topics/how-to-07-020-How-to-insert-behaviour-into-the-object-life-cycle.html)
* [Ensuring object in valid state](./more-advanced-topics/how-to-07-030-How-to-ensure-object-is-in-valid-state.html)
* [Non-persistable entities](./more-advanced-topics/how-to-07-040-How-to-specify-that-an-object-should-not-be-persisted.html)
* [Lazy loading](./more-advanced-topics/how-to-07-050-How-to-perform-lazy-loading.html)
* [Dirty object tracking](./more-advanced-topics/how-to-07-060-How-to-perform-dirty-object-tracking.html)

#### Permissions

* [Hide/disable/validate per user/role](./more-advanced-topics/how-to-08-010-Hiding,-disabling-or-validating-for-specific-users-or-roles.html)
* [The authorization manager](./more-advanced-topics/how-to-08-020-How-to-use-Isis-authorization-manager.html)

#### Customisation

* [Finetuning the Programming Model](more-advanced-topics/metamodel-finetuning-the-programming-model.html)


}

}

{row

{col-md-12
## Domain  Services

}

}

{row

{col-md-4

#### Common

* [DomainObjectContainer interface](./reference/DomainObjectContainer.html)
* [Exception Recognizers](./reference/services/exception-recognizers.html)
* [Clock](./reference/services/01-Clock.html)
* [User Profiles](./reference/services/02-Profiles.html)

#### Bookmark/memento

* [Bookmark Service](./reference/services/bookmark-service.html)
* [Memento Service](./reference/services/memento-service.html) [1.4.0-snapshot]
* [XmlSnapshot Service](./reference/services/xmlsnapshot-service.html) [1.4.0-snapshot]

}

{col-md-4

#### Profiling/background execution [1.4.0-snapshot]

* [Command Context/Service](./reference/services/command-context.html)
* [Background Service / Background Command Service](./reference/services/background-service.html)

#### Publishing/auditing:

* [Auditing Service](./reference/services/auditing-service.html)
* [Publishing Service](./reference/services/publishing-service.html)

#### Performance tuning/co-ordination [1.4.0-snapshot]

* [QueryResultsCache](./reference/services/query-results-cache.html)
* [Scratchpad](./reference/services/scratchpad.html)
* [Bulk.Interaction](./reference/services/bulk-interaction.html)


}

{col-md-4

#### Other:

* [Wrapper Factory](reference/services/wrapper-factory.html) [stub]
* [Settings Services](./reference/services/settings-services.html)
* [Developer Utilities Service](./reference/services/developer-utilities-service.html)

#### Third-party:

* [Docx Mail merge](https://github.com/danhaywood/isis-domainservice-docx)
* [Excel download/upload](https://github.com/danhaywood/isis-domainservice-excel)

}

}

{row

{col-md-12
## Reference

}

}

{row

{col-md-4

#### Config

* [Configuration Files](./reference/configuration-files.html)

####  Non-UI execution [1.4.0-snapshot]

- [IsisSessionTemplate](./reference/non-ui/isis-session-template.html)
- [BackgroundCommandExecution](./reference/non-ui/background-command-execution.html)

}

{col-md-4

####  Reference

* [Recognized Methods](./reference/Recognized-Methods-and-Prefixes.html)
* [Annotations](./reference/recognized-annotations/about.html)
* [Lifecycle callbacks](./reference/object-lifecycle-callbacks.html)
* [Value types](./reference/value-types.html)

}

{col-md-4


#### Supporting features

* [Security](./reference/Security.html)
* [Applib utility classes](./reference/Utility.html)
* [Applib Events](./reference/Event.html)

}

}

{row

{col-md-12
## Core [1.3.0](core/release-notes/about.html)

}

}

{row

{col-md-4

#### Dev support
<p class="display:none"/>

* [Unit Test Support](core/unittestsupport.html)
* [Integration Test Support](core/integtestsupport.html)
* [BDD/Integ Test Support](core/specsupport-and-integtestsupport.html)

}

{col-md-4

#### Runtime
<p class="display:none"/>

* [Core Runtime](core/runtime.html) [stub]
* [Webserver](core/webserver.html) [stub]

}

{col-md-4
  
#### Bundled components

* [Bytecode Enhancers](core/bytecode.html) [stub]
* [Bypass Security](core/bypass-security.html) [stub]
* [In-memory Object Store](core/inmemory-objectstore.html) [stub]
* [In-memory Profile Store](core/inmemory-profilestore.html) [stub]

}

}


{row

{col-md-12
## Wicket Viewer
}

{col-md-4
####  Wicket [1.3.1](components/viewers/wicket/release-notes/about.html)

* [About](components/viewers/wicket/about.html)
* [Titles in tables](components/viewers/wicket/titles-in-tables.html)
* [Suppressing 'remember me'](components/viewers/wicket/suppressing-remember-me.html)
* [The About page](components/viewers/wicket/configuring-the-about-page.html)
* [Customizing the viewer](components/viewers/wicket/customizing-the-viewer.html)

}

{col-md-4

#### Third-party:

* [Excel download](https://github.com/danhaywood/isis-wicket-excel)
* [Fullcalendar2](https://github.com/danhaywood/isis-wicket-fullcalendar2)
* [Gmap3](https://github.com/danhaywood/isis-wicket-gmap3)
* [Wicked charts](https://github.com/danhaywood/isis-wicket-wickedcharts)

}

{col-md-4

}

}

{row

{col-md-12
## Restful Objects Viewer
}

{col-md-4

####  RestfulObjects [2.1.0](components/viewers/restfulobjects/release-notes/about.html)
<p class="display:none"/>

* [About](components/viewers/restfulobjects/about.html)

}

{col-md-4

##### Applib service impl.

* [Event Serializer per RO Spec](components/viewers/restfulobjects/event-serializer-rospec.html)

}

{col-md-4

}

}



{row

{col-md-12
## JDO/DataNucleus Object Store [1.3.0](components/objectstores/jdo/release-notes/about.html)
}

{col-md-4
####  Configuration

* [About](components/objectstores/jdo/about.html)
* [DataNucleus and Eclipse](components/objectstores/jdo/datanucleus-and-eclipse.html)
* [DataNucleus and Maven](components/objectstores/jdo/datanucleus-and-maven.html)
* [`persistence.xml` file](components/objectstores/jdo/persistence_xml.html)
* [Eagerly Registering Entity Types](components/objectstores/jdo/eagerly-registering-entities.html)
* [Using a JNDI Datasource](components/objectstores/jdo/using-jndi-datasource.html)
* [Enabling Logging](components/objectstores/jdo/enabling-logging.html)
* [Deploying on the Google App Engine](components/objectstores/jdo/deploying-on-the-google-app-engine.html)

}

{col-md-4


####  JDO mapping hints
<p class="display:none"/>

* [Mapping Mandatory and Optional Properties](components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
* [Mapping JODA Dates](components/objectstores/jdo/mapping-joda-dates.html)
* [Mapping BigDecimals](components/objectstores/jdo/mapping-bigdecimals.html)
* [Mapping Blobs](components/objectstores/jdo/mapping-blobs.html)
* [Lazy Loading](components/objectstores/jdo/lazy-loading.html)
* [Managed 1:m bidirectional relationships](components/objectstores/jdo/managed-1-to-m-relationships.html)

  
}

{col-md-4
####  JDO services
<p class="display:none"/>

* [Using the `IsisJdoSupport` service](components/objectstores/jdo/services/isisjdosupport-service.html)

#### Applib service impl.
<p class="display:none"/>

* [Exception Recognizers](components/objectstores/jdo/services/exception-recognizers-jdo.html)
* [Settings Services on JDO](components/objectstores/jdo/services/settings-services-jdo.html)
* [Command Service on JDO](components/objectstores/jdo/services/command-service-jdo.html) [1.4.0-snapshot]
* [Background Command Service on JDO](components/objectstores/jdo/services/command-service-jdo.html) [1.4.0-snapshot]
* [Publishing Service on JDO](components/objectstores/jdo/services/publishing-service-jdo.html) 
* [Auditing Service on JDO](components/objectstores/jdo/services/auditing-service-jdo.html)

#### Non-UI

* [Background Command Execution](components/objectstores/jdo/non-ui/background-command-execution-jdo.html)

  
}

}


{row

{col-md-12
## Security
}

{col-md-4
#### Shiro [1.3.0](components/security/shiro/release-notes/about.html)

* [About](components/security/shiro/about.html)
* [Configuring Isis to use Shiro](components/security/shiro/configuring-shiro.html)
* [Configuring Shiro to use LDAP](components/security/shiro/using-ldap.html)
* [Format of Isis Permissions](components/security/shiro/format-of-permissions.html)

}

{col-md-4
#### File [1.0.1](components/security/file/release-notes/about.html)
<p class="display:none"/>

* [About](components/security/file/about.html)

}

{col-md-4
}

}

{row

{col-md-12
##  Other Topics
}

{col-md-4

#### Contributors

* [Contributing](contributors/contributing.html)
* [Development Environment](contributors/development-environment.html)
* [Building Isis](contributors/building-isis.html)
* [Git Policy](contributors/git-policy.html)
* [Git Cookbook](contributors/git-cookbook.html)
* [Versioning Policy](contributors/versioning-policy.html)

}

{col-md-4
#### Committers

* [Updating the CMS site](contributors/updating-the-cms-site.html)
* [Applying Patches](contributors/applying-patches.html)
* [Recreating an archetype](contributors/recreating-an-archetype.html)
* [Snapshot process](contributors/snapshot-process.html)
* [Release process](contributors/release-process.html)
* [Release branch and tag names](contributors/release-branch-and-tag-names.html)
* [Verifying releases](contributors/verifying-releases.html)
* [Key generation](contributors/key-generation.html)

#### PMC

* [Notes](contributors/pmc-notes.html)


}

{col-md-4
#### Third Party Viewers

* [DHTMLX](third-party/viewers/dhtmlx/about.html)

#### Third-party Plugins

* [JRebel Plugin](https://github.com/danhaywood/isis-jrebel-plugin)

)


<!--

----------

#### Kemble

* [About](components/progmodels/kemble/about.html) [stub]

-->


}

}

}


{row

{col-md-12
## Unreleased & Mothballed components
}

{col-md-4

#### Unreleased

Not released since graduation.

* [NoSQL Object Store](components/objectstores/nosql/about.html) [0.2.0-incubating](components/objectstores/nosql/release-notes/about.html)
* [XML Object Store](components/objectstores/xml/about.html) [0.2.0-incubating](components/objectstores/xml/release-notes/about.html)
* [XML Profile Store](components/profilestores/xml/about.html) [0.2.0-incubating](components/profilestores/xml/release-notes/about.html)
* [Scimpi Viewer](components/viewers/scimpi/about.html) [0.2.0-incubating](components/viewers/scimpi/release-notes/about.html)
* [DnD Viewer](components/viewers/dnd/about.html) [0.2.0-incubating](components/viewers/dnd/release-notes/about.html)
* [Groovy Programming Model](components/progmodels/groovy/about.html) [0.2.0-incubating](components/progmodels/groovy/release-notes/about.html)

}

{col-md-4

#### Mothballed

No longer under active development

* [HTML Viewer](components/viewers/html/about.html) (use Wicket)
* [LDAP Security](components/security/ldap/about.html) (use Shiro)
* [SQL Security](components/security/sql/about.html) (use Shiro)
* [SQL Profile Store](components/profilestores/sql/about.html)
* [SQL Object Store](components/objectstores/sql/about.html) (use JDO)
* [BDD (Concordion)](components/viewers/bdd/about.html) (use Cucumber-JVM in unittestsupport and integtestsupport)

}

{col-md-4

#### Incomplete

* [Eclipse IDE Plugin](other/eclipse-plugin.html) [stub]
* [Maven Plugin](other/maven-plugin.html) [stub]

}

}

