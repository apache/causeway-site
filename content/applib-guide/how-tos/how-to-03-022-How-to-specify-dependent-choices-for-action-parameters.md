How to specify dependent choices for action parameters
------------------------------------------------------

Sometimes there is a dependency between the value of one parameter and the set of values to another.  For example, if selecting a particular category, then this implies a set of subcategories belonging to that category.  Or, if selecting a particular country, then this implies a set of states/counties within that country.

To specify such a dependency, the `choicesNActionName()` can be overloaded with  the `N-1` preceding parameters. 

The syntax is:

    public Collection<ParameterType> choicesNActionName(arg0, arg1, ..., argN-1)

where N indicates the 0-based parameter number.  Any subtype of `Collection` may also be used.

For example:

    public class Book {
        public void describeAndCategorize(
                @Named("Description") String description
                Genre genre,
                Subgenre subgenre) {
            ...
        }
        public Collection<Subgenre> choices2Categorize(
               String description,
               Genre genre) {
            return genre.getSubgenres();
        }
        ....
    }


> **NOTE**: at this writing this capability does not exist for properties that have dependencies.  Instead, make the properties read-only (using `@Disabled`) and provide an action to update them instead.  