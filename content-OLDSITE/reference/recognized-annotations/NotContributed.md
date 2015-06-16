Title: @NotContributed

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@DomainService#nature()](./DomainService.html) to specify whether a service's actions are contributed, and use [@ActionLayout#contributed()](./ActionLayout.html) to specify how they are contributed.

The `@NotContributed` annotation applies only to action methods, and
specifically to the actions of services. If present, it indicates that
the action should not be contributed to any of its domain object
arguments.

For example:

    public class OrderServices {
        @NotContributed
        public void cancel(Order order);
        ...
    }

If the action should neither be contributed nor appear in the service's
service menu, then you could instead simply mark it as `@Hidden`.


## Contributing of one-arg actions

Actions that accept a single argument will, by default, also be contributed as an association:

* if the action returns a single object (value or entity) then the action will be contributed as a property

* if the action returns a list then the action will be contributed as a collection

This behaviour can be influenced by specifying the "As." attribute:

* use `@NotContributed(As.ACTION)` to contribute the action as an association
* use `@NotContributed(As.ASSOCIATION)` to contribute the action as an action
* use `@NotContributed` to not contribute the action at all.

