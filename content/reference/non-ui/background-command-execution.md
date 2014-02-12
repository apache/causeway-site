Title: BackgroundCommandExecution (1.4.0-snapshot)

The `BackgroundCommandExecution` class (a subclass of [AbstractIsisSessionTemplate](./isis-session-template.html) is intended to simplify the execution of background `Command`s persisted by way of the [CommandService](../services/command-context.html) and the [BackgroundCommandService)(../services/background-service.html).  Its signature is:

    public abstract class BackgroundCommandExecution extends AbstractIsisSessionTemplate {
        protected void doExecute(Object context) { ... }
        protected abstract List<? extends Command> findBackgroundCommandsToExecute();
    }

where:

* `findBackgroundCommandsToExecute()` is a mandatory hook method for subclasses to implement.

This allows for different implementations of the `CommandService` and `BackgroundCommandService` to persist to wherever.  The JDO implementations, [CommandServiceJdo](../../components/objectstores/jdo/services/command-service-jdo.html) and [BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html) persist both as instances of `CommandJdo` entity to the `IsisCommand` database table.

The JDO service also provides its own (concrete) subclass, `BackgroundCommandExecutionFromBackgroundCommandServiceJdo` that queries its corresponding repository:

![](http://yuml.me/e722131c)


##### neat!
The above diagram was created using this [yuml.me](http://yuml.me] DSL [http://yuml.me/edit/e722131c](edit):

    [AbstractIsisSessionTemplate|#doExecute()]^-[BackgroundCommandExecution|#findBackgroundCommandsToExecute()]
    [BackgroundCommandExecution]^-[BackgroundCommandExecutionFromBackgroundCommandServiceJdo]
    [BackgroundCommandExecution]->injected[BookmarkService|lookup()]
    [BackgroundCommandExecution]->injected[CommandContext|setCommand()]
    [BackgroundCommandExecutionFromBackgroundCommandServiceJdo]->injected[BackgroundCommandServiceJdoRepository|findBackgroundCommandsNotYetStarted()]
