How to provide additional UI hints
==================================

> How to override Isis' defaults for presentation.

With the exception of value types for action parameters <!--(see ?)-->, Isis
can normally infer a reasonable name for entity/service and its class
members. However, these defaults can be overridden if required. One
possible case is where the desired name is a reserved word in Java (eg
"default", or "package").

A slightly more advanced use-case is to specify an icon not for an
entity's type, but for an entity instance. Typically this reflects that
instance's state, eg with an overlay on top of the base icon. For
example, this allows the user to distinguish between an Order that has
been placed vs one that has been shipped.

