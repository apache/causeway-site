Title: @ActionInteraction

[//]: # (content copied to _user-guide_xxx)

> Deprecated, use instead [@Action#domainEvent()](./Action.html).

The `@ActionInteraction` annotation applies to domain entity actions, allowing
subscribers to optionally veto, validate or otherwise perform tasks before 
or after the action has been invoked.

Subscribers subscribe through the [Event Bus Service](../services/event-bus-service.html) using Guava annotations.

By default the event raised is `ActionInteractionEvent.Default`.  For example:

    public class ToDoItem {
        ...     
        @ActionInteraction
        public ToDoItem completed() { ... }
    }

Optionally a subclass can be declared:

    public class ToDoItem {
    
        public static class CompletedEvent extends AbstractActionInteractionEvent {
            private static final long serialVersionUID = 1L;
            public CompletedEvent(
                    final ToDoItem source, 
                    final Identifier identifier, 
                    final Object... arguments) {
                super("completed", source, identifier, arguments);
            }
        }
        
        @ActionInteraction(CompletedEvent.class)
        public ToDoItem completed() { ... }
        
    }


## Subscribers

Subscribers (which must be domain services) subscribe using the Guava API.  
Subscribers can be either coarse-grained (if they subscribe to the top-level event type):

    @DomainService
    public class SomeSubscriber {

        @Programmatic
        @com.google.common.eventbus.Subscribe
        public void on(ActionInteractionEvent ev) {
        
            ...
        }
        
    }
    
or can be fine-grained by subscribing to specific event subtypes:

    @DomainService
    public class SomeSubscriber {

        @Programmatic
        @com.google.common.eventbus.Subscribe
        public void on(ToDoItem.CompletedEvent ev) {
        
            ...
        }
        
    }

The subscriber's method is called (up to) 5 times:

* whether to veto visibility (hide)
* whether to veto usability (disable)
* whether to veto execution (validate)
* steps to perform prior to the action being invoked.
* steps to perform after the action has been invoked.

The subscriber can distinguish these by calling `ev.getPhase()`.  Thus the general form is:

    @Programmatic
    @com.google.common.eventbus.Subscribe
    public void on(ActionInteractionEvent ev) {
        
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

Interaction events can also be raised for [properties](./PropertyInteraction.html) and [collections](./CollectionInteraction.html).


