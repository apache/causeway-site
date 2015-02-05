Title: @CollectionInteraction

> Deprecated, use instead [@Collection#domainEvent()](./Collection.html).

> Support
>
> The Wicket viewer does NOT support collection modification; instead write a pair of actions to add to/remove from the collection.
>
> It *is* possible to fire collection interaction events using the wrapper factory; see below for more details.

The `@CollectionInteraction` annotation applies to domain entity collections, allowing
subscribers to optionally veto, validate or otherwise perform tasks before 
or after the collection has been added to/removed from.

Subscribers subscribe through the [Event Bus Service](../services/event-bus-service.html) using Guava annotations.

By default the event raised is `CollectionInteractionEvent.Default`.  For example:

    public class ToDoItem {
        ...     
        @CollectionInteraction
        public SortedSet<ToDoItem> getDependencies() { ... }
    }

Optionally a subclass can be declared:

    public class ToDoItem {
    
        public static class DependenciesChangedEvent extends CollectionInteractionEvent<ToDoItem, ToDoItem> {
            private static final long serialVersionUID = 1L;
            public DependenciesChangedEvent(ToDoItem source, Identifier identifier, Of of, ToDoItem value) {
                super(source, identifier, of, value);
            }
        }
        
    }

The `of` field indicates if the collection is being accessed, added to or removed from.


## Subscribers

Subscribers (which must be domain services) subscribe using the Guava API.  
Subscribers can be either coarse-grained (if they subscribe to the top-level event type):

    @DomainService
    public class SomeSubscriber {

        @Programmatic
        @com.google.common.eventbus.Subscribe
        public void on(CollectionInteractionEvent ev) {
        
            ...
        }
        
    }
    
or can be fine-grained by subscribing to specific event subtypes:

    @DomainService
    public class SomeSubscriber {

        @Programmatic
        @com.google.common.eventbus.Subscribe
        public void on(ToDoItem.DependenciesChangedEvent ev) {
        
            ...
        }
        
    }

The subscriber's method is called (up to) 5 times:

* whether to veto visibility (hide)
* whether to veto usability (disable)
* whether to veto execution (validate)
* steps to perform prior to the property being modified
* steps to perform after the property has been modified.

The subscriber can distinguish these by calling `ev.getPhase()`.  Thus the general form is:

        @Programmatic
        @com.google.common.eventbus.Subscribe
        public void on(CollectionInteractionEvent ev) {
        
        switch(ev.getPhase()) {
            case HIDE:
                ...
                break;
            case DISABLE:
                ...
                break;
            case VALIDATE:
                ...
                break;
            case EXECUTING:
                ...
                break;
            case EXECUTED:
                ...
                break;
        }
    }

Vetoing is performed by calling the appropriate method on the event:

* To hide:

    ev.hide()
    
* To disable:

    ev.disable("...");

* To invalidate:

    ev.invalidate("...");

It is also possible to abort the transaction during the executing or executed
phases by throwing an exception.  If the exception is a subtype of `RecoverableException` 
then the exception will be rendered as a user-friendly warning (eg Growl/toast)
rather than an error.

    
## Raising events programmatically.

Normally events are only raised for interactions through the UI.  However, events can be raised programmatically by
wrapping the target object using the [Wrapper Factory](../services/wrapper-factory.html) service.


## See also

Interaction events can also be raised for [actions](./ActionInteraction.html) and [properties](./PropertyInteraction.html) .


