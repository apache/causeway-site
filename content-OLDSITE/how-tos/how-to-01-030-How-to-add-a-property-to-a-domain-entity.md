How to add a property to a domain entity
----------------------------------------

[//]: # (content copied to _user-guide_xxx)

A property is a scalar attribute or field of a domain entity. Its type
can be either a value type (such as an int, Date or String), or a
reference to another entity.

Properties are specified using the JavaBean conventions, recognizing a
standard accessor/mutator pair (`get` and `set`).

The syntax is:

    public PropertyType getPropertyName() 

    public void setPropertyName(PropertyType param)

where `PropertyType` is a primitive, a value object or an entity object.

Properties may either be for a value type or may reference another
entity. Values include Java primitives, and JDK classes with value
semantics (eg `java.lang.Strings` and `java.util.Dates`; see ? for the
full list). It is also possible to write your own value types (see ?). A
property referencing another domain object is sometimes called an
association.

For example, the following example contains both a value (`String`)
property and a reference (`Organisation`) property:

    public class Customer {

        private String firstName;
        public String getFirstName() {
            return firstName;
        }
        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }


        private Organisation organisation;
        public Organisation getOrganisation() {
            return organisation;
        }
        public void setOrganisation(Organisation organisation) { 
            this.organisation = organisation;
        }

        ...
    }

