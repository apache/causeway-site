Title: @NotInServiceMenu

The `@NotInServiceMenu` annotation applies only to action methods, and
specifically to the actions of services. If present, it indicates that
the action should not appear in the service menu for the service. It
may, however, still be contributed to any of its domain object
arguments.

For example:

    public class OrderServices {
        @NotInServiceMenu
        public void cancel(Order order);
        ...
    }

If the action should neither be contributed (see ?) nor appear in the
service's service menu, then you could instead simply mark it as `@Hidden`
<!--(see ?)-->.
