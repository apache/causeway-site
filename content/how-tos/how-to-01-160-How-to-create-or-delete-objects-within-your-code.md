How to create or delete objects within your code
------------------------------------------------

When you create any domain object within your application code, it is
important that the framework is made aware of the existence of this new
object - in order that it may be persisted to the object store, and in
order that any services that the new object needs are injected into it.

Just specifying `new Customer()`, for example, will create a `Customer` object, but that object will *not* be known to the framework.  Such an object *can* be persisted by the framework.  However any services will not be injected into the object until such time.  Also, the [default value for any properties](how-to-03-017-How-to-specify-default-value-of-an-object-property.html) will not be setup, nor will the [created callback](../reference/object-lifecycle-callbacks.html) be called.

Therefore, the recommended way to instantiate an object is to do so through the framework.  However, since we do
not want to couple our domain objects too closely to Isis, we use the
idea of a 'container' to mediate, specified by the
`org.apache.isis.applib.DomainObjectContainer` interface. The
full list of methods provided by `DomainObjectContainer` can be found [here](../reference/DomainObjectContainer.html).

This interface defines the following methods for managing domain
objects:

-   `<T> T newTransientInstance(final Class<T> ofClass)`

    Returns a new instance of the specified class, that is transient
    (unsaved). The object may subsequently be saved either by the user
    invoking the Save action (that will automatically be rendered on the
    object view) or programmatically by calling `persist(Object
                transientObject)`

-   `boolean isPersistent()`

    Checks whether an object has already been persisted. This is often
    useful in controlling visibility or availability of properties or
    actions.

-   `void persist(Object transientObject)`

    Persists a transient object (created using `newTransientInstance(...)`, see above).

-   `void persistIfNotAlready(Object domainObject)`

    It is an error to persist an object if it is already persistent;
    this method will persist only if the object is not already
    persistent (otherwise it will do nothing).

-   `void remove(Object persistentObject)`

    Removes (deletes) from the object store, making the reference
    transient.

-   `void removeIfNotAlready(Object domainObject)`

    It is an error to remove an object if it is not persistent; this
    method will remove only if the object is known to be persistent
    (otherwise it will do nothing).

A domain object specifies that it needs to have a reference to the
`DomainObjectContainer` injected into by including the following code:

    private DomainObjectContainer container;
    protected DomainObjectContainer getContainer() {
        return container;
    }
    public final void setContainer(final DomainObjectContainer container) {
        this.container = container;
    }

Creating or deleting objects is then done by invoking those methods on
the container. 

###Examples

The following code would then create a new
Customer object within another method:

    Customer newCust = getContainer().newTransientInstance(Customer.class);
    newCust.setName("Charlie");
    getContainer().persist(newCust);

If you are able to make your domain object inherit from
`org.apache.isis.applib.AbstractDomainObject` then you have direct
access to those methods, so the code would become:

    Customer newCust = newTransientInstance(Customer.class);
    newCust.setName("Charlie");
    persist(newCust);

As an alternative to putting the creation logic within your domain
objects, you could alternatively delegate to an injected service. Ultimately factories just delegate back to `DomainObjectContainer` in
the same way, so from a technical standpoint there is little difference.
However it is generally worth introducing a factory because it provides
a place to centralize any business logic. It also affords the
opportunity to introduce a domain term (eg `ProductCatalog` or
`StudentRegister`), thereby reinforcing the "ubiquitous language".

These methods are actually provided by the
`org.apache.isis.applib.AbstractContainedObject` and so are also available
on `org.apache.isis.applib.AbstractService` (and, hence, on
`org.apache.isis.applib.AbstractFactoryAndRepository`) for creating
objects within a service.

> **Warning**
>
> It is possible to create a transient object within another transient
> object. When the framework persists any transient object, by default
> it will automatically persist any other transient object referenced by
> that object. However, if any of these transient objects are to be
> exposed to the user (while in their transient state), then you need to
> write your code very carefully - anticipating the fact that the user
> could elect to save any of the transient objects at any point - which
> could cause the graph of related objects to be persisted in an invalid
> state.
>
> The recommended approach is, if possible, to mark these supplementary
> classes as not persistable by the user, or not to permit the
> user to create a new transient object that is a child of an existing
> transient object, but, rather, to require the user to save the parent
> object first.

