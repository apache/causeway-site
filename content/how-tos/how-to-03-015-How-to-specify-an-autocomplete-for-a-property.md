How to specify an auto-complete for a property
----------------------------------------------

Using the auto-complete method you can allow the user to search for objects based on a single string.  These will be made available to the user through a device such as a drop-down list.

The syntax for properties is:

    public List<ParameterType> autoCompletePropertyName()

For example:

    public class Customer {
        public Product getFavouriteProduct() { ... }
        public List<Product> autoCompleteFavouriteProduct(String search) {
            return productsRepo.findMatching(search);
        }
        ....
    }

> The [@AutoComplete](../reference/recognized-annotations/AutoComplete.html) also allows autocomplete functionality to be associated with the domain type (eg `Product` in the example above).  If both are present, then the per-property autocomplete takes preference.

 