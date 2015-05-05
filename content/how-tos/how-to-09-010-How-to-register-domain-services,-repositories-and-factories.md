How to register domain services, repositories and factories
-----------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Domain services (which includes repositories and factories) can either be automatically registered (by virtue of being present on the classpath and annotated appropriately) or must be explicitly registered in the `isis.properties` configuration file, under the `isis.services` key (a comma-separated list).

### Automatic Registration

Automatic registration of services requires that the service be annotated with the `@DomainService` annotation (in `org.apache.isis.applib.annotations` package); for example:

    package com.mycompany.myapp.dom.customer;
    import org.apache.isis.applib.annotation.DomainService
    
    @DomainService
    public class Customers {
        ...
    }

Isis must also be configured to enable automatic registration of doman services; add the following to `isis.properties`:

    isis.services-installer=configuration-and-annotation

Also, the package prefix (comma separated) for all domain services must be specified; for example:

    isis.services.ServicesInstallerFromAnnotation.packagePrefix=com.mycompany.myapp

Isis will then discover all `@DomainService`-annotated services and automatically register them.  


### Explicit Registration

Domain services can also be explicitly registered, again in `isis.properties`, by updating the `isis.services` key.  For example:

    isis.services = com.mycompany.myapp.employee.Employees\,
                    com.mycompany.myapp.claim.Claims\,
                    ...

If all services reside under a common package, then the `isis.services.prefix` can specify this prefix:

    isis.services.prefix = com.mycompany.myapp
    isis.services = employee.Employees,\
                    claim.Claims,\
                    ...

This is quite rare, however; you will often want to use default implementations of domain services that are provided by the framework and so will not reside under this prefix.

Examples of framework-provided services (as defined in the applib) can be found referenced from the main [documentation](../../documentation.html) page and also the [services](../../reference/services.html) page.
