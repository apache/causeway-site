How to add an action (or bulk action) to a domain entity or service
---------------------------------------------------------

An 'action' is a method that we expect the user to be able to invoke on
a domain entity via the user interface, though it may also be invoked
programmatically within the object model. The following conventions are
used to determine when and how methods are made available to the user as
actions, and the means by which a user can interact with those actions

By default, any `public` instance method that you add to a class will be
treated as a user action, unless it represents a property, collection,
or another reserved method defined in this guide.

The syntax is:

    public void actionName([ValueOrEntityType param] ...)

or

    public ReturnType actionName([ValueOrEntityType param] ...)

When a method returns a reference the viewer will attempt to display
that object. If the return value is `null` then nothing is displayed.

We refer to all methods that are intended to be invoked by users as
'action methods'.

If you have a method that you don't want to be made available as a
user-action you can either:

-   make it non-`public` (eg `protected` or `private`)

-   annotate it with @Ignore

-   annotate it with @Hidden (discussed further in ?)

Note also that `static` methods are ignored: such functionality should
reside in a service, such as a repository or factory (see ?).

If the action is a bulk action - meaning that it should only be applied
to a collection of instances of the entity - then annotate using @Bulk:

    @Bulk
    public void actionName() { ... }

Note that bulk actions have a couple of important restrictions.

-   entity actions cannot take any arguments, while contributed actions
    can take only a single parameter (the contributee)

    This restriction might be lifted in the future;

-   any business rules for hiding, disabling or validating the action
    are ignored.

See ? for more details on writing business rules.

At the time of writing, only the Wicket viewer recognizes bulk actions;
other viewers treat the action as a regular action.

