How to have a domain entity be a POJO (not inherit from framework superclasses)
-------------------------------------------------------------------------------

It isn't mandatory for domain entities to inherit from any framework
superclass; they can be plain old java objects (pojos) if required.
However, they do at a minimum need to have a
`org.apache.isis.applib.DomainObjectContainer` injected into them (an
interface), from which other framework services can be accessed.

If you don't have a requirement to inherit from any other superclass,
then it usually makes sense to inherit from mention
`org.apache.isis.applib.AbstractDomainObject`, which already supports the
`DomainObjectContainer` and has a number of convenience helper methods.

<!--
There is further coverage of DomainObjectContainer in ? and also in ?.
-->
