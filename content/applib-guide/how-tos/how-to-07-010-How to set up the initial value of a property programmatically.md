How to set up the initial value of a property programmatically
--------------------------------------------------------------

After an object has been created <!--(see ?)-->, there are several different
ways to setup the initial values for an object's properties.

### By each property's default values

Firstly, the default value for a property can be supplied using a
supporting `defaultXxx()` method. The syntax for specifying a default
value is:

    public PropertyType defaultPropertyName()

where `PropertyType` is the same type as that of the property itself.

    public class Order {
        public Address getShippingAddress() { ... }
        public void setShippingAddress() { ... }
        public Address defaultShippingAddress() {
            return getCustomer().normalAddress();
        }
        ...
    }

### By the created() lifecycle method

Alternatively, the domain object may choose to initialize its property
values in the `created()` lifecycle method <!--(see ?)-->. This is called after
any `defaultXxx()` methods are called.

### Programmatically, by the creator

Third, and perhaps most obviously, the creator of the object could
initialize the properties of the object immediately after calling
`newTransientInstance(...)`. This would be appropriate if the creator had
reason to override any values set up in the `defaultXxx()` or `created()`
methods discussed above.

