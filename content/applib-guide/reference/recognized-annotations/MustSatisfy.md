@MustSatisfy
------------

The `@MustSatisfy` annotation allows validation to be applied to
properties and parameters using an (implementation of a)
`org.apache.isis.applib.spec.Specification` object.

For example, on a property:

    public class Customer {
        @MustSatisfy(StartWithCapitalLetterSpecification.class)
        public String getFirstName() { ... }
        ...
    }

Or, on an action parameter:

    public class CustomerRepository {
        public Customer newCustomer(
                @MustSatisfy(StartWithCapitalLetterSpecification.class)
                @Named("First Name") firstName
               ,@MustSatisfy(StartWithCapitalLetterSpecification.class)
                @Named("Last Name") lastName) {
            ...
        }
        ...
    }

The `Specification` is consulted during validation, being passed the
proposed value.

An alternative to using `@MustSatisfy` is to define a custom value type (though this introduces additional mapping complexity for both viewers and objectstore)<!--,
see ?-->.
