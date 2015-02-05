Title: Event Bus Service

The `EventBusService` is a wrapper for a [Guava](https://code.google.com/p/guava-libraries/) [`EventBus`](https://code.google.com/p/guava-libraries/wiki/EventBusExplained), allowing arbitrary events to be posted and subscribed to (within the Isis runtime).  The primary use case is for decoupling interactions from one module/package/namespace and another.

The framework also provides an implementation of this service (`EventBusServiceJdo`), and this is automatically registered (it is annotated with `@DomainService`).

Domain events are raised automatically whenever any domain object is interacted with.  Domain events can also be raised programmatically if required (though there is rarely any need to do so).

Only domain services should be registered as subscribers; not domain entities.  Domain services are guaranteed to be instantiated and resident in memory, whereas the same is not true of domain entities.

The typical implementation of a domain service subscriber is to identify the impacted entities, load them using a repository query, and then to delegate to the event to them.



## Publishing

### Automatically published events

Domain events are raised automatically whenever an object member (property, collection or action) is interacted with.  Specifically:

* when an object member is to be viewed, an event is fired; subscribers can veto (meaning that the member is hidden)
* when an object member is to be enabled, the same event instance is fired; subscribers can veto (meaning that the member is disabled, ie cannot be edited/invoked)
* when an object member is being validated, then a new event instance is fired; subscribers can veto (meaning that the candidate values/action arguments are rejected)
* when an object member is about to be changed, then the same event instance is fired; subscribers can perform pre-execution operations
* when an object member has been changed, then the same event instance is fired; subscribers can perform post-execution operations

If a subscriber throws an exception in the first three steps, then the interaction is vetoed.  If a subscriber throws an exception in the last two steps, then the transaction is aborted.

The event class that is raised can be specified using an annotation:

* as of 1.8.0-SNAPSHOT, using:

    * `@Property(domainEvent=...)`
    * `@Collection(domainEvent=...)`
    * `@Action(domainEvent=...)`

* as of 1.7.0 (but deprecated in 1.8.0-SNAPSHOT), using :
    * `@PropertyInteraction`
    * `@CollectionInteraction`
    * `@ActionInteraction`

* as of 1.6.0 (but deprecated in 1.8.0-SNAPSHOT), using :
    * `@PostsPropertyChangedEvent`
    * `@PostsCollectionAddedToEvent`/`@PostsCollectionRemovedFromEvent`
    * `@PostsActionInvokedEvent`

For example, in the todo app a custom event is raised when an item is completed:

    public static class CompletedEvent extends AbstractActionDomainEvent {
        private static final long serialVersionUID = 1L;
        public CompletedEvent(
                final ToDoItem source,
                final Identifier identifier,
                final Object... arguments) {
            super("completed", source, identifier, arguments);
        }
    }

     @Action(
             domainEvent =CompletedEvent.class,
             ...
     )
     public ToDoItem completed() { ... }

Subscribers can therefore subscribe to these subclasses, in effect filtering out only the events that are of interest.


### Explicitly publishing events

The publishing API defined by `EventBusService` is:

    public abstract class EventBusService {
        public void post(Object event) { ... }
        ...
    }

where

* `post(Object)` posts the event onto event bus (it is simply a wrapper that delegates to `EventBus#post(Object)`)


## Subscribing

The subscribing API defined by `EventBusService` is:

    public abstract class EventBusService {
        public void post(Object event) { ... }
        ...
    }


where:
* `register(Object)` registers the object with the event bus (it is simply a wrapper that delegates to `EventBus#register(Object)`)
* `unregister(Object)` unregisters the object with the event bus (it is simply a wrapper that delegates to `EventBus#unregister(Object)`)

The are for domain services to call to register themselves with the event bus.  This should be done in the

As of 1.8.0-SNAPSHOT, the `register` and `unregister` methods should be called in the `@PostConstruct` and `@PreDestroy` lifecycle methods:

    @DomainService
    public class MySubscribingDomainService {

        ...

        @Programmatic
        @PostConstruct
        public void postConstruct() {
            eventBusService.register(this);
        }
        @Programmatic
        @PreDestroy
        public void preDestroy() {
            eventBusService.unregister(this);
        }

        @javax.inject.Inject
        private EventBusService eventBusService;
    }

This works for both application-scoped and request-scoped (`@RequestScoped`) domain services.

In 1.7.0, the registration should be done when the `EventBusService` is injected into it:

    @DomainService
    public class MySubscribingDomainService {

        ...

        private EventBusService eventBusService;
        public void injectEventBusService(final EventBusService eventBusService) {
            this.eventBusService = eventBusService;
            eventBusService.register(this);
        }
    }



### Callbacks

The actual callbacks of events is done by annotating a method on the class (that is, the usual Guava programming model).

For example, suppose in a library domain that a `LibraryMember` wants to leave the library.  A letter should be sent out detailing any books that they still have out on loan:

In the `LibraryMember` class, we publish the event:

    public class LibraryMember {
        ...
        public void leave() {
            eventBus.post(new LibraryMemberLeaveEvent(this));
        }
        ...
    }
    
Meanwhile, in the `BookRepository` domain service, we subscribe to the event and act upon it:

    public class BookRepository {

        @com.google.common.eventbus.Subscribe 
        @Programmatic
        public void onLibraryMemberLeaving(LibraryMemberLeaveEvent e) {
            LibraryMember lm = e.getLibraryMember();
            List<Book> lentBooks = findBooksOnLoanFor(lm);
            if(!lentBooks.isEmpty()) {
                sendLetter(lm, lentBooks);
            }
        }
        ...
    }

This design allows the `libraryMember` module to be decoupled from the `book` module.


## Implementation and Registration

Isis provides the `org.apache.isis.objectstore.jdo.datanucleus.service.eventbus.EventBusServiceJdo` as a default implementation of the `EventBusService` API.  The `EventBusServiceJdo` class is automatically registered (it is annotated with `@DomainService`) so no further configuration is required.


## Related Services

The `EventBusService` is intended for fine-grained publish/subscribe for object-to-object interactions within an Isis domain object model.  The event propogation is strictly in-memory, and there are no restrictions on the object acting as the event (it need not be serializable, for example).

The [PublishingService](publishing-service.html) meanwhile is intended for coarse-grained publish/subscribe for system-to-system interactions, from Isis to some other system.  Here the only events published are those that action invocations (for actions annotated with [`@PublishedAction`](../recognized-annotations/PublishedAction.html)) and of changed objects (for objects annotated with [`@PublishedObject`](../recognized-annotations/PublishedObject.html).

