Title: Migrating from v1.5.0 to v1.6.0

In v1.6.0 we've started work on simplifying and also modularizing the framework.  Specifically:

* [ISIS-832](https://issues.apache.org/jira/browse/ISIS-832) - to simplify the framework by bringing Restful Objects viewer, the JDO/DataNucleus objectstore and Shiro Security into Isis Core, and
* [ISIS-833](https://issues.apache.org/jira/browse/ISIS-833) - to factor out re-usable modules from existing services (primarily the JDO auditing, publishing and command services).  

This has resulted in a number of Maven modules being renamed, added or removed.  This will necessarily impact existing applications, requiring changes to existing `pom.xml` files.  To minimize the migration effort, and to reduce risk, no classes/packages have been renamed. 

This approach does mean that there are now mismatches between package names and modules, but better to go with baby steps.  In any case, Isis tries to follow semantic versioning, which means that the time to rationalize such matters is in Isis 2.0, not in the 1.6.x baseline.

Another related change in 1.6.0 is [ISIS-493](https://issues.apache.org/jira/browse/ISIS-493), which introduces a new annotation called `@DomainService`.  This allows services to be automatically registered (rather than have to register in `WEB-INF/isis.properties`).


### Summary of changes

modules moved to core:

* `o.a.i.security:isis-security-shiro` -> `o.a.i.core:isis-core-security-shiro`

* `o.a.i.objectstore:isis-objectstore-jdo` -> DELETED (modules now parented by core directly)
* `o.a.i.objectstore:isis-objectstore-jdo-applib` -> DELETED; see the new `isis-module-xxx` modules below
* `o.a.i.objectstore:isis-objectstore-jdo-metamodel` -> `o.a.i.core:isis-core-objectstore-jdo-metamodel`
* `o.a.i.objectstore:isis-objectstore-jdo-datanucleus` -> `o.a.i.core:isis-core-objectstore-jdo-datanucleus`

* `o.a.i.viewer:isis-viewer-restfulobjects` -> DELETED (modules now parented by core directly)
* `o.a.i.viewer:isis-viewer-restfulobjects-rendering` -> `o.a.i.core:isis-core-viewer-restfulobjects-rendering`
* `o.a.i.viewer:isis-viewer-restfulobjects-server` -> `o.a.i.core:isis-core-viewer-restfulobjects-server`

renamed modules

* `o.a.i.core:isis-core-wrapper` -> `o.a.i.module:isis-module-wrapper`

new modules:

* `o.a.i.module:isis-module-settings`
    * this has `applib` and `impl` as submodules
    * application and user settings
* `o.a.i.module:isis-module-devutils`
    * this has `applib` and `impl` as submodules
    * developer utilities service (download metamodel etc)
* `o.a.i.module:isis-module-audit-jdo`
    * persisting `AuditEntry` entity
* `o.a.i.module:isis-module-background`
    * scheduling background commands
* `o.a.i.module:isis-module-command-jdo`
    * persisting `Command` entity and enabling background commands via scheduler
* `o.a.i.module:isis-module-publishing-jdo`
    * persisting `PublishedEvent` entity
* `o.a.i.module:isis-module-publishingeventserializer-ro`
    * used by publishing service to serialize object graph into JSON

The reason that the first two modules have their own applib but the last four do not is because the latter four will be used by the framework if configured, eg to publish audit events.  Their APIs are therefore defined in Isis' own applib.   In contrast, the settings and devutils modules are not used or referenced in any capacity by the framework.


### Impact to existing applications

in `root/pom.xml`

* remove dependency to `o.a.i.security:isis-security-shiro`  (now parented by core parent pom).
* remove dependency to `o.a.i.objectstore:isis-objectstore-jdo`  (this is a deleted parent pom, child modules referenced instead by core parent pom).
* remove dependency to `o.a.i.viewer:isis-viewer-restfulobjects`  (this is a deleted parent pom, child modules referenced instead by core parent pom).

in `dom/pom.xml`

* delete dependency to `o.a.i-objectstore:isis-objectstore-jdo-applib`

* add in dependencies (if used) to
    * `o.a.i.module:isis-module-settings-applib`
    * `o.a.i.module:isis-module-devutils-applib`

* update dependency on `isis-core-wrapper` (if used), instead to `isis-module-wrapper`

in `integtests/pom.xml`

* update dependency on `isis-core-wrapper`, instead to `isis-module-wrapper`

in `webapp/pom.xml`

* add in dependencies (if used) to:
    * `o.a.i.module:isis-module-audit-jdo`
    * `o.a.i.module:isis-module-background`
    * `o.a.i.module:isis-module-command-jdo`
    * `o.a.i.module:isis-module-publishing-jdo`
    * `o.a.i.module:isis-module-publishingeventserializer-ro`
    * `o.a.i.module:isis-module-devutils-impl`
    * `o.a.i.module:isis-module-settings-impl-jdo`

in `webapp/src/main/webapp/WEB-INF/isis.properties`

* enable `@DomainService` support using:

    isis.services-installer=configuration-and-annotation
    isis.services.ServicesInstallerFromAnnotation.packagePrefix=\
                                     com.mycompany.foo,com.mycompany.bar

* for the `isis.services` key:

    * add (if required):
        * `org.apache.isis.applib.services.bookmark.BookmarkHolderActionContributions`
        * `org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoContributions`

    * remove (since now automatically registered via `@DomainService`):
        * `org.apache.isis.objectstore.jdo.datanucleus.service.support.IsisJdoSupportImpl`
        * `org.apache.isis.objectstore.jdo.datanucleus.service.eventbus.EventBusServiceJdo`
        * `org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdo`
        * `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdo`
        * `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoRepository`
        * `org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoRepository`
        * `org.apache.isis.objectstore.jdo.applib.service.audit.AuditingServiceJdo`
        * `org.apache.isis.objectstore.jdo.applib.service.audit.AuditingServiceJdoRepository`
        * `org.apache.isis.objectstore.jdo.applib.service.publish.PublishingService`
        * `org.apache.isis.objectstore.jdo.applib.service.publish.PublishingServiceJdoRepository`
        * `org.apache.isis.viewer.restfulobjects.rendering.eventserializer.RestfulObjectsSpecEventSerializer`

       
It is still necessary to:

* explicitly register any service (`*Contributions`) that affects the UI
* explicitly register ApplicationSettings, UserSettings and DeveloperUtilities services (each is designed to be optionally subclassed)
