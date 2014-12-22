Title: Documentation

<blockquote>
  <p>Perfection is finally attained not when there is no longer anything to add but when there is no longer anything to take away.
  <p class="author">Antoine de Saint-Exupery</em></br>
</blockquote>


{documentation

{row

{col-md-4
#### <a name="elevator-pitch">Elevator pitch</a>

* **[What's Isis?](intro/elevator-pitch/isis-in-pictures.html) ... in pictures**
* [Common Use Cases](intro/elevator-pitch/common-use-cases.html)  <a href="intro/elevator-pitch/common-use-cases.html#screencast"><img src="./images/tv_show-25.png"></a>
* [Online demo](http://isisdemo.mmyco.co.uk/) (ToDo App)

#### <a name="getting-started">Archetypes</a>

* **[SimpleApp Archetype](intro/getting-started/simpleapp-archetype.html) ([1.7.0](archetypes/release-notes/about.html))**
* [TodoApp Archetype](intro/getting-started/todoapp-archetype.html) ([1.7.0](archetypes/release-notes/about.html)) <a href="intro/getting-started/todoapp-archetype.html#screencast"><img src="./images/tv_show-25.png"></a>

}

{col-md-4

#### <a name="getting-started">Development Environment</a>

* [Setting up IntelliJ](intro/getting-started/ide/intellij.html) <a href="./intro/getting-started/ide/intellij.html#screencast"><img src="./images/tv_show-25.png"></a>
* [Setting up Eclipse](intro/getting-started/ide/eclipse.html) <a href="./intro/getting-started/ide/eclipse.html#screencast"><img src="./images/tv_show-25.png"></a>
* [Using Maven with DataNucleus plugin](components/objectstores/jdo/datanucleus-and-maven.html) (prior to 1.4.0)

#### <a name="tutorials">Tutorials, screencasts</a>
<p class="display:none"/>

- **[Screencasts](intro/tutorials/screencasts.html)** <a href="intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>
- [Tutorials](intro/tutorials/tutorials.html)
- **[ApacheCon EU 2014](intro/tutorials/apacheconeu-2014.html)**

}

{col-md-4

#### <a name="learning-more">Learning more</a>

- [Powered by Isis](intro/powered-by/powered-by.html)
- [Articles, Conferences, Podcasts](intro/learning-more/articles-and-presentations.html)
- [Books](intro/learning-more/books.html)
- [Naked Objects PhD thesis](intro/learning-more/Pawson-Naked-Objects-thesis.pdf) (Pawson)

#### <a name="resources">Resources</a>
<p class="display:none"/>

- [Downloadable Presentations](intro/resources/downloadable-presentations.html)
- **[IDE templates](intro/resources/editor-templates.html)** (IntelliJ and Eclipse)
- [Icons](intro/resources/icons.html)
- **[Cheat Sheet](intro/resources/cheat-sheet.html)**

}

}

{row

{col-md-12
## <a name="core">Core Concepts [1.7.0](core/release-notes/about.html)</a>

}

}

{row

{col-md-4

####  <a name="reference-reference">Programming Conventions</a>

* [Recognized Annotations](./reference/recognized-annotations/about.html)
* [Recognized Methods](./reference/Recognized-Methods-and-Prefixes.html)


}


{col-md-4

#### <a name="core-modules-common">DomainObjectContainer</a>

* [DomainObjectContainer API](./reference/DomainObjectContainer.html)
* [Users and Roles](./reference/Security.html)


}

{col-md-4

#### <a name="reference-config">Config</a>

* [Deployment Types](./reference/deployment-type.html)
* [Configuration Files](./reference/configuration-files.html)



}

}


{row

{col-md-12
## <a name="how-tos">How-tos (programming model)</a>

}

}



{row

{col-md-4

#### <a name="how-tos-pojos">Pojos</a>

* [Pojo vs Inheriting from framework](./how-tos/how-to-01-010-How-to-have-a-domain-object-be-a-POJO.html)
* [Registering a domain service](./how-tos/how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html)
* [Entity property](./how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)
* [Entity collection](./how-tos/how-to-01-050-How-to-add-a-collection-to-a-domain-entity.html)
* [Entity or service action](./how-tos/how-to-01-060-How-to-add-an-action-to-a-domain-entity-or-service.html)

#### <a name="how-tos-ui-hints-icons">UI Hints</a>

Icons and Titles

* [Entity title](./how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)
* [Entity icons](./how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)
* [Titles in tables](components/viewers/wicket/titles-in-tables.html)

Names & Descriptions

* [Names/description of action param](./how-tos/how-to-01-140-How-to-specify-names-or-descriptions-for-an-action-parameter.html)

Layout

* [Layout using annotations](components/viewers/wicket/static-layouts.html)
* [Dynamic layouts](components/viewers/wicket/dynamic-layouts.html) <a href="components/viewers/wicket/dynamic-layouts.html#screencast"><img src="./images/tv_show-25.png"></a>
* [Application menu layout](components/viewers/wicket/application-menu-layout.html)

}

{col-md-4


#### <a name="how-tos-business-rules">Business rules</a>

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

#### <a name="how-tos-common-constraints">Common constraints</a>

* [Optional property](./how-tos/how-to-01-100-How-to-make-a-property-optional.html)
* [Optional action ](./how-tos/how-to-01-110-How-to-make-an-action-parameter-optional.html)
* [Size of string properties](./how-tos/how-to-01-120-How-to-specify-the-size-of-String-properties.html)
* [Size of string action params](./how-tos/how-to-01-130-How-to-specify-the-size-of-String-action-parameters.html)

#### <a name="how-tos-object-management">Object management</a>

* [Injecting services](./how-tos/how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html)
* [Finding objects](./how-tos/how-to-09-040-How-to-write-a-custom-repository.html)
* [Instantiating and persisting objects](./how-tos/how-to-09-050-How-to-use-Factories.html)
* [Create/delete objects](./how-tos/how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)

}

{col-md-4


#### <a name="how-tos-drop-downs">Drop-downs &amp; defaults</a>

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

####  <a name="jdo-objectstore-jdo-mapping-hints">JDO (Mapping) Hints</a>
<p class="display:none"/>

* [Mapping Mandatory and Optional Properties](components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
* [Mapping JODA Dates](components/objectstores/jdo/mapping-joda-dates.html)
* [Mapping BigDecimals](components/objectstores/jdo/mapping-bigdecimals.html)
* [Mapping Blobs](components/objectstores/jdo/mapping-blobs.html)
* [Managed 1:m bidirectional relationships](components/objectstores/jdo/managed-1-to-m-relationships.html)
* [Lazy Loading](components/objectstores/jdo/lazy-loading.html)


}

}




{row

{col-md-12
## <a name="more-advanced-topics">More advanced topics</a>

}

}

{row

{col-md-4

#### <a name="more-advanced-topics-business-rules">Business rules</a>

* [Hide part of a title](./more-advanced-topics/how-to-hide-part-of-a-title.html)
* [All members hidden](./more-advanced-topics/how-to-02-040-How-to-specify-that-none-of-an-object's-members-is-visible.html)
* [All members unmodifiable](./more-advanced-topics/how-to-02-080-How-to-specify-that-none-of-an-object's-members-can-be-modified-or-invoked.html)
* [Immutable object](./more-advanced-topics/how-to-02-090-How-to-specify-that-an-object-is-immutable.html)
* [Declarative validation using @MustSatisfy](./more-advanced-topics/how-to-02-130-How-to-validate-declaratively-using-MustSatisfy.html)
* [Hide/disable/validate per user/role](./more-advanced-topics/how-to-08-010-Hiding,-disabling-or-validating-for-specific-users-or-roles.html)

#### <a name="more-advanced-topics-derived-props-colls">Derived props/colls</a>

* [Derived property](./more-advanced-topics/how-to-04-010-How-to-make-a-derived-property.html)
* [Passwords](./more-advanced-topics/how-to-04-015-Password-properties-and-params.html)
* [Derived collection](./more-advanced-topics/how-to-04-020-How-to-make-a-derived-collection.html)
* [Inlining query-only repository action](./more-advanced-topics/how-to-04-030-How-to-inline-the-results-of-a-query-only-repository-action.html)
* [Trigger on property change](./more-advanced-topics/how-to-04-040-How-to-trigger-other-behaviour-when-a-property-is-changed.html)
* [Trigger on collection change](./more-advanced-topics/how-to-04-050-How-to-trigger-other-behaviour-when-an-object-is-added-or-removed.html)

#### <a name="more-advanced-topics-idioms-and-patterns">Idioms and patterns</a>

* [Are you sure?](./more-advanced-topics/are-you-sure-idiom.html)
* [Singleton &amp; request-scoped services](./more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html)
* [Decoupling dependencies using contributions](./more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html)
* [How to suppress contributions](./more-advanced-topics/How-to-suppress-contributions.html)
* [Bulk actions, acting upon lists](./more-advanced-topics/how-to-01-065-How-to-add-an-action-to-be-called-on-every-object-in-a-list.html)
* [Bidirectional relationships](./more-advanced-topics/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)
* [View models](./more-advanced-topics/ViewModel.html)


}

{col-md-4

#### <a name="ui-hints-names-and-descriptions">UI Overrides</a>

* [Name/descr. of an object](./more-advanced-topics/how-to-05-010-How-to-specify-a-name-or-description-for-an-object.html)
* [Name/descr. of a property](./more-advanced-topics/how-to-05-020-How-to-specify-a-name-or-description-for-a-property.html)
* [Name/descr. of a collection](./more-advanced-topics/how-to-05-030-How-to-specify-a-name-or-description-for-a-collection.html)
* [Name/descr. of an action](./more-advanced-topics/how-to-05-040-How-to-specify-names-or-description-for-an-action.html)

#### <a name="more-advanced-topics-error-handling">Error handling</a>

* [Raise message/errors to users](./more-advanced-topics/how-to-06-010-How-to-pass-a-messages-and-errors-back-to-the-user.html)
* [Exception Recognizers](./reference/services/exception-recognizers.html)

#### <a name="more-advanced-topics-persistence-lifecycle">Persistence lifecycle</a>

* [Initial value of property](./more-advanced-topics/how-to-07-010-How-to-set-up-the-initial-value-of-a-property-programmatically.html)
* [Lifecycle hooks](./more-advanced-topics/how-to-07-020-How-to-insert-behaviour-into-the-object-life-cycle.html) [reference](./reference/object-lifecycle-callbacks.html)
* [Ensuring object in valid state](./more-advanced-topics/how-to-07-030-How-to-ensure-object-is-in-valid-state.html)
* [Non-persistable entities](./more-advanced-topics/how-to-07-040-How-to-specify-that-an-object-should-not-be-persisted.html)


}

{col-md-4

#### <a name="core-dev-support">Support for testing</a>
<p class="display:none"/>

* [Unit Test Support](core/unittestsupport.html)
* [Integration Test Support](core/integtestsupport.html)
* [BDD/Integ Test Support](core/specsupport-and-integtestsupport.html)
* [Fixture Scripts](./more-advanced-topics/Fixture-Scripts.html)
* [IsisConfigurationForJdoIntegTests](components/objectstores/jdo/IsisConfigurationForJdoIntegTests.html)


#### <a name="more-advanced-topics-customisation">Customisation</a>

* [Finetuning the Programming Model](more-advanced-topics/metamodel-finetuning-the-programming-model.html)


#### <a name="more-advanced-topics-deployment">Deployment</a>

* [Externalized Configuration](./reference/externalized-configuration.html)
* [JVM args](./reference/jvm-args.html)

#### <a name="more-advanced-topics-jdo-objectstore">JDO Objectstore</a>

* [Using a JNDI Datasource](components/objectstores/jdo/using-jndi-datasource.html)
* [Enabling Logging](components/objectstores/jdo/enabling-logging.html)

#### <a name="more-advanced-topics-no-sql-support">NoSQL Support</a>

* [Deploying on the Google App Engine](components/objectstores/jdo/deploying-on-the-google-app-engine.html)
* [Using Neo4J](components/objectstores/jdo/using-neo4j.html) (1.8.0-SNAPSHOT)


<!--
#### <a name="core-bundled-components">Other Core Components</a>

* [Core Runtime](core/runtime.html) [stub]
* [Webserver](core/webserver.html) [stub]
* [In-memory Object Store](core/inmemory-objectstore.html) [stub]
* ['Bypass' Implementation](core/bypass-security.html) [stub]
-->

}

}




{row

{col-md-12
## <a name="core-domain-services">Domain Services</a>

Commonly-used domain services to use within your app, implemented in Isis core.  Some implement API defined in the applib; see <a href="./reference/services.html">summary</a>.

}

}

{row

{col-md-4

#### <a name="reference-supporting-features">Supporting features</a>

* [ClockService](./reference/services/ClockService.html)
* [Applib utility classes](./reference/Utility.html)

JDO Objectstore 

* [IsisJdoSupport](components/objectstores/jdo/services/isisjdosupport-service.html)

#### <a name="core-modules-common">WrapperFactory</a>

* [Wrapper Factory](reference/services/wrapper-factory.html)
* [Applib Events](./reference/Event.html)

#### <a name="domain-services-event-bus">Event Bus</a>

Decouple business logic across modules using intra-process publish/subscribe 

* [EventBusService API](./reference/services/event-bus-service.html) [Impl](components/objectstores/jdo/services/event-bus-service-jdo.html)



}

{col-md-4

#### <a name="domain-services-information-sharing">Commands/Background</a>

Context in which actions invoked, infrastructure to run actions in background.

* [Command Context](./reference/services/command-context.html) <a href="./reference/services/command-context.html#screencast"><img src="./images/tv_show-25.png"></a>
* [Background Service](./reference/services/background-service.html)


#### <a name="domain-services-information-sharing">Information sharing</a>

Co-ordinate sharing of information across multiple objects/interactions

* [Scratchpad](./reference/services/scratchpad.html)
* [Bulk.Interaction](./reference/services/bulk-interaction.html)
* [QueryResultsCache](./reference/services/query-results-cache.html)

}

{col-md-4

#### <a name="domain-services-bookmark-memento">Bookmarks and mementos</a>

* [Bookmark Service](./reference/services/bookmark-service.html)
* [Memento Service](./reference/services/memento-service.html)
* [XmlSnapshot Service](./reference/services/xmlsnapshot-service.html)

####  <a name="reference-non-ui-execution">Non-UI execution</a>

- [IsisSessionTemplate](./reference/non-ui/isis-session-template.html)

}

}


{row

{col-md-12
## <a name="wicket-viewer">Wicket Viewer</a> [1.7.0](components/viewers/wicket/release-notes/about.html) [About](components/viewers/wicket/about.html)

Features, configuration and UI customisation.

}

}

{row

{col-md-4

#### <a name="wicket-viewer-features">Features/end-user usage</a>

* [File upload/download](components/viewers/wicket/file-upload-download.html)
* [Bookmarked pages (sliding panel)](components/viewers/wicket/bookmarks.html)
* [Recent pages (drop down)](components/viewers/wicket/recent-pages.html)
* [Hints and copy URL](components/viewers/wicket/hints-and-copy-url.html)

#### <a name="wicket-viewer-configuration">Configuration</a>

* [Suppressing 'remember me'](components/viewers/wicket/suppressing-remember-me.html)
* [Number of bookmarked pages](components/viewers/wicket/bookmarks.html)
* [Stripped Wicket tags](components/viewers/wicket/stripped-wicket-tags.html)
* [Disabling modal dialogs](components/viewers/wicket/disabling-modal-dialogs.html)
* [Showing a theme chooser](components/viewers/wicket/showing-a-theme-chooser.html) (1.8.0-SNAPSHOT)

}

{col-md-4

#### <a name="wicket-viewer-customization">Application-specific customisation</a>

* [Customising the Welcome page](components/viewers/wicket/customizing-the-welcome-page.html)
* [Customising the About page](components/viewers/wicket/configuring-the-about-page.html)
* [Specifying a default theme](components/viewers/wicket/specifying-a-default-theme.html) (1.8.0-SNAPSHOT)
* [Tweaking CSS classes](./components/viewers/wicket/how-to-tweak-the-ui-using-css-classes.html)
* [Custom Javascript](./components/viewers/wicket/how-to-tweak-the-ui-using-javascript.html)

#### <a name="wicket-viewer-customization">Tips</a>

* [Render abstract properties in tables](components/viewers/wicket/tips-and-workarounds.html)

}

{col-md-4

#### <a name="wicket-viewer-extensions">Extending the viewer</a>

* [Writing a custom theme](components/viewers/wicket/writing-a-custom-theme.html) (1.8.0-SNAPSHOT)
* [Replacing page elements](components/viewers/wicket/customizing-the-viewer.html)
* [Custom pages](components/viewers/wicket/custom-pages.html)

#### <a name="wicket-viewer-isisaddons">Isis Add-ons</a>

* [Excel download](./components/viewers/wicket/isisaddons/isis-wicket-excel.html)
* [Fullcalendar2](./components/viewers/wicket/isisaddons/isis-wicket-fullcalendar2.html)
* [Gmap3](./components/viewers/wicket/isisaddons/isis-wicket-gmap3.html) <a href="./components/viewers/wicket/isisaddons/isis-wicket-gmap3.html#screencast"><img src="./images/tv_show-25.png"></a> 
* [Wicked charts](./components/viewers/wicket/isisaddons/isis-wicket-wickedcharts.html)

}

}


{row

{col-md-12
## <a name="restfulobjects-viewer">Core REST API, Security, Objectstore</a> 

}

}

{row

{col-md-4

#### <a name="restfulobjects-viewer-about">REST API</a> [About](components/viewers/restfulobjects/about.html)
<p class="display:none"/>

<i>previously released as the Restful Objects Viewer component (v[2.3.0](components/viewers/restfulobjects/release-notes/about.html)).</i>

Features

* [Restful Objects Specification](http://restfulobjects.org)
* [Pretty printing](components/viewers/restfulobjects/pretty-printing.html) (1.8.0-SNAPSHOT)

Configuration & Customisation

* [Honor UI hints](components/viewers/restfulobjects/honor-ui-hints.html) (1.8.0-SNAPSHOT) 
* [Suppressing elements of the representations](components/viewers/restfulobjects/suppressing-elements-of-the-representations.html) (1.8.0-SNAPSHOT) 
* [Simplified object representation](components/viewers/restfulobjects/simplified-object-representation.html) (1.8.0-SNAPSHOT) 
* [Custom representations](components/viewers/restfulobjects/custom-representations.html) 

Hints and Tips

* [Using Chrome Tools](components/viewers/restfulobjects/using-chrome-tools.html) <a href="components/viewers/restfulobjects/using-chrome-tools.html"><img src="./images/tv_show-25.png"></a>
* [AngularJS Tips](components/viewers/restfulobjects/angularjs-tips.html)

}

{col-md-4

#### <a name="security">Core Security</a> [About](components/security/shiro/about.html)

<i>previously released as the Shiro Security Component (v[1.5.0](components/security/shiro/release-notes/about.html))</i>

We recommend the [Security Isis add-on](http://github.com/isisaddons//isis-module-security) <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>

* [Configuring Isis to use Shiro](components/security/shiro/configuring-shiro.html)
* [Configuring Shiro to use LDAP](components/security/shiro/using-ldap.html)
* [Format of Isis Permissions](components/security/shiro/format-of-permissions.html)

}

{col-md-4

#### <a name="jdo-objectstore">Core Object Store</a> [About](components/objectstores/jdo/about.html)

<i>previously released as the JDO/DataNucleus Objectstore component (v[1.5.0](components/objectstores/jdo/release-notes/about.html))</i>

See also <a href="#jdo-objectstore-jdo-mapping-hints">JDO Mapping Hints</a>, <a href="#more-advanced-topics-error-handling">Error handling</a> and <a href="#more-advanced-topics-deployment">Deployment</a>, above.

* [`persistence.xml` file](components/objectstores/jdo/persistence_xml.html)
* [Eagerly Registering Entity Types](components/objectstores/jdo/eagerly-registering-entities.html)
* [Disabling persistence-by-reachability](components/objectstores/jdo/disabling-persistence-by-reachability.html)
* [Transaction Management](components/objectstores/jdo/transaction-management.html)

}

}


{row

{col-md-12
## <a name="modules">Add-on Modules/Services</a>

Optional supporting modules to use within your app, with implementations in [Isis addons](http://www.isisaddons.org).  Some modules implement interfaces defined in Isis applib (eg auditing), others are standalone (eg excel and tags).

In addition, a full list of all applib services (including those that are implemented by the framework itself, eg `DomainObjectContainer` and `MementoService`) is summarized **[here](./reference/services.html)**.

}

}

{row

{col-md-4

#### <a name="isis-module-command">Command Service (persistence)</a>

* [API](./reference/services/command-service.html) <a href="./reference/services/command-context.html#screencast"><img src="./images/tv_show-25.png"></a> 
* [Isis addons implementation](http://github.com/isisaddons/isis-module-command)  <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>

#### <a name="isis-module-command">Background Command Service</a>

* [API](./reference/services/background-command-service.html)
* [Background Execution](./reference/non-ui/background-command-execution.html)
* [Isis addons implementation](http://github.com/isisaddons/isis-module-command) (for both)

}

{col-md-4

#### <a name="isis-module-auditing">Auditing</a>

* [Auditing API](./reference/services/auditing-service.html)
* [Isis addons implementation](http://github.com/isisaddons/isis-module-audit)  <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>

#### <a name="isis-module-publishing">Publishing Service</a>

* [API](./reference/services/publishing-service.html)
* [Event Serializer per RO Spec](components/viewers/restfulobjects/event-serializer-rospec.html) (out-of-date)
* [Isis addons implementation](http://github.com/isisaddons/isis-module-publishing)  <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>


}

{col-md-4

#### <a name="modules-isisaddons">Other Isis Addons</a>

* [Developer Utilities](http://github.com/isisaddons/isis-module-devutils) 
* [Docx Mail merge](http://github.com/isisaddons/isis-module-docx)
* [Excel download/upload](http://github.com/isisaddons/isis-module-excel) <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>
* [Security](http://github.com/isisaddons//isis-module-security) <a href="./intro/tutorials/screencasts.html"><img src="./images/tv_show-25.png"></a>
* [Settings](http://github.com/isisaddons/isis-module-settings) 
* [String interpolator](http://github.com/isisaddons//isis-module-stringinterpolator)
* [Tags](http://github.com/isisaddons/isis-module-tags)


}

}






{row

{col-md-12
##  <a name="other-topics">Other Topics</a>
}

{col-md-4

#### <a name="other-topics-contributors">Contributors</a>

* [Contributing](contributors/contributing.html)
* [Development Environment](contributors/development-environment.html)
* [Building Isis](contributors/building-isis.html)
* [Git Policy](contributors/git-policy.html)
* [Git Cookbook](contributors/git-cookbook.html)
* [Versioning Policy](contributors/versioning-policy.html)

#### <a name="releases">Releases</a>

- [Release Matrix](./release-matrix.html)


}

{col-md-4

#### <a name="other-topics-committers">Committers</a>
<p class="display:none"/>

* [Updating the CMS site](contributors/updating-the-cms-site.html)
* [Applying Patches](contributors/applying-patches.html)
* [Recreating an archetype](contributors/recreating-an-archetype.html)
* [Snapshot process](contributors/snapshot-process.html)
* [Release process](contributors/release-process.html) ([one-pager](contributors/release-process-one-pager.html))
* [Release branch and tag names](contributors/release-branch-and-tag-names.html)
* [Verifying releases](contributors/verifying-releases.html)
* [Key generation](contributors/key-generation.html)

#### <a name="other-topics-pmc">PMC</a>

* [Notes](contributors/pmc-notes.html)


}

{col-md-4
#### <a name="other-topics-third-party-viewers">Third Party Viewers</a>

* [DHTMLX](third-party/viewers/dhtmlx/about.html)
* [Android Viewer (GSOC2013)](https://github.com/DImuthuUpe/ISIS_Android_Viewer)
* [JQueryMobile Viewer (GSOC2013)](https://github.com/bhargavgolla/isisJavaScript/)

#### <a name="other-topics-third-party-plugins">Third-party Plugins</a>

* [JRebel](other/jrebel.html)  <a href="./other/jrebel.html#screencast"><img src="./images/tv_show-25.png"></a>



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
## <a name="unreleased">Unreleased or Mothballed components</a>
}

{col-md-4

#### <a name="unreleased-unreleased">Unreleased</a>

Not released since graduation.

* [NoSQL Object Store](components/objectstores/nosql/about.html) [0.2.0-incubating](components/objectstores/nosql/release-notes/about.html)
* [XML Object Store](components/objectstores/xml/about.html) [0.2.0-incubating](components/objectstores/xml/release-notes/about.html)
* [XML Profile Store](components/profilestores/xml/about.html) [0.2.0-incubating](components/profilestores/xml/release-notes/about.html)
* [Scimpi Viewer](components/viewers/scimpi/about.html) [0.2.0-incubating](components/viewers/scimpi/release-notes/about.html)
* [DnD Viewer](components/viewers/dnd/about.html) [0.2.0-incubating](components/viewers/dnd/release-notes/about.html)
* [Groovy Programming Model](components/progmodels/groovy/about.html) [0.2.0-incubating](components/progmodels/groovy/release-notes/about.html)

}

{col-md-4

#### <a name="unreleased-mothballed">Mothballed</a>

No longer under active development

* [HTML Viewer](components/viewers/html/about.html) (use Wicket)
* [LDAP Security](components/security/ldap/about.html) (use Shiro)
* [SQL Security](components/security/sql/about.html) (use Shiro)
* [SQL Profile Store](components/profilestores/sql/about.html)
* [SQL Object Store](components/objectstores/sql/about.html) (use JDO)
* [BDD (Concordion)](components/viewers/bdd/about.html) (use Cucumber-JVM in unittestsupport and integtestsupport)

}

{col-md-4

#### <a name="retired">Retired</a>

Previously released but now retired

* [In-memory Profile Store](core/inmemory-profilestore.html) [stub]
* [File Security](components/security/file/about.html)


#### <a name="unreleased-incomplete">Incomplete</a>

* [Value types](./reference/value-types.html) (partial support)
* [Eclipse IDE Plugin](other/eclipse-plugin.html) [stub]
* [Maven Plugin](other/maven-plugin.html) [stub]

}

}

