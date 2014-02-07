Title: Bulk Interaction [1.4.0-SNAPSHOT]

> this is a stub, see [ISIS-655](https://issues.apache.org/jira/browse/ISIS-655)

### API


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



        /**
         * Whether this particular {@link InteractionContext} was applied as a {@link InvokedAs#BULK bulk} action 
         * (against each domain object in a list of domain objects) or as a {@link InvokedAs#REGULAR regular} 
         * action (against a single domain object).
         */
        @Programmatic


        /**
         * The list of domain objects which are being acted upon.
         */


        /**
         * The 0-based index to the object being acted upon.
         * 
         * <p>
         * Will be a value in range [0, {@link #getSize() size}).
         */

### Usage


### Implementation


### Registering the Service


### Related Services




### Unit testing support


    @RequestScoped
    public static class InteractionContext {

        
        /**
         * Intended only to support unit testing.
         */
        public static InteractionContext regularAction(Object domainObject) {
            return new InteractionContext(InvokedAs.REGULAR, Collections.singletonList(domainObject));
        }
        
        /**
         * Intended only to support unit testing.
         */
        public static InteractionContext bulkAction(Object... domainObjects) {
            return bulkAction(Arrays.asList(domainObjects));
        }

        /**
         * Intended only to support unit testing.
         */
        public static InteractionContext bulkAction(List<Object> domainObjects) {
            return new InteractionContext(InvokedAs.BULK, domainObjects);
        }

    }