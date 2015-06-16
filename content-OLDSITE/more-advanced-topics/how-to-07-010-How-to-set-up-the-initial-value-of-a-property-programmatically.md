How to set up the initial value of a property programmatically
--------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

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


An alternative to using the `defaultXxx()` supporting methods is to use the `created()` callback.  This is sometimes preferable because it centralizes all the default logic into a single location.

For example:

    public class Customer {

        public void created() {
            setRegistered(clockService.now());
        }

        private LocalDate registered;
        public LocalDate getRegistered() { ... }
        public void setRegistered(LocalDate registered) { ... }
        ...
    }

For more details of callbacks, see [How to hook into the object lifecycle using callbacks](../reference/object-lifecycle-callbacks.html). 

### Programmatically, by the creator

Third, and perhaps most obviously, the creator of the object could
initialize the properties of the object immediately after calling
`newTransientInstance(...)`. This would be appropriate if the creator had
reason to override any values set up in the `defaultXxx()` or `created()`
methods discussed above.

