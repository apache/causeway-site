How to specify a set of choices for a property
----------------------------------------------

The simplest way to provide the user with a set of choices for a
property (possibly rendered as a drop-down list, for example) is to
ensure that the type used by the property is marked up as `@Bounded`
<!--(see ?)-->.

However, this is not always appropriate. For example you might wish to
provide the user with the choice of all the Addresses known for that
Customer, with the most recently-used address as the default.

The syntax for specifying a list of choices is either:

    public Collection<PropertyType> choicesPropertyName()

or alternatively

    public PropertyType[] choicesPropertyName()

where `PropertyType` is the same type as that of the property itself.

For example:

    public class Order {
        public Address getShippingAddress() { ... }
        public void setShippingAddress() { ... }
        public List<Address> choicesShippingAddress() {
            return getCustomer().allActiveAddresses();
        }
        ...
    }

