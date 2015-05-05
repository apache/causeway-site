Title: @DomainObjectLayout (1.8.0)

[//]: # (content copied to _user-guide_xxx)

The `@DomainObjectLayout` annotation applies to domain classes, collecting together all UI hints within a single
annotation.

* `cssClass` - the css class that a domain class (type) should have, to allow more targetted styling in `application.css`
* `describedAs` - description of this class, eg to be rendered in a tooltip.
* `named` -the name of this class (overriding the name derived from its name in code)
* `paged` - the page size for instances of this class when rendered within a table.
* `plural` - the plural name of the class


For example:

    @DomainObjectLayout(
        cssClass="x-key",
        describedAs="Capture a task that you need to do",
        paged=30)
    )
    public class ToDoItem {
        ...
    }

For view models that have been annotated with `@ViewModel` (rather than `@DomainObject(nature=VIEW_MODEL)` the
equivalent [@ViewModelLayout](./ViewModelLayout.html) can be used.

## See also

Similar layout annotations exist for other elements of the metamodel:

* [@ActionLayout](./ActionLayout.html) for actions
* [@CollectionLayout](./CollectionLayout.html) for collections
* [@PropertyLayout](./PropertyLayout.html) for properties
* [@ParameterLayout](./ParameterLayout.html) for action parameters
* [@DomainServiceLayout](./DomainServiceLayout.html)
* [@ViewModelLayout](./ViewModelLayout.html)

Corresponding domain semantics:

* [@DomainObject](./DomainObject.html)
