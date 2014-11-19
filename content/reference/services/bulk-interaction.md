Title: Bulk Interaction

The `Bulk.InteractionContext` domain service is a [request-scoped](../../more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html) service intended to support the implementation of [@Bulk](../recognized-annotations/Bulk.html) actions.  That is, when a bulk action is invoked over a collection of objects, each object instance "knows where it is" in the collection.  In essence, the `Bulk.InteractionContext` service acts a little like an iterator.

### API

The API defined by the service is:

    @RequestScoped
    public static class InteractionContext {

        public static enum InvokedAs { BULK, REGULAR }
        
        public InvokedAs getInvokedAs() { ... }

        public List<Object> getDomainObjects() { ... }
        public int getSize() { ... }
        public int getIndex() { ... }
        public boolean isFirst() { ... }
        public boolean isLast() { ... }
    }

where:

* `getInvokedAs()` tells the domain object whether this particular action invocation is being performed as a
  bulk action (against each domain object in a list of domain objects) or merely as a regular action (against 
  a single domain object).
* `getDomainObjects())` returns the list of domain objects which are being acted upon
* `getIndex()` is the 0-based index to the object being acted upon.

### Usage

For bulk actions that are void or that return null, Isis will return to the list once executed.  But for bulk 
actions that are non-void, Isis will render the returned object/value from the last object invoked (and simply 
discards the object/value of all actions except the last).

One idiom is for the domain objects to also use the [Scratchpad](./scratchpad.html) service to share information,
for example to aggregate values.  The `Bulk.InteractionContext#isLast()` method can then be used to determine if
all the information has been gathered, and then do something with it (eg derive variance across a range of values, 
render a graph etc).

More prosaically, the `Bulk.InteractionContext` can be used to ensure that the bulk action behaves appropriately
depending on whether it is called in bulk mode or regular mode.  Here's a snippet of code from the bulk action in 
the [quickstart app](../../intro/getting-started/quickstart-archetype.html):

    @Bulk
    public ToDoItem completed() {
        setComplete(true);
        ...        

        // if invoked as a regular action, return this object;
        // otherwise (if invoked as bulk), return null (so go back to the list)
        return bulkInteractionContext.getInvokedAs() == InvokedAs.REGULAR? this: null;
    }


### Registering the Service

The `Bulk.InteractionContext` class is automatically registered (it is annotated with `@DomainService`) so no further configuration is required.


### Unit testing support

The `Bulk.InteractionContext` class also has a couple of static factory 
methods intended to support unit testing:

    public static InteractionContext regularAction(Object domainObject) {
        return new InteractionContext(InvokedAs.REGULAR, Collections.singletonList(domainObject));
    }
        
    public static InteractionContext bulkAction(Object... domainObjects) {
        return bulkAction(Arrays.asList(domainObjects));
    }

    public static InteractionContext bulkAction(List<Object> domainObjects) {
        return new InteractionContext(InvokedAs.BULK, domainObjects);
    }

