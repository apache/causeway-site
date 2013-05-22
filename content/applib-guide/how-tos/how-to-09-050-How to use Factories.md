How to use Factories
--------------------

Like repositories, factories are defined by interface in the domain, decoupling the domain objects from their actual implementation.

Unlike repositories, there is no particular need to change the implementation when moving from one object store to another, because in all cases the factory can simply delegate to its injected `DomainObjectContainer`.

The methods for `DomainObjectContainer` that are relevant for a factory are:

-   `<T> T newTransientInstance(final Class<T> ofClass)`

-   `<T> T newPersistentInstance(final Class<T> ofClass)`

-   `persist(Object)`

-   `persistIfNotAlready(Object)`

<!--
These are discussed in more detail in ?. See also ? for full coverage of
the methods available in DomainObjectContainer.-->
