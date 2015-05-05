Title: @Render

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@CollectionLayout#render()](./CollectionLayout.html)

The `@Render` annotation is a hint for properties and collections to
indicate that a value property should be rendered lazily (rather than
eagerly, as usual), or that a reference property or collection should be
rendered eagerly (rather than lazily, as usual).

Viewers can use this to present the property/collection in an
appropriate manner:

-   an `Order`'s `lineItems` collection might initially be rendered expanded
    form so that the user could see a list of line items immediately
    when the order is rendered. This is the most common use case.

-   a (reference) property of type `Address` might show the details of the
    referenced `Address` in a box

At the same time, an object store might use this to defer lazy loading
of values that represent blobs or clobs.

For example:

    public class Order {
        @Render(Type.EAGERLY)
        public List<LineItem> getDetails() { ... }

        ...
    }

For properties and collections there is some similarity between this
concept and that of eager-loading as supported by some object stores.
Indeed, some object stores may choose use their own specific annotations
(eg a JDO default fetch group) in order to infer this semantic.
