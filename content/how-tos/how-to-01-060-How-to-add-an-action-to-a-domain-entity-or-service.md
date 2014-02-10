How to add an action to a domain entity or service
--------------------------------------------------

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

-   annotate it with `@Ignore`

-   annotate it with `@Hidden`

Note also that `static` methods are ignored: such functionality should
reside instead as instance methods on a domain service, repository or factory.
