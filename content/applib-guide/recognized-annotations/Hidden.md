@Hidden
-------

> **Support**
> 
> * Fully supported by: Wicket viewer; other viewers do not yet support the `where` attribute.

The `@Hidden` annotation indicates that the member (property, collection
or action) to which it is applied should never be visible to the user.
It can also be applied to service types (it has no effect if applied to
entities or values).

For example:

    public class Customer {
        @Hidden
        public int getInternalId() { ... }

        @Hidden
        public void updateStatus() { ... }
        ...
    }

Or, applied to a service:

    @Hidden
    public class EmailService {
        public void sendEmail(...) { ... }
        ...
    }

This annotation can also take a parameters indicating where and when it
is to be hidden. For example:

    public class Customer {
        @Hidden(when=When.ONCE_PERSISTED)
        public int getInternalId() { ... }
        ...
    }

would show the `Id` until the object has been saved, and then would hide
it. And:

    public class Customer {
        @Hidden(where=Where.ALL_TABLES)
        public int getDateOfBirth() { ... }
        ...
    }

would suppress the `dateOfBirth` property of a Customer from all tables.

The acceptable values for the `where` parameter are:

-   `Where.ANYWHERE`

    The member should be hidden everywhere.

-   `Where.OBJECT_FORMS`

    The member should be hidden when displayed within an object form.
    For most viewers, this applies to property and collection members,
    not actions.

-   `Where.PARENTED_TABLES`

    The member should be hidden when displayed as a column of a table
    within a parent object's collection. For most (all?) viewers, this
    will have meaning only if applied to a property member.

-   `Where.STANDALONE_TABLES`

    The member should be hidden when displayed as a column of a table
    showing a standalone list of objects, for example as returned by a
    repository query. For most (all?) viewers, this will have meaning
    only if applied to a property member.

-   `Where.ALL_TABLES`

    The member should be /hidden when displayed as a column of a table,
    either an object's \* collection or a standalone list. This combines
    `PARENTED_TABLES` and `STANDALONE_TABLES`.

-   `Where.NOWHERE`

    Acts as an override if a member would normally be hidden as a result
    of some other convention. For example, if a property is annotated
    with `@Title` <!--(see ?)-->, then normally this should be hidden from all
    tables. Additionally annotating with `@Hidden(where=Where.NOWHERE)`
    overrides this.

The acceptable values for the `when` parameter are:

-   `When.ALWAYS`

    The member should be hidden at all times.

-   `When.NEVER`

    The member should never be hidden (unless disabled through some
    other mechanism, for example an imperative disableXxx() supporting
    method)..

-   `When.ONCE_PERSISTED`

    The member should be visible for transient objects, but hidden for
    persisted objects.

-   `When.UNTIL_PERSISTED`

    The member should be hidden for transient objects, but visible for
    persisted objects.

By default the annotated property or action is always hidden (ie
defaults to `Where.ANYWHERE`, `When.ALWAYS`).

