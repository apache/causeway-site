Title: @DomainService

[//]: # (content copied to _user-guide_xxx)

Indicates that the (concrete) class should be automatically instantiated as a domain service.

Domain services with this annotation do NOT need to be registered explicitly in `isis.properties`; they will be
discovered automatically on the CLASSPATH.

The following attributes can be specified:

* `nature` - the nature of this service: providing actions for menus, contributed actions, or neither (1.8.0)

* `repositoryFor` - if this domain service acts as a repository for an entity type, specify that entity type.  (This is currently informational only)

* `menuOrder` - the order of the service's menu with respect to other service's (deprecated in 1.8.0)


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



## Source code

See <a href="https://issues.apache.org/jira/browse/ISIS-970">ISIS-970</a> and <a href="https://github.com/apache/isis/blob/master/core/applib/src/main/java/org/apache/isis/applib/annotation/DomainObject.java">@DomainObject</a> source code.

## See also

Other domain semantics:

* [@Property](./Property.html)
* [@Collection](./Collection.html)
* [@Action](./Action.html)
* [@Parameter](./Parameter.html)
* [@DomainObject](./DomainObject.html)
* [@DomainService](./DomainService.html)
* [@ViewModel](./ViewModel.html)

Corresponding view layer ("Layout") annotation:

* [@PropertyLayout](./PropertyLayout.html)
* [@CollectionLayout](./CollectionLayout.html)
* [@ActionLayout](./ActionLayout.html)
* [@DomainObjectLayout](./DomainObjectLayout.html)
* [@DomainServiceLayout](./DomainServiceLayout.html)
* [@ViewModelLayout](./ViewModelLayout.html)
