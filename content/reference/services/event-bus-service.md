Title: Event Bus Service

The `EventBusService` is a wrapper for a [Guava](https://code.google.com/p/guava-libraries/) [`EventBus`](https://code.google.com/p/guava-libraries/wiki/EventBusExplained), allowing arbitrary events to be posted and subscribed to (within the Isis runtime).  The primary use case is for decoupling interactions from one module/package/namespace and another.

Only domain services should be registered as subscribers; not domain entities.  Domain services are guaranteed to be instantiated and resident in memory, whereas the same is not true of domain entities.  

The typical implementation of a domain service subscriber is to identify the impacted entities, load them using a repository query, and then to delegate to the event to them.

## API

The API defined by `EventBusService` is:

    public abstract class EventBusService {
        public void register(Object domainObject) { ... }
        public void unregister(Object domainObject) { ... }
        public void post(Object event) { ... }
    }

where

* `register(Object)` registers the object with the event bus (it is simply a wrapper that delegates to `EventBus#register(Object)`)
* `unregister(Object)` unregisters the object with the event bus (it is simply a wrapper that delegates to `EventBus#unregister(Object)`)
* `post(Object)` posts the event onto event bus (it is simply a wrapper that delegates to `EventBus#post(Object)`)

## Usage

The actual subscription of events is done by annotating a method on the class (that is, the usual Guava programming model).  

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

### Self Registration

A good practice for domain services is to self-register when the `EventBusService` is injected into it:

    private EventBusService eventBusService;
    public void injectEventBusService(final EventBusService eventBusService) {
        this.eventBusService = eventBusService;
        eventBusService.register(this);
    }

    
### `@PostsPropertyChangedEvent`

Isis will also automatically publish (post) an `org.apache.isis.applib.services.eventbus.PropertyChangedEvent` event object on any property that is annotated with [`@PostsPropertyChangedEvent](../recognized-annotations/PostsPropertyChangedEvent.html).  This can remove some boilerplate.

<blockquote>
<p>A couple of notes:
<ul>
<li>The @PropertyChangeEvent is only raised for interactions through the UI, or through interactions through a wrapper created by the <a href="wrapper-factory.html">Wrapper Factory</a> service.</li>
<li>This is work-in-progress.  In the future other interactions (such as action invocations, or collection add to/remove) may also be raised automatically.</li>
</ul>
</blockquote>
    
## Implementation

Isis provides two implementations.  The default implementation (provided by core runtime) is:

    org.apache.isis.core.runtime.services.eventbus.EventBusServiceDefault

However, if the JDO objectstore is in use, then its implementation *must* be used instead:

    org.apache.isis.objectstore.jdo.datanucleus.service.eventbus.EventBusServiceJdo

## Register the Service

Register this service like any other service, in `isis.properties`

If the JDO Objectstore is *not* in use, use:

    isis.services=...,\
                  org.apache.isis.core.runtime.services.eventbus.EventBusServiceDefault,\
                  ...

If the JDO ObjectStore *is* in use, use:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.datanucleus.service.eventbus.EventBusServiceJdo,\
                  ...

## Related Services

The `EventBusService` is intended for fine-grained publish/subscribe for object-to-object interactions within an Isis domain object model.  The event propogation is strictly in-memory, and there are no restrictions on the object acting as the event (it need not be serializable, for example).

The [PublishingService](publishing-service.html) meanwhile is intended for coarse-grained publish/subscribe for system-to-system interactions, from Isis to some other system.  Here the only events published are those that action invocations (for actions annotated with [`@PublishedAction`](../recognized-annotations/PublishedAction.html)) and of changed objects (for objects annotated with [`@PublishedObject`](../recognized-annotations/PublishedObject.html).


