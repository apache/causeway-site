Title: @PostsPropertyChangedEvent

> Support
>
> Supported by all viewers (implementation is part of core metamodel)

The `@PostsPropertyChangedEvent` annotation applies to domain entity properties, and will automatically posts instances of the `PropertyChangedEvent` class (in `org.apache.isis.applib.services.eventbus`) to the [Event Bus Service](../services/event-bus-service.html) whenever they are, erm, changed.

For example: 

    public class ToDoItem {
        ...     
        @PostsPropertyChangedEvent
        public LocalDate getDueBy() { ... }
    }

This saves having to manually post an event using `EventBusService#post(...)`.

If the Event Bus Service is not configured, then this is a no-op.

#### Note

Do note however:
* The `@PropertyChangedEvent` is only raised for interactions through the UI, or through interactions through a wrapper created by the [Wrapper Factory](../services/wrapper-factory.html) service.  It is *not* raised through a normal programmatic invocation of the getter method.
* This is work-in-progress.  In the future other interactions (such as action invocations, or collection add to/remove) may also be raised automatically.

