Title: @Paged

> **Support**
> 
> * Supported by: Wicket viewer; not yet supported by other viewers.

This annotation is used to indicate that parented and/or standalone
collections should be paginated.

When annotated on a collection, `@Paged` indicates the page size of a
parented collection. When annotated on a type, `@Paged` indicates the page
size of a standalone collection.

For example:

    @Paged(30)
    public class Order {

        @Paged(15)
        public List<LineItem> getDetails() {...}
    }

This indicates a page size of 15 for parented collections, and a page
size of 30 for standalone collections.

When omitting a parameter value or omitting the annotation completely,
the configured defaults in `isis.properties` will be used.

For example:

    isis.viewers.paged.standalone=20
    isis.viewers.paged.parented=5

This indicates a page size of 5 for parented collections and a page size
of 20 for standalone collections.
