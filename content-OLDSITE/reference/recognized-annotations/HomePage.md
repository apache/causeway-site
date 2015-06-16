Title: @HomePage

[//]: # (content copied to _user-guide_xxx)

> Support
>
> Currently only by the Wicket viewer

The `@HomePage` annotation should be applied to a single (no-arg) action on a domain service, and the results used as the contents for the home page.

Typically this action would return a [View Model](../../more-advanced-topics/ViewModel.html) representing a dashboard from which the user can navigate to commonly used objects and invoked actions.  But it could also simply invoke an action that returns an entity (eg representing the currently logged-on user) or a list of objects.
