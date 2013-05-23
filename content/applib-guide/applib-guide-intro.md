Apache Isis Programming Model
=======

*Apache Isis* is designed to allow programmers rapidly develop domain-driven applications following the [Naked Objects](http://en.wikipedia.org/wiki/Naked_Objects) pattern. It is made up of a core plus a number of components for each of the main APIs: objectstores, viewers, and security.

This guide is written for programmers looking to understand the
*Apache Isis* programming mode: the programming conventions, annotations 
and supporting utilities supplied within the *Apache Isis* application library 
(or *applib*).  Applications that follow these conventions enable the framework to correctly pick up and render the business rules and logic encoded within their domain objects.

The guide breaks into three main parts:

* How-tos

  * [How-to write Domain Entities](./how-tos/000-about.html)

  * [Domain Services, Repositories and Factories](./domain-services/000-about.html)

  * [Value Types](./value-types/000-about.html)

* [Supporting Features](./supporting-features/000-about.html)

* Reference:

    * [Recognized Methods and Prefixes](./reference/Recognized-Methods-and-Prefixes.html)
    * [Recognized Annotations](./reference/recognized-annotations/000-about.html)
    * [DomainObjectContainer interface](./reference/DomainObjectContainer.html)
    * [Security](./reference/Security.html)
    * [Applib Utility Classes](./reference/Utility.html)
    * [Applib Events](./reference/Event.html)

You will note that to a large extent the conventions of the programming 
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
