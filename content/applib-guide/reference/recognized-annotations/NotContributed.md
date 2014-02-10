Title: @NotContributed

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
service menu <!--(see ?)-->, then you could instead simply mark it as `@Hidden`
<!--(see ?)-->.
