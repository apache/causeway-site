Pojos vs Inheriting from framework superclasses
-------------------------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

{note
A lot of the programming conventions described in these how-tos are encapsulated in the [Eclipse templates](../intro/resources/editor-templates.html).  If you use Eclipse, do install these first; they will save a lot of time.
}


It isn't mandatory for either domain entities or domain services to inherit from any framework superclass; they can be plain old java objects (pojos) if required.

However, they do at a minimum need to have a
[`org.apache.isis.applib.DomainObjectContainer`](../reference/DomainObjectContainer.html) injected into them, from which other framework services can be accessed.

    public void setContainer(DomainObjectContainer container) {
        this.container = container;
    }

Other syntaxes supported for dependency injection are described [here](./how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html).

If you don't have a requirement to inherit from any other superclass,
then it usually makes sense to inherit from one of the abstract classes providede in the applib.

### Domain entities

In the case of entities, you can inherit from 
`org.apache.isis.applib.AbstractDomainObject`.  This already supports the injection of
`DomainObjectContainer` and has a number of convenience helper methods.

### Domain services

In the case of services, you can inherit either from `org.apache.isis.applib.AbstractService` or from
`org.apache.isis.applib.AbstractRepositoryAndFactory`.  Again, these support the injection of `DomainObjectContainer` and have a number of convenience
helper methods.

The diagram below shows the relationship between these types
and the `DomainObjectContainer`.

![](images/AbstractContainedObject-hierarchy.png)

**For DDD'ers**: note that what this implies is that *Apache Isis* treats factories and repositories as just another type of domain service.
