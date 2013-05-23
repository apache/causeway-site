Title: Apache Isis Programming Model

*Apache Isis* works using convention-over-configuration; you write your domain objects following a set of conventions, and these are interpreted by the framework in order to render, persist, remote or otherwise interact with your domain model.

These conventions are together known as the *Apache Isis Programming Model*. The Apache Isis Application Library - or AppLib - constitutes those elements of the programming model that are declarative (such as annotations and interfaces). It also contains the `DomainObjectContainer` interface, which is normally injected into your domain objects and represents the only point of coupling from your domain into the framework.

This guide to the programming model breaks into three main parts:

How-tos
-------

  * [How-to write Domain Entities](./how-tos/000-about.html)

  * [Domain Services, Repositories and Factories](./domain-services/000-about.html)

  * [Value Types](./value-types/000-about.html)

Supporting Features
-------------------

  * [Clock, Fixtures, etc](./supporting-features/000-about.html)

Reference
---------

    * [Recognized Methods and Prefixes](./reference/Recognized-Methods-and-Prefixes.html)
    * [Recognized Annotations](./reference/recognized-annotations/000-about.html)
    * [DomainObjectContainer interface](./reference/DomainObjectContainer.html)
    * [Security](./reference/Security.html)
    * [Applib Utility Classes](./reference/Utility.html)
    * [Applib Events](./reference/Event.html)


Remarks
-------
To a large extent the conventions of the programming 
model can be described as 'intentional' - they convey an intention as to 
how domain objects, their properties and behaviours, are to be made 
available to users. But the
specific way in which those intentions are interpreted or implemented
will depend upon the framework, and/or the particular components or
options selected within that framework.

To pick a single example, marking up a domain class with the annotation
`@Bounded` is an indication that the class is intended to have only a
small number of instances and that the set does not change very often -
such as the class `Country`. This is an indication to a viewer, for
example, that the whole set of instances might be offered to the user in
a convenient form such as a drop-down list. The programming convention
has *not* been defined as `@DropDownList` because any equivalent
mechanism will suffice: a viewer might not support drop-down-lists but
instead might provide a capability to select from an `@Bounded` class by
typing the initial letters of the desired instance.
