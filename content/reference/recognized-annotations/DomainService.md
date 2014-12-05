Title: @DomainService

Indicates that the (concrete) class should be automatically instantiated as a domain service, and specify a number of
UI hints.

Domain services with this annotation do NOT need to be registered explicitly in `isis.properties`; they will be
discovered automatically on the CLASSPATH.

The following attributes can be specified:

* `menuBar` - the menubar in which the menu that hold's this service's actions should reside (1.8.0-SNAPSHOT)

* `menuOrder` - the order of the service's menu with respect to other service's.

* `repositoryFor` - if this domain service acts as a repository for an entity type, specify that entity type.  (This is currently informational only)

The `menuBar` can be set to PRIMARY, SECONDARY or TERTIARY.  In the Wicket viewer the PRIMARY menu bar is left-aligned,
the SECONDARY menu bar is right aligned, and the TERTIARY menu bar is associated with the user's name (far top-right).

For example:

    @DomainService(menuOrder = "10", repositoryFor = ToDoItem.class)
    public class ToDoItems {
        ...
    }

or:

    @DomainService(menuBar = DomainService.MenuBar.SECONDARY, menuOrder = "1")
    public class ToDoItemsFixturesService extends FixtureScripts {
        ...
    }

It is not (currently) possible to specify the UI hints through any other means (specifically: is *not* supported through a `.layout.json` file).