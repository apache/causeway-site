Title: Background Command Service (isis-module-command-jdo)

[//]: # (content copied to _user-guide_xxx)

The `BackgroundCommandService` supports the [BackgroundService](./background-service.html), persisting action invocations as commands such that they can subsequently be invoked in the background.
 
The `BackgroundService` is responsible for capturing a memento representing the action invocation, and then hands off to the `BackgroundCommandService` to actually persist it.  The `isis-module-command-jdo` module provides an implementation of `BackgroundCommandService` ([BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html)) that persists to an RBMS entities.

The persisting of commands is only half the story; there needs to be a separate process  to read the commands and execute them.  The abstract [BackgroundCommandExecution](./background-service.html#BackgroundCommandExecution) provides a mechanism to do this; the `isis-module-command-jdo` provides a concrete subclass (`BackgroundCommandExecutionFromBackgroundCommandServiceJdo`) that knows how to query for persisted (background) `Command`s such that they can be executed by a scheduler.


## BackgroundCommandService

The `BackgroundCommandService` typically isn't called from domain classes, but it exists as a domain service so that it is pluggable into `BackgroundService`.


### API

The API of the `BackgroundCommandService` is:

    public interface BackgroundCommandService {
    
        public void schedule(
                final ActionInvocationMemento aim, 
                final Command command, 
                final String targetClassName, final String targetActionName, final String targetArgs);

    }

where `ActionInvocationMemento` is a wrapper around a [MementoService](./memento-service.html)'s `Memento`, capturing the details of an action invocation (for execution later on).

For the record, the API of `ActionInvocationMemento` is:

    public class ActionInvocationMemento {
    
        public String getActionId() { ... }
        public String getTargetClassName() { ... }
        public String getTargetActionName() { ... }
        public Bookmark getTarget() { ... }
        public int getNumArgs() { ... }
        public Class<?> getArgType(final int num) throws ClassNotFoundException { ... }
        public <T> T getArg(final int num, final Class<T> type) { ... }
        
        public String asMementoString() { ... }
    }

The `asMementoString()` method therefore lets the `BackgroundCommandService` implementation convert the action invocation into a simple string.


### Implementation

The `isis-module-command-jdo` module provides the [BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html) implementation that persists `Command`s to an RDBMS.

There is also a supporting repository to query persisted background `Command`s:

* `org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoRepository`

In addition, there is a supporting contributions service that contributes actions for searching for persisted child and sibling `Command`s:

* `org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoContributions`


### Usage

As noted above, this service isn't intended to be called from domain classes; rather it acts as a plug-in point to the default `BackgroundServiceDefault` service.


## Related Services

As discussed above, this service supports the [BackgroundService](./background-service.html), persisting `Command`s such that they can be executed in the background.

There is also a tie-up with the [CommandContext](./command-context.html) and its supporting `CommandService` service.  The `CommandContext` service is responsible for providing a parent `Command` with which the background `Command`s can then be associated as children, while the `CommandService` is responsible for persisting those parent `Command`s (analogous to the way in which the `BackgroundCommandService` persists the child background `Command`s).  The `BackgroundCommandService` ensures that these background `Command`s are associated with the parent "foreground" `Command`.

What that means is that the implementations of `CommandService` and `BackgroundCommandService` go together, hence both implemented in the `isis-module-command-jdo` module: ([CommandServiceJdo](../../components/objectstores/jdo/services/command-service-jdo.html) and [BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html)).
 

## BackgroundCommandExecution concrete implementation

The `BackgroundCommandExecution` (in isis-core) is an abstract template class provided by isis-core that defines an abstract hook method to obtain background `Command`s to be executed:

    public abstract class BackgroundCommandExecution 
                             extends AbstractIsisSessionTemplate {
        ...
        protected abstract List<? extends Command> findBackgroundCommandsToExecute();
        ...
    }

The developer is required to implement this hook method in a subclass.

The `isis-module-command-jdo` module provides a concrete subclass that queries for commands persisted by its `BackgroundCommandServiceJdo`,  namely:

* `org.apache.isis.objectstore.jdo.service.BackgroundCommandExecutionFromBackgroundCommandServiceJdo`



## Quartz Scheduler Configuration

Details are provided on the [BackgroundService](./background-service.html) page.



## Registering the Services

Assuming that the `configuration-and-annotation` services installer is configured:

    isis.services-installer=configuration-and-annotation

then the `BackgroundCommandServiceJdo` and `BackgroundCommandJdoRepository` services are automatically registered if the `isis-module-command-jdo` module is on the classpath.  The `BackgroundCommandServiceJdoContributions` service (because it influences the user interface) must be explicitly registered:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoContributions,\
                  ...

