How to register domain services, repositories and factories
-----------------------------------------------------------

All domain services (which includes repositories and factories) should be registered in the `isis.properties` configuration file, under the `isis.services` key (a comma-separated list).

For example:

    isis.services = com.mycompany.myapp.employee.Employees\,
                    com.mycompany.myapp.claim.Claims\,
                    ...

This will then result in the framework instantiating a single instance of each of the services listed.

If all services reside under a common package, then the `isis.services.prefix` can specify this prefix:

    isis.services.prefix = com.mycompany.myapp
    isis.services = employee.Employees,\
                    claim.Claims,\
                    ...

This is quite rare, however; you will often want to use default implementations of domain services that are provided by the framework and so will not reside under this prefix.

Examples of framework-provided services (as defined in the applib) can be found referenced from the main [documentation](../../documentation.html) page.   They include clock, auditing, publishing, exception handling, view model support, snapshots/mementos, and user/application settings management.
