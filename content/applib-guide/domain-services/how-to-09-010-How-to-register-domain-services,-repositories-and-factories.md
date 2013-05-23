How to register domain services, repositories and factories
-----------------------------------------------------------

All domain services (which includes repositories and factories) should be registered in the `isis.properties` configuration file, under the `isis.services.prefix` (a common package name) and `isis.services` key (a comma-separated list).

For example:

    isis.services.prefix = org.apache.isis.support.prototype.objstore.dflt
    isis.services = employee.EmployeeRepositoryDefault, claim.ClaimRepositoryDefault

This will instantiate a single instance of each of the two services listed.
