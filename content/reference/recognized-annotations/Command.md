Title: @Command

The `@Command` annotation lets you change the way in which the framework invokes an action, most notably to invoke the action in the background.  It works (and influences the behaviour of) the the `CommandContext`, `CommandService`, `BackgroundService` and `BackgroundCommandService` domain services (documented [here](../../../core/services/command-context.html) and [here](../../../core/services/background-service.html)). 

By default, actions are invoked in directly in the thread of the invocation.

If the `CommandContext` service is configured, then this action invocation is reified into a `Command` object, capturing details of the target object, the action, the parameter arguments, the user, a timestamp and so on. 

If an appropriate `CommandService` service is configured (for example the [CommandServiceJdo](../../../components/objectstores/jdo/command-service-jdo.html) JDO implementation), then the `Command` itself is persisted.

If the `BackgroundService` is configured, then commands can be invoked by means of a separate background process.  If an appropriate `BackgroundCommandService` service is configured (for example, the [BackgroundCommandServiceJdo](../../../components/objectstores/jdo/background-command-service-jdo.html) JDO implementation), then the background command is persisted.

The `@Command` annotation can be annotated on action methods, to influence this behaviour:

    public class Order {

        @Command(
            executeIn=ExecuteIn.FOREGROUND, 
            persistence=Persistence.PERSISTED)
        public Invoice generateInvoice(...) { ... }

    }

or alternatively just:

    public class Order {

        @Command
        public Invoice generateInvoice(...) { ... }

    }

corresponds to the behaviour described above; the `Command` object is persisted (assuming an appropriate `CommandService` is defined, and executed immediately in the foreground).

As a variation:
 
    public class Order {

        @Command(
            executeIn=ExecuteIn.FOREGROUND, 
            persistence=Persistence.IF_HINTED)
        public Invoice generateInvoice(...) { ... }

    }

will suppress the persistence of the `Command` object *unless* a child background `Command` has been created in the body of the action by way of the `BackgroundService`.

Next:

    public class Order {

        @Command(
            executeIn=ExecuteIn.FOREGROUND, 
            persistence=Persistence.NOT_PERSISTED)
        public Invoice generateInvoice(...) { ... }

    }

will prevent the parent `Command` object from being persisted, *even if* a child background `Command` is created.


Turning to the `executeIn` attribute:

    public class Order {

        @Command(
            executeIn=ExecuteIn.BACKGROUND)
        public Invoice generateInvoice(...) { ... }

    }

will result in the `Command` being persisted but its execution deferred to a background execution mechanism.  The returned object from this action is the persisted `Command` itself.

