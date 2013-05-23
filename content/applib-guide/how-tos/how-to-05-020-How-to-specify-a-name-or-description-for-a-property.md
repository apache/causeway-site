How to specify a name and/or description for a property
-------------------------------------------------------

### Specifying the name for a property

By default the framework will use the property name itself to label the
property on the user interface. If you wish to override this, use the
`@Named `annotation on the property.

For example:

    public class Customer() {
        @Named("Given Name")
        public String getFirstName() { ... }
        ...
    }

### Specifying a description for a property

An additional description can be provided on a property using the
`@DescribedAs` annotation. The framework will take responsibility to
make this description available to the user, for example in the form of
a tooltip.

For example:

    public class Customer() {
        @DescribedAs("The customer's given name")
        public String getFirstName() { ... }
        ...
    }

