How to validate declaratively using @MustSatisfy
------------------------------------------------

The `@MustSatisfy` annotation is an alternative to using imperative
validation, allowing validation rules to be captured in an
(implementation of a) `org.apache.isis.applib.spec.Specification`.

For example:

    public class DomainObjectWithMustSatisfyAnnotations extends AbstractDomainObject {

        private String lastName;
        @MustSatisfy(SpecificationRequiresFirstLetterToBeUpperCase.class)
        public String getLastName() {
            resolve(lastName);
            return lastName;
        }
        public void setLastName(String lastName) {
            this.lastName = lastName;
            objectChanged();
        }

        public void changeLastName(
                @MustSatisfy(SpecificationRequiresFirstLetterToBeUpperCase.class)
                String lastName
                ) {
            setLastName(lastName);
        }

    }

To help you write your own `Specification`s, there are some adapter
classes in `org.apache.isis.applib.specs`:

-   `AbstractSpecification`, which implements `Specification` and takes
    inspiration from the [Hamcrest](http://code.google.com/p/hamcrest/)
    library's `TypeSafeMatcher` class

-   `SpecificationAnd`, which allows a set of `Specification`s to be grouped
    together and require that *all* of them are satisfied

-   `SpecificationOr`, which allows a set of `Specification`s to be grouped
    together and require that *at least one* of them is satisfied

-   `SpecificationNot`, which requires that the provided `Specification` is
    *not* satisfied

