Title: @CollectionLayout (1.8.0)

[//]: # (content copied to _user-guide_xxx)

The `@CollectionLayout` annotation applies to collections, collecting together all UI hints within a single
annotation.

* `cssClass` - the css class that a collection should have, to allow more targetted styling in `application.css`
* `describedAs` - description of this collection, eg to be rendered in a tooltip.
* `hidden` - indicates where in the UI the collection should *not* be visible in the UI (only NOWHERE or EVERWHERE/ANYWHERE)
* `named` -the name of this collection (overriding the name derived from its name in code)
* `namedEscaped` - whether to HTML escape the name of this property.  Defaults to true.
* `paged` - the page size for instances of this class when rendered within a table.
* `render` - that the rendering of a collection should be performed LAZILY or EAGERLY
* `sortedBy` - Indicates that the elements in a ({@link java.util.SortedSet}) collection should be sorted according to a different order than the natural sort order, as defined by the specified{@link java.util.Comparator}

For example:

    public class ToDoItem {

        @CollectionLayout(
            cssClass="x-key",
            named="Todo items that are <i>dependencies</i> of this item.",
            namedEscaped=false,
            describedAs="Other todo items that must be completed before this one",
            labelPosition=LabelPosition.LEFT,
            render=EAGERLY
            typicalLength=80)
        public SortedSet<ToDoItem> getDependencies() { ... }

        ...
    }

It is also possible to apply the annotation to actions of domain services that are acting as [contributed collections](../../more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html).

## See also

Similar layout annotations exist for other elements of the metamodel:

* [@PropertyLayout](./PropertyLayout.html) for properties
* [@ActionLayout](./ActionLayout.html) for actions
* [@ParameterLayout](./ParameterLayout.html) for action parameters
* [@DomainObjectLayout](./DomainObjectLayout.html)
* [@DomainServiceLayout](./DomainServiceLayout.html)
* [@ViewModelLayout](./ViewModelLayout.html)

Corresponding domain semantics:

* [@Collection](./Collection.html)

