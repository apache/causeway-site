Profiles
========

> Support for user profiles

As well as allowing domain entities to be persisted into object stores,
*Apache Isis* also allows user *profiles* to be persisted into a profile
store.

Profiles and Perspectives
-------------------------

Every user can have one profile associated with them, which consists of:

-   a set of options or preferences

-   a set of perspectives

A perspective is something akin to a layout or desktop, representing a
configuration of relevant objects as might be displayed on the home page
of the viewer. In particular, perspectives allow the set of services
available to a user (eg as icons in the DnD viewer) to be customized for
that user. Since these services represent the "start points" for the
user to interact with the domain model, they in a sense define an
application on a per-user basis.

The elements that make up a perspective are:

-   a set of services (identified by the string returned from each
    service's getId() method, see ?)

    These are the services (eg icons) that can be accessed from that
    perspective

-   a set of objects

    These might represent bookmarks to objects saved from a previous
    session.

The applib contains types to define these two concepts; specifically
Profile and Perspective. These are actually interfaces, the
implementation is provided by framework itself.

Runtime and Viewer Support
--------------------------

Support for profiles will vary across runtime implementations and across
viewers. The *default runtime* implementation *does* support profiles,
however, and works such that if a user logs in and no perspective exists
for that user one will automatically be created. This will either be a
copy of the 'template' perspective, or, if no such template exists, then
simply a perspective containing all the known services.

Moreover, the runtime must be configured to use some sort of persistence
mechanism for profiles such that they are persisted between runs. The
default runtime does support this (though the default is the in-memory
profilestore that does not persist any information between sessions).

Even if the configured runtime does support profiles, not every viewer
necessarily uses the concept. The most notable viewer that *does*
support the idea is the *dnd viewer*.

