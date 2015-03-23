Title: @Action

The `Action` annotation groups together all domain-specific metadata for an invokable action on a domain object or domain service:

* `domainEvent` - specifies the subtype of the `ActionDomainEvent` that should be posted to the [Event Bus service](../services/event-bus-service.htm) to broadcast the action's business rule checking (hide, disable, validate) and its invocation (pre-execute and post-execution).

* `hidden` -  indicates where (in the UI) the action is not visible to the user.

* `semantics` - the action's semantics, either safe (query-only), idempotent or non-idempotent.

* `invokeOn` - whether an action can be invoked on a single object and/or on many objects in a collection.

* `command` - whether the action invocation should be reified into a `org.apache.isis.applib.services.command.Command` object.

* `commandPersistence` - how the reified `Command` (as provided by the `CommandContext` domain service) should be persisted.

* `commandExecuteIn` - how the command/action should be executed: foreground or background.

* `publishing` - whether changes to the object should be published to the registered [publishing service](../publishing-service.html).

* `publishingPayloadFactory` - specifies that a custom implementation of `PublishingPayloadFactoryForAction` be used to create the (payload of the) published event

* `typeOf` - if the action returns a collection, specifies the type of the objects within that collection

* `restrictTo` - whether the action is restricted to prototyping



## Domain events

Every interaction with a domain object action causes multiple events to be fired, in the following phases:

* Hide phase: to check that the action is visible (has not been hidden)

* Disable phase: to check that the action is usable (has not been disabled)

* Validate phase: to check that the action's arguments are valid

* Pre-execute phase: before the invocation of the action

* Post-execute: after the invocation of the action

Subscribers subscribe through the [Event Bus Service](../services/event-bus-service.html) 
using Guava annotations and can influence each of these phases.

By default the event raised is `ActionDomainEvent.Default`.  For example:

    public class ToDoItem {
        ...
        @Action()
        public ToDoItem completed() { ... }
    }

Optionally a subclass can be declared:

    public class ToDoItem {

        public static class CompletedEvent extends AbstractActionDomainEvent {
            private static final long serialVersionUID = 1L;
            public CompletedEvent(
                    final ToDoItem source,
                    final Identifier identifier,
                    final Object... arguments) {
                super("completed", source, identifier, arguments);
            }
        }

        @Action(domainEvent=CompletedEvent.class)
        public ToDoItem completed() { ... }

    }

#### Subscribers

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

The subscriber can distinguish these by calling `ev.getEventPhase()`.  Thus the general form is:

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

    `ev.hide()`

    or

    `ev.veto("")`

* To disable:

    `ev.disable("...");`

    or

    `ev.veto("...");`

* To invalidate:

     `ev.invalidate("...");`

     or

    `ev.veto("...");`

It is also possible to abort the transaction during the executing or executed
phases by throwing an exception.  If the exception is a subtype of `RecoverableException`
then the exception will be rendered as a user-friendly warning (eg Growl/toast)
rather than an error.


#### Raising events programmatically.

Normally events are only raised for interactions through the UI.  However, events can be raised programmatically by
wrapping the target object using the [Wrapper Factory](../services/wrapper-factory.html) service.


#### See also

Domain events can also be raised for [properties](./Property.html) and [collections](./Collection.html).



## Hidden

Actions can be hidden at the domain-level, indicating that they are not visible to the end-user.  For example:

    public class Customer {

        @Action(hidden=EVERYWHERE)
        public void updateStatus() { ... }
        ...
    }

The only value that currently makes sense is `EVERYWHERE` (or its synonym `ANYWHERE`).

#### See also

It is also possible to use `@ActionLayout` or [dynamic layouts](../../components/viewers/wicket/dynamic-layouts.html)
such that the action can be hidden at the view layer.  Both options are provided with a view that in the future the
view-layer semantics may be under the control of (expert) users, whereas domain-layer semantics cannot be overridden
or modified by the user.

For `DomainService` actions, the action's visibility is dependent upon its `DomainService#nature()` and for contributed
actions on how it is `ActionLayout#contributed()`.


## Semantics

This annotation, which applies only to actions, describes whether the
invocation is safe (as no side-effects), is idempotent (may have
side-effects but always has the same postconditions), or is neither safe
nor idempotent. If the annotation is missing then the framework assumes
non-idempotent.

For example:

    public class Customer {
        @Action(semantics=SemanticsOf.SAFE)
        public CreditRating checkCredit() { ... }

        @Action(semantics=SemanticsOf.IDEMPOTENT)
        public void changeOfAddress(Address address) { ... }

        @Action(semantics=SemanticsOf.NON_IDEMPOTENT)
        public Order placeNewOrder() { ... }
        ...
    }

The annotation was introduced for the restfulobjects viewer in order
that action invocations could be made available using either HTTP GET,
PUT or POST (respectively). It is now also used in core runtime's
in-built concurrency checking; the invocation of a safe action does not
perform a concurrency check, whereas non-safe actions do perform a
concurrency check.


## Invoke On

Indicates whether the an action can be invoked on a single object (the default) and/or on many objects in a collection.

Actions to be invoked on collection (currently) have a number of constraints:

* It must take no arguments
* It cannot be hidden (any annotations or supporting methods to that effect will be  ignored
*It cannot be disabled (any annotations or supporting methods to that effect will be ignored).

This attribute has no meaning if annotated on an action of a domain service.



## Command

Using `@Action(command=...)` allows an action invocation to be made into a concrete object such that it can be
inspected and persisted, for various purposes.  These include enhanced profiling/auditing, as well as being able to
defer the execution of the action and have it be invoked in the background.

The annotation works (and influences the behaviour of) the `CommandContext`, `CommandService`, `BackgroundService` and
`BackgroundCommandService` domain services (documented [here](../../../reference/services/command-context.html) and
[here](../../../reference/services/background-service.html)).

By default, actions are invoked in directly in the thread of the invocation.

If the `CommandContext` service is configured, then this action invocation is reified into a `Command` object,
capturing details of the target object, the action, the parameter arguments, the user, a timestamp and so on.

If an appropriate `CommandService` service is configured (for example the
[CommandServiceJdo](../../../components/objectstores/jdo/services/command-service-jdo.html) JDO implementation), then
the `Command` itself is persisted.

If the `BackgroundService` is configured, then commands can be invoked by means of a separate background process.  If an appropriate `BackgroundCommandService` service is configured (for example, the [BackgroundCommandServiceJdo](../../../components/objectstores/jdo/services/background-command-service-jdo.html) JDO implementation), then the background command is persisted.

### `command()`

The `command()` attribute determines whether the action invocation should be reified into a `Command` object.

The default is `AS_CONFIGURED`, meaning that the configuration property:

    isis.services.command.actions

is used to determine the whether the action is reified:

* `all` - all actions are reified
* `ignoreSafe` (or `ignoreQueryOnly`) - actions with safe (read-only) semantics are ignored, but actions which may modify data are not ignored
* `none` - no actions are reifired.

This default can be overridden on an action-by-action basis; if `command()` is set to `ENABLED` then the action is reified irrespective of the configured value; if set to `DISABLED` then the action is NOT reified irrespective of the configured value.


The `@Action(command=...)` annotation can be annotated on action methods, to influence this behaviour:

    public class Order {

        @Action(
            command=CommandReification.ENABLED,
            commandExecuteIn=CommandExecuteIn.FOREGROUND,
            commandPersistence=CommandPersistence.PERSISTED)
        public Invoice generateInvoice(...) { ... }

    }

or alternatively just:

    public class Order {

        @Action(command=CommandReification.ENABLED)
        public Invoice generateInvoice(...) { ... }

    }

corresponds to the behaviour described above; the `Command` object is persisted (assuming an appropriate `CommandService` is defined, and executed immediately in the foreground).

### `commandPersistence()`

If the action has been reified, then the `commandPersistence()` attribute determines whether that `Command` object
should then also be persisted (the default), or not persisted, or only if hinted.

To explain this last alternative:

    public class Order {

        @Action(
            command=CommandReification.ENABLED,
            commandPersistence=CommandPersistence.IF_HINTED)
        public Invoice generateInvoice(...) { ... }

    }

will suppress the persistence of the `Command` object *unless* a child background `Command` has been created in the body of the action by way of the `BackgroundService`.

Next:

    public class Order {

        @Command(
            command=CommandReification.ENABLED,
            commandExecuteIn=CommandExecuteIn.FOREGROUND,
            commandPersistence=CommandPersistence.NOT_PERSISTED)
        public Invoice generateInvoice(...) { ... }

    }

will prevent the parent `Command` object from being persisted, *even if* a child background `Command` is created.


### `commandExecuteIn()`

For persisted commands, the `commandExecuteIn()` attribute determines whether the `Command` should be executed in the
foreground (the default) or executed in the background.

Background execution means that the command is not executed immediately, but is available for a configured
[background service](../services/background-service.html) to execute, eg by way of an in-memory scheduler such as Quartz.

For example:

    public class Order {

        @Action(
            command=CommandReification.ENABLED,
            commandExecuteIn=CommandExecuteIn.BACKGROUND)
        public Invoice generateInvoice(...) { ... }

    }

will result in the `Command` being persisted but its execution deferred to a background execution mechanism.  The
returned object from this action is the persisted `Command` itself.


## Publishing

Publishing is managed by the `publishing()` and `publishingPayloadFactory()` attributes.

### `publishing()`

Indicates whether the action invocation should be published to the [publishing service](../publishing-service.html).

The default is `AS_CONFIGURED`, meaning that the configuration property:

    isis.services.publish.actions

is used to determine the whether the action is published:

* `all` - all actions are published
* `ignoreSafe` (or `ignoreQueryOnly`) - actions with safe (read-only) semantics are ignored, but actions which may modify data are not ignored
* `none` - no actions are published

This default can be overridden on an action-by-action basis; if `command()` is set to `ENABLED` then the action is reified irrespective of the configured value; if set to `DISABLED` then the action is NOT reified irrespective of the configured value.

### `publishingPayloadFactory()`

The `publishingPayloadFactory()` specifies the class to use to create the (payload of the) event to be published by the publishing factory.
Rather than simply broadcast that the action was invoked, the payload factory allows a "fatter" payload to be isntantiated
that can eagerly push commonly-required information to all subscribers.  For at least some subscribers this should avoid
the necessity to query back for additional information.



## `typeOf()`

Specifies the type-of the elements returned by the action.


## `restrictTo()`

Whether the action is restricted to prototyping.

By default there are no restrictions, with the action being available in all environments.

## See also

Other domain semantics:

* [@Property](./Property.html)
* [@Collection](./Collection.html)
* [@Action](./Action.html)
* [@Parameter](./Parameter.html)
* [@DomainObject](./DomainObject.html)
* [@DomainService](./DomainService.html)
* [@ViewModel](./ViewModel.html)

Corresponding view layer ("Layout") annotation:

* [@ActionLayout](./ActionLayout.html)



