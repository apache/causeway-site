Title: @Disabled

> Deprecated, use instead [@Property#editing()](./Property.html), [@Collection#editing()](./Collection.html), and also [@DomainObject#editing()](./DomainObject.html)

> **Support**
> 
> * Fully supported by: Wicket viewer; other viewers do not yet support the `where` attribute.

The `@Disabled` annotation means that the member cannot be used in any
instance of the class. When applied to the property it means that the
user may not modify the value of that property (though it may still be
modified programmatically). When applied to an action method, it means
that the user cannot invoke that method.

For example:

    public class Customer {
        @Disabled
        public void assessCreditWorthiness() { ... }

        @Disabled
        public int getInitialCreditRating(){ ... }
        public void setInitialCreditRating(int initialCreditRating) { ... }
    }

Note that if an action is marked as `@Disabled`, it will be shown on the
user interface but cannot ever be invoked. The only possible reason we
can think to do this is during prototyping, to indicate an action that
is still to be developed. If a method is intended for programmatic use,
but not intended ever to be invoked directly by a user, then it should
be marked as `@Hidden` instead.

This annotation can also take two parameter indicating where (in the UI)
it is to be disabled, and when (in the object's lifecycle) it is to be
disabled. For example:

    public class Customer {
        (when=When.UNTIL_PERSISTED)
        public void assessCreditWorthiness() { ... }
    }

would disable the action until the object has been saved. And:

    public class Customer {
        (where=Where.PARENTED_TABLES)
        public void getFirstName() { ... }
    }

would disable the property in parented tables but not in regular object
forms (though note: this would only be used by viewers that provide
in-table editing capability).

The acceptable values for the `where` parameter are:

-   `Where.ANYWHERE`

    The member should be disabled everywhere.

-   `Where.OBJECT_FORMS`

    The member should be disabled when displayed within an object form.
    For most viewers, this applies to property and collection members,
    not actions.

-   `Where.PARENTED_TABLES`

    The member should be disabled when displayed as a column of a table
    within a parent object's collection. For most (all?) viewers, this
    will have meaning only if applied to a property member.

-   `Where.STANDALONE_TABLES`

    The member should be disabled when displayed as a column of a table
    showing a standalone list of objects, for example as returned by a
    repository query. For most (all?) viewers, this will have meaning
    only if applied to a property member.

-   `Where.ALL_TABLES`

    The member should be disabled when displayed as a column of a table,
    either an object's \* collection or a standalone list. This combines
    `PARENTED_TABLES` and `STANDALONE_TABLES`

-   `Where.NOWHERE`

    Has no meaning for the `@Disabled` annotation (though is used by the
    `@Hidden` annotation which also uses the `Where` enum<!--, see ?-->).

The acceptable values for the `when` parameter are:

-   `When.ALWAYS`

    The member should be disabled at all times.

-   `When.NEVER`

    The member should never be disabled (unless disabled through some
    other mechanism, for example an imperative disableXxx() supporting
    method)..

-   `When.ONCE_PERSISTED`

    The member should be enabled for transient objects, but disabled for
    persisted objects.

-   `When.UNTIL_PERSISTED`

    The member should be disabled for transient objects, but enabled for
    persisted objects.

By default the annotated property or action is always disabled (ie
defaults to `Where.ANYWHERE`, `When.ALWAYS`).

