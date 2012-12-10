Title: Application Library

Apache Isis works using convention-over-configuration; you write your domain objects following a set of conventions, and these are interpreted by the framework in order to render, persist, remote or otherwise interact with your domain model.

These conventions are together known as the Apache Isis Programming Model. The Apache Isis Application Library - or AppLib - constitutes those elements of the programming model that are declarative (such as annotations and interfaces). It also contains the `DomainObjectContainer` interface, which is normally injected into your domain objects and represents the only point of coupling from your domain into the framework.

See the applib programming guide ([HTML](http://incubator.apache.org/isis/applib/docbkx/html/guide/isis-applib.html) or [PDF](http://incubator.apache.org/isis/applib/docbkx/pdf/isis-applib.pdf)) for further details.

<!-- TODO: migrate content over from incubator -->
