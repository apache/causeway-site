@AutoComplete
-------------

> **Support**
> 
> * Supported by: Wicket viewer; not yet supported by other viewers.

This annotation is to support an auto-complete capability for reference
properties and action parameters, the idea being that the user enters a
few characters to locate a reference, and these are shown - for example
- in a drop-down list box.

The annotation is specified on the type, and specifies an action on a
repository; this action should take a single string and should return a
list of the type.

For example:

    @AutoComplete(repository=Customers.class, action="autoComplete")
    public class Customer extends AbstractDomainObject {
       ....
    }

where:

    public interface Customers {

        @Hidden
        List<Customer> autoComplete(String search);
        ...
    }

