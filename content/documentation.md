Title: Documentation

{documentation

{row

{col-md-4
### Elevator Pitch

  - [What's Isis?](getting-started/screenshots.html) ... in pictures
  - [Common Use Cases](learning-more/common-use-cases.html)

### Getting Started

  - **[Simple Archetype](getting-started/simple-archetype.html) ([1.3.1](getting-started/release-notes/about.html))**
  - [ToDo App (Quickstart) Archetype](getting-started/quickstart-archetype.html) ([1.3.1](getting-started/release-notes/about.html))

### Tutorials and Screencasts
  - [Tutorials](learning-more/tutorials.html)
  - [Screencasts](getting-started/screencasts.html)


}

{col-md-4
### Framework Reference

  - **[Programming Model and How-tos](applib-guide/about.html)**
  - [Applib utility classes](applib-guide/reference/Utility.html)
  - [Static and dynamic layouts](core/dynamic-layouts.html)

### Going Deeper

  - [Articles, Conferences, Podcasts](learning-more/articles-and-presentations.html)
  - [Books](learning-more/books.html)
  - [Naked Objects PhD thesis](learning-more/resources/Pawson-Naked-Objects-thesis.pdf) (Pawson)
  - [Downloadable Presentations](learning-more/presentations.html)

### Resources

  - **[Editor templates](getting-started/editor-templates.html)**
  - [Icons](getting-started/icons.html)
  - **[Programming Model Cheat Sheet](getting-started/cheat-sheet.html)**

}

{col-md-4
###  Contributors

  - [Contributing](contributors/contributing.html)
  - [Development Environment](contributors/development-environment.html)
  - [Building Isis](contributors/building-isis.html)
  - [Git Policy](contributors/git-policy.html)
  - [Git Cookbook](contributors/git-cookbook.html)
  - [Versioning Policy](contributors/versioning-policy.html)

Guidance for committers is at the bottom of this page.

### Releases

- [Release Matrix](release-matrix.html)

}

}

{row

{col-md-12
## Core [1.3.0](core/release-notes/about.html)
}

{col-md-4
###  Applib

  - [Configuration Files](core/configuration-files.html)
  - [Deployment Types](core/deployment-type.html)

###  Applib Services

  - [Initializing Services](core/services/initializing-services.html)
  - [Auditing Service](core/services/auditing-service.html)
  - [Bookmark Service](core/services/bookmark-service.html)
  - [Developer Utilities Service](core/services/developer-utilities-service.html)
  - [Exception Recognizers](core/services/exception-recognizers.html)
  - [Publishing Service](core/services/publishing-service.html)
  - [Settings Services](core/services/settings-services.html)

}

{col-md-4
### Dev Support
<p class="display:none"/>

  * [Unit Test Support](core/unittestsupport.html)
  * [Integration Test Support](core/integtestsupport.html)
  * [BDD/Integ Test Support](core/specsupport-and-integtestsupport.html)
  * [Wrapper Factory](core/wrapper.html) [stub]

  
###  Programming Model

  - [Finetuning the Programming Model](core/metamodel-finetuning-the-programming-model.html)

}

{col-md-4
### Runtime
<p class="display:none"/>

  * [Core Runtime](core/runtime.html) [stub]
  * [Webserver](core/webserver.html) [stub]

  
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


}

{col-md-4
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
