Title: BackgroundCommandExecution

The `BackgroundCommandExecution` class (a subclass of [AbstractIsisSessionTemplate](./isis-session-template.html) is intended to simplify the execution of background `Command`s persisted by way of the [CommandService](../services/command-context.html) and the [BackgroundCommandService)(../services/background-service.html).  Its signature is:

    public abstract class BackgroundCommandExecution extends AbstractIsisSessionTemplate {
        protected void doExecute(Object context) { ... }
        protected abstract List<? extends Command> findBackgroundCommandsToExecute();
    }

where:

* `findBackgroundCommandsToExecute()` is a mandatory hook method for subclasses to implement.

This allows for different implementations of the `CommandService` and `BackgroundCommandService` to persist to wherever.

The diagram below shows the dependencies between these various classes:

![](http://yuml.me/25343da1)


## Related Classes

The JDO object store provides its own (concrete) subclass, [BackgroundCommandExecutionFromBackgroundCommandServiceJdo](../../components/objectstores/jdo/non-ui/background-command-execution-jdo.html) that queries for persisted `Command`s (created either through [CommandServiceJdo](../../components/objectstores/jdo/services/command-service-jdo.html) or through [BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html)), using the corresponding repository.


#### neat!
The diagram on this page were created using [yuml.me](http://yuml.me). 

DSL ([edit](http://yuml.me/edit/25343da1)):

    [AbstractIsisSessionTemplate|#doExecute()]^-[BackgroundCommandExecution|#findBackgroundCommandsToExecute()]
    [BackgroundCommandExecution]->injected[BookmarkService|lookup()]
    [BackgroundCommandExecution]->injected[CommandContext|setCommand()]
