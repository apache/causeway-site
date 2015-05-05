Hiding, disabling or validating for specific users or roles
-----------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Generally it is not good practice to embed knowledge of roles and/or
users into the domain classes; instead, this should be the
responsibility of the framework or platform and should be specified and
administered externally to the domain model. However, in rare
circumstances it might be necessary or pragmatic to implement access
control within the domain model.

The current user can be obtained from `DomainObjectContainer`, using its
`getUser()` method. Alternatively, if the domain object inherits from
`AbstractDomainObject`, then `getUser()` is also inherited. In either case
the method returns an object of type
`org.apache.isis.security.UserMemento`, which holds both username and the
set of roles for that user. <!--The full details of the security classes can
be found in ?.-->

The mechanism to apply a business rule is just to return an appropriate
value from a supporting `hideXxx()`, `disableXxx()` or `validateXxx()` method.

For example, the following requires that the `MODIFY_SALARY` role is assigned to the current user in order to update a salary property beyond
a certain value:

    public class Employee extends AbstractDomainObject {
        public BigDecimal getSalary() { ... }
        public void setSalary(BigDecimal salary) { ... }
        public String validateSalary() {
            return salary.doubleValue() >= 30000 &&
                  !getUser().hasRole("MODIFY_SALARY")?
                  "Need MODIFY_SALARY role to increase salary above 30000": null;
        }
    }
