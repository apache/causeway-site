How to Write Domain Services, Repositories and Factories
===========================================

> How-to's relating to writing services, repositories and factories.

This chapter contains how-to's for programming conventions that writing
domain services (by which we also mean repositories and factories); ie
everything that isn't a domain object or a value type.

Domain services are instantiated once and once only by the framework,
and are used to centralize any domain logic that does not logically
belong in a domain entity or value. *Isis* will automatically inject
services into every domain entity that requests them, and into each
other.
