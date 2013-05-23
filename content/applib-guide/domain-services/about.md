How to Write Domain Services, Repositories and Factories
===========================================

> How-to's relating to writing services, repositories and factories.

This section contains how-to's for programming conventions that writing
domain services (by which we also mean repositories and factories); ie
everything that isn't a domain object or a value type.

Domain services are instantiated once and once only by the framework,
and are used to centralize any domain logic that does not logically
belong in a domain entity or value. *Isis* will automatically inject
services into every domain entity that requests them, and into each
other.

How-to's:

* [How to register domain services, repositories and factories](./how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html)

* [How to write a typical domain service](./how-to-09-020-How-to-write-a-typical-domain-service.html)

* [How to use a generic repository](./how-to-09-030-How-to-use-a-generic-repository.html)

* [How to write a custom repository](./how-to-09-040-How-to-write-a-custom-repository.html)

* [How to use Factories](./how-to-09-050-How-to-use-Factories.html)

