Title: @ViewModelLayout (1.8.0-SNAPSHOT)

> stub

The `@ViewModelLayout` annotation is identical to the [@DomainObjectLayout](./DomainObjectLayout.html), but is provided
for symmetry with domain objects that have been annotated using [@ViewModel](./ViewModel.html) (rather than `@DomainObject(nature=VIEW_MODEL)`).

    @ViewModel(...)
    @ViewModelLayout(...)
    public class MyViewModel { ... }


## Source code

See <a href="https://issues.apache.org/jira/browse/ISIS-970">ISIS-970</a> and <a href="https://github.com/apache/isis/blob/master/core/applib/src/main/java/org/apache/isis/applib/annotation/ViewModelLayout.java">@ViewModelLayout</a> source code.

## See also

Similar layout annotations exist for other elements of the metamodel:

* [@ActionLayout](./ActionLayout.html) for actions
* [@CollectionLayout](./CollectionLayout.html) for collections
* [@PropertyLayout](./PropertyLayout.html) for properties
* [@ParameterLayout](./ParameterLayout.html) for action parameters
* [@DomainObjectLayout](./DomainObjectLayout.html)
* [@DomainServiceLayout](./DomainServiceLayout.html)

Corresponding domain semantics:

* [@ViewModel](./ViewModel.html)
