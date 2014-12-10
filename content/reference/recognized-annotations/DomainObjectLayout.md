Title: @DomainObjectLayout

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


## See also

Similar layout annotations exist for other elements of the metamodel:

* [@ActionLayout](./ActionLayout.html) for actions
* [@CollectionLayout](./CollectionLayout.html) for collections
* [@PropertyLayout](./PropertyLayout.html) for properties
* [@ParameterLayout](./ParameterLayout.html) for action parameters


