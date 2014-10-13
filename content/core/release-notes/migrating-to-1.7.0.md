Title: Migrating from v1.6.0 to 1.7.0

In v1.7.0 we've continued the work started in [1.6.0](migrating-to-1.6.0.html) in modularizing the framework.  The most important change to note is that all Isis core modules (with the Maven `groupId` of `org.apache.isis.module` have now MOVED to [http://www.isisaddons.org](Isis Addons).

In addition, we've retired some obsolete (and unused) functionality, specifically the `ProfileStore` component.

To move up amounts to changing POM files and, where required, updating package names for any referenced modules.

## Reorganized 'modules' ##

The following modules are no longer released as part of Isis core and have moved to Isis Addons (or in one case, back into Isis core).

Minor changes are required to `pom.xml` files and (in some cases) to `isis.properties` config file.  

In one or two exceptional cases it may be necessary to fix up import statements if there are reference to changed package/class names in code (most likely any dependency on the `devutils` module or `settings` module).

### Audit module ###

In `pom.xml`, replace:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-audit-jdo</artifactId>
    </dependency>

with:

    <dependency>
        <groupId>org.isisaddons.module.audit</groupId>
	    <artifactId>isis-module-audit-dom</artifactId>
    </dependency>

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).

### Command module ###

In `pom.xml`, replace:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-command-jdo</artifactId>
    </dependency>

with:

    <dependency>
        <groupId>org.isisaddons.module.command</groupId>
	    <artifactId>isis-module-command-dom</artifactId>
    </dependency>

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).

### DevUtils module ###

In `pom.xml`, replace:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-devutils-applib</artifactId>
    </dependency>

with:

    <dependency>
        <groupId>org.isisaddons.module.devutils</groupId>
	    <artifactId>isis-module-devutils-dom</artifactId>
    </dependency>

Remove any references to:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-devutils</artifactId>
    </dependency>

or to:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-devutils-impl</artifactId>
    </dependency>

These modules are no longer required (the `org.apache.isis.module:isis-module-devutils-applib` 
and `org.apache.isis.module:isis-module-devutils-impl` submodules have been combined 
into the new `org.isisaddons.module.devutils:isis-module-devutils-dom` module).

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).

### Publishing module ###

In `pom.xml`, replace:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-publishing-jdo</artifactId>
    </dependency>

with:

    <dependency>
        <groupId>org.isisaddons.module.publishing</groupId>
	    <artifactId>isis-module-publishing-dom</artifactId>
    </dependency>

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).

### Publishing Event Serializer RO module ###

Remove any references to:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-publishingeventserializer-ro</artifactId>
    </dependency>

This module has been merged with `org.isisaddons.module.publishing:isis-module-publishing-dom`, above.

### Settings module ###

In `pom.xml`, replace:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-settings-applib</artifactId>
    </dependency>

with:

    <dependency>
        <groupId>org.isisaddons.module.settings</groupId>
	    <artifactId>isis-module-settings-dom</artifactId>
    </dependency>

Remove any references to:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-settings</artifactId>
    </dependency>

or to:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-settings-impl</artifactId>
    </dependency>

These modules are no longer required (the `org.apache.isis.module:isis-module-settings-applib` 
and `org.apache.isis.module:isis-module-settings-impl` submodules have been combined 
into the new `org.isisaddons.module.settings:isis-module-settings-dom` module).

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).

### Background module ###

In `pom.xml`, remove:

    <dependency>
        <groupId>org.apache.isis.module</groupId>
	    <artifactId>isis-module-background</artifactId>
    </dependency>

The service classes have been moved into existing `org.apache.isis.core:isis-core-runtime` Maven module (that is, already be referenced in the `pom.xml`).

If necessary, also update any services registered in `isis.properties` (package/class names may have changed slightly).


## Retired `ProfileStore` component ##

As per <a href='https://issues.apache.org/jira/browse/ISIS-802'>ISIS-802</a>, the ProfileStore component has been removed.  This functionality was not surfaced or available in the Wicket or Restful Objects viewers, so there is no meaningful loss of functionality.  However, Maven `pom.xml` files will require updating:

Specifically, remove any dependencies on `org.apache.isis:isis-core-profilestore`:

    <dependency>
        <groupId>org.apache.isis.core</groupId>
	    <artifactId>isis-core-profilestore</artifactId>
    </dependency>

A number of corresponding classes/interfaces have also been removed from the Isis applib:
    
* `org.apache.isis.applib.fixtures.userprofile.UserProfileService`
* `org.apache.isis.applib.fixtures.userprofile.UserProfileServiceAware`
* `org.apache.isis.applib.fixtures.UserProfileFixture`
* `org.apache.isis.applib.profiles.Profile`
* `org.apache.isis.applib.profiles.Perspective`
    
It is highly unlikely that any existing production code references these classes.