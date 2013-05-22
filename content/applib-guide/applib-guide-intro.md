Apache Isis Programming Model
=======

*Apache Isis* is designed to allow programmers rapidly develop domain-driven applications following the [Naked
Objects](http://en.wikipedia.org/wiki/Naked_Objects) pattern. It is made
up of a core plus a number of components for each of the main APIs:
objectstores, security, viewers and profilestores.

This guide is written for programmers looking to understand the
programming conventions, annotations and supporting utilities within the
*Apache Isis* application library (or *applib*), in order that the
framework can correctly pick up and render the business rules and logic
encoded within their domain objects.

*Apache Isis* is hosted at the [Apache
Foundation](http://incubator.apache.org/isis), and is licensed under
[Apache Software License
v2](http://www.apache.org/licenses/LICENSE-2.0.html).

The conventions of the programming model are best described as
'intentional' - they convey an intention as to how domain objects, their
properties and behaviours, are to be made available to users. The
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

This part of the guide is a set of chapters that provides how-to's for
writing domain objects, by which we mean domain entities, value types,
services and repositories/factories.
