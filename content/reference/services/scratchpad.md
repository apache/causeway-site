Title: Scratchpad

[//]: # (content copied to _user-guide_xxx)

The `Scratchpad` service is a [request-scoped](../../more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html) service to allow objects to exchange information even if they do not directly call each other.

### API & Implementation

The API of `Scratchpad` service is:

    @RequestScoped
    public class Scratchpad {
        public Object get(Object key) { ... }
        public void put(Object key, Object value) { ... }
        public void clear() { ... }
    }

... as you can see, just a wrapper around a `java.util.Map`.

In fact, this is a concrete class:

* `org.apache.isis.applib.services.scratchpad.Scratchpad`

### Usage

The most common use-case is for [Bulk](../recognized-annotations/Bulk.html) actions that [act upon multiple objects in a list](../../more-advanced-topics/how-to-01-065-How-to-add-an-action-to-be-called-on-every-object-in-a-list.html).  The (same) `Scratchpad` service is injected into each of these objects, and they can use pass information.

For example, the Isis addons example [todoapp](https://github.com/isisaddons/isis-app-todoapp/) (not ASF) demonstrates how the `Scratchpad` service can be used to calculate the total cost of the selected `ToDoItem`s:

    @ActionSemantics(Of.SAFE)
    @Bulk(AppliesTo.BULK_ONLY)
    public BigDecimal totalCost() {
        BigDecimal total = (BigDecimal) scratchpad.get("runningTotal");
        if(getCost() != null) {
            total = total != null ? total.add(getCost()) : getCost();
            scratchpad.put("runningTotal", total);
        }
        return total.setScale(2);
    }

    private Scratchpad scratchpad;
    public void injectScratchpad(Scratchpad scratchpad) {
        this.scratchpad = scratchpad;
    }

A more complex example could use a [view model](../../more-advanced-topics/ViewModel.html) to enable bulk updates to a set of objects.  The view model's job is to keep track of the items to be updated:

    public class ToDoItemUpdateBulkUpdate extends AbstractViewModel { 
        ...
        private List<ToDoItem> items = ...;
        public void add(ToDoItem item) {
            _items.add(item);
        }
        ...
    }

The bulk action in the objects simply adds the selected item to the view model:

    @ActionSemantics(Of.SAFE)
    @Bulk(AppliesTo.BULK_ONLY)
    public ToDoItemBulkUpdate bulkUpdate() {
        ToDoItemBulkUpdate bulkUpdate = lookupBulkUpdateViewModel() 
        bulkUpdate.add(this);
        return bulkUpdate;
    }
    private ToDoItemBulkUpdate lookupBulkUpdateViewModel() {
        ToDoItemBulkUpdate bulkUpdate = 
            (ToDoItemBulkUpdate) scratchpad.get("bulkUpdateViewModel");
        if(bulkUpdate == null) {
            bulkUpdate = container.newViewModel<ToDoItemBulkUpdate>(new UUID().toString);
            scratchpad.put("bulkUpdateViewModel", bulkUpdate);
        }
        return bulkUpdate;
    }
    private Scratchpad scratchpad;
    public void injectScratchpad(Scratchpad scratchpad) {
        this.scratchpad = scratchpad;
    }
 
If using the Wicket viewer, the `ToDoItemBulkUpdate` view model returned from the last action invoked will be displayed.  Thereafter this view model can be used to perform a bulk update of the "enlisted" items.


### Registering the Service

The `Scratchpad` class is automatically registered (it is annotated with `@DomainService`) so no further configuration is required.


### Related Services

The [Bulk.Interaction](./bulk-interaction.html) service allows [@Bulk](../recognized-annotations/Bulk.html) actions to co-ordinate with each other.

The [QueryResultsCache](./query-results-cache.html) is useful for caching the results of expensive method calls.

