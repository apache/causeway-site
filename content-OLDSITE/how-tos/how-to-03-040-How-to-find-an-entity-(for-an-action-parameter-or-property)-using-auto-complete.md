How to find an entity (for an action parameter or property) using auto-complete
-------------------------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Some viewers (eg the Wicket viewer) allow an entity to be specified (as
an argument for an action parameter, or as the new value of a property)
by enabling the user to type its title. The framework then searches for
a matching instance, presenting them in a drop-down list.

This is accomplished using two annotations. The @AutoComplete annotation
is used on the entity type itself:

    @AutoComplete(repository=Customers.class)
    public class Customer {
        ...
    }

The `repository` attribute indicates the class of the domain service
that has an autoComplete() method. This is required to accept a single
String and return a List of candidates:

    public class Customers {
        ...
        @Hidden
        public List<Property> autoComplete(String searchPhrase) {        
            return allMatches(new QueryDefault<Customer>("customers_findByName", "name", searchPhrase));
        }
    }

If required, a different action name than "autoComplete" can be
specified.

