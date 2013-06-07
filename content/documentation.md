Title: Documentation

{documentation

{row-odd

{span-one-third

### Getting started

- [Screencasts](getting-started/screencasts.html)
- [Wicket/Restful/JDO Archetype](getting-started/quickstart-archetype.html) ([1.0.3](getting-started/release-notes/about.html))
- [Programming Model and How-tos](applib-guide/about.html)
- [Programming Model Cheat Sheet](getting-started/cheat-sheet.html)

### Resources

- [Editor templates](getting-started/editor-templates.html)
- [Icons](getting-started/icons.html)

### Releases

- [Release Matrix](release-matrix.html)

}

{span-one-third

###  Learning More

- [Common Use Cases](learning-more/common-use-cases.html)
- [Presentations](learning-more/presentations.html)
- [Hexagonal Architecture](learning-more/hexagonal-architecture.html) [stub]
- [Books](learning-more/books.html)
- [Articles and Presentations](learning-more/articles-and-presentations.html)
- [Tutorials](learning-more/tutorials.html)
- [Richard Pawson's Naked Objects thesis](learning-more/resources/Pawson-Naked-Objects-thesis.pdf)

}

{span-one-third

###  Contributors

- [Contributing](contributors/contributing.html)
- [Development Environment](contributors/development-environment.html)
- [Building Isis](contributors/building-isis.html)
- [Git Policy](contributors/git-policy.html)
- [Git Cookbook](contributors/git-cookbook.html)
- [Versioning Policy](contributors/versioning-policy.html)

Guidance for committers is at the bottom of this page.

}

}

{group

## Core [1.2.0](core/release-notes/about.html)

{row-even

{span-one-third

###  Applib

- [Configuration Files](core/configuration-files.html)
- [Deployment Types](core/deployment-type.html)

###  Applib Services

- [Initializing Services](core/services/initializing-services.html)
- [Auditing Service](core/services/auditing-service.html)
- [Bookmark Service](core/services/bookmark-service.html)
- [Exception Recognizers](core/services/exception-recognizers.html)
- [Publishing Service](core/services/publishing-service.html)
- [Settings Services](core/services/settings-services.html) [1.3.0-SNAPSHOT]

}

{span-one-third

### Dev Support

- [Unit Test Support](core/unittestsupport.html)
- [Integration Test Support](core/integtestsupport.html)
- [Wrapper Factory](core/wrapper.html) [stub]

###  Programming Model

- [Finetuning the Programming Model](core/metamodel-finetuning-the-programming-model.html)

}

{span-one-third

### Runtime

- [Core Runtime](core/runtime.html) [stub]
- [Webserver](core/webserver.html) [stub]

### Bundled Components

- [Bytecode Enhancers](core/bytecode.html) [stub]
- [Bypass Security](core/bypass-security.html) [stub]
- [In-memory Object Store](core/inmemory-objectstore.html) [stub]
- [In-memory Profile Store](core/inmemory-profilestore.html) [stub]

}

}

}

{group

## Viewers

{row-odd

{span-one-third

###  Wicket [1.2.0](components/viewers/wicket/release-notes/about.html)

- [About](components/viewers/wicket/about.html)
- [Titles in tables](components/viewers/wicket/titles-in-tables.html)
- [Suppressing 'remember me'](components/viewers/wicket/suppressing-remember-me.html) [1.3.0-SNAPSHOT]
- [The About page](components/viewers/wicket/configuring-the-about-page.html)
- [Customizing the viewer](components/viewers/wicket/customizing-the-viewer.html)

----------

### DHTMLX

- [About](third-party/viewers/dhtmlx/about.html)

Note: this viewer is third-party open source (outside Apache)

}

{span-one-third

###  RestfulObjects [2.0.0](components/viewers/restfulobjects/release-notes/about.html)

- [About](components/viewers/restfulobjects/about.html)


##### Applib Service Implementations

- [Event Serializer per RO Spec](components/viewers/restfulobjects/event-serializer-rospec.html)


}

{span-one-third

###  Scimpi [0.2.0-incubating](components/viewers/scimpi/release-notes/about.html)

- [About](components/viewers/scimpi/about.html)


----------

###  DnD [0.2.0-incubating](components/viewers/dnd/release-notes/about.html)

- [About](components/viewers/dnd/about.html)

----------

### BDD (Concordion) [0.2.0-incubating](components/viewers/bdd/release-notes/about.html)

- [About](components/viewers/bdd/about.html)

}

}

}

{group

## Object Stores

{row-even

{span-one-third

###  DataNucleus (JDO) [1.1.0](components/objectstores/jdo/release-notes/about.html)

- [About](components/objectstores/jdo/about.html)
- [Maven and Eclipse](components/objectstores/jdo/maven-and-eclipse.html)
- [Dates, Blobs and Lazy Loading](components/objectstores/jdo/dates-blobs-lazy-loading.html)
- [Using a JNDI Datasource](components/objectstores/jdo/using-jndi-datasource.html)
- [Workarounds](components/objectstores/jdo/workarounds.html)
- [Enabling Logging](components/objectstores/jdo/enabling-logging.html)
- [Deploying on the Google App Engine](components/objectstores/jdo/deploying-on-the-google-app-engine.html)

}

{span-one-third
###  DataNucleus (ctd)

##### Applib Service Implementations

- [Eagerly Registering Entity Types](components/objectstores/jdo/eagerly-registering-entities.html)
- [Publishing Service on JDO](components/objectstores/jdo/publishing-service-jdo.html) 
- [Auditing Service on JDO](components/objectstores/jdo/auditing-service-jdo.html)
- [Exception Recognizers](components/objectstores/jdo/exception-recognizers-jdo.html)
- [Settings Services on JDO](components/objectstores/jdo/settings-services-jdo.html) [jdo-1.2.0-SNAPSHOT]

}

{span-one-third

###  NoSQL [0.2.0-incubating](components/objectstores/nosql/release-notes/about.html)

- [About](components/objectstores/nosql/about.html)


----------
###  SQL [0.2.0-incubating](components/objectstores/sql/release-notes/about.html)

- [About](components/objectstores/sql/about.html)
- [Configuring the SQL OS](components/objectstores/sql/configuring-the-sql-os-objectstore-with-the-quickstart-archetype.html)

----------
###XML [0.2.0-incubating](components/objectstores/xml/release-notes/about.html)

- [About](components/objectstores/xml/about.html)

}

}

}

{group

{row-even

{span-one-third

## Security

### Shiro [1.1.1](components/security/shiro/release-notes/about.html)

- [About](components/security/shiro/about.html)
- [Configuring Shiro](components/security/shiro/configuring-shiro.html)
- [Using LDAP](components/security/shiro/using-ldap.html)

----------

### File [1.0.1](components/security/file/release-notes/about.html)

- [About](components/security/file/about.html)

}

{span-one-third

## Programming Models

###Groovy [0.2.0-incubating](components/progmodels/groovy/release-notes/about.html)

- [About](components/progmodels/groovy/about.html)

<!--

----------

###Kemble
- [About](components/progmodels/kemble/about.html) [stub]
-->

}

{span-one-third

## Profile Stores

###XML [0.2.0-incubating](components/profilestores/xml/release-notes/about.html)

- [About](components/profilestores/xml/about.html)

}

}

}


{group

##  Other Topics

{row-even

{span-one-third

### Plugins

- [Maven Plugin](other/maven-plugin.html) [stub]
- [Eclipse IDE Plugin](other/eclipse-plugin.html) [stub]

}

{span-one-third



}

{span-one-third

###  Committers

- [Updating the CMS site](contributors/updating-the-cms-site.html)
- [Recreating an archetype](contributors/recreating-an-archetype.html)
- [Snapshot process](contributors/snapshot-process.html)
- [Release process](contributors/release-process.html)
- [Release branch and tag names](contributors/release-branch-and-tag-names.html)
- [Verifying releases](contributors/verifying-releases.html)
- [Key generation](contributors/key-generation.html)

}

{span-one-third

###  Mothballed Components

These are no longer under active development

- [HTML Viewer](components/viewers/html/about.html) (use Wicket)

- [LDAP Security](components/security/ldap/about.html) (use Shiro)

- [SQL Security](components/security/sql/about.html) (use Shiro)

- [SQL Profile Store](components/profilestores/sql/about.html)

}

}

}

}
