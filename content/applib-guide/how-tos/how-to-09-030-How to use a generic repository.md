How to use a generic repository
-------------------------------

To speed up initial prototype the framework allows so-called generic repositories to be defined, one per entity. Such a repository will, for its specified type, provide methods to:

-   Create a new transient instance

-   Create a new persisted instance

-   Find all persisted instances

-   Find instances with a specified title

To register such a service prefix the class name with the prefix `repository#`.

For example:

    isis.services = repository#dom.Booking

Over time, you should expect most if not all of these generic
repositories will be replaced with regular repository types <!--(see ?)-->.

