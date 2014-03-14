Title: CommandContext and CommandService

The `CommandContext` service is a [request-scoped](../../more-advanced-topics/how-to-09-020-How-to-write-a-typical-domain-service.html) service that reifies the invocation of an action on a domain object into an object itself.  This reified information is encapsulated within the `Command` object.

By default, the `Command` is held in-memory only; once the action invocation has completed, the `Command` object is gone.  The optional
 supporting `CommandService` enables the implementation of `Command` to be pluggable.  With an appropriate implementation (eg the JDO implementation, described below) the `Command` may then be persisted.

Persistent `Command`s support several use cases:

- they enable profiling of the running application (which actions are invoked then most often, what is their response time)
- they act as a parent to any background commands that might be invoked through the [BackgroundService](./background-service.html)
- if [auditing](./auditing-service.html) is configured, they provide better audit informatio, since the `Command` (the 'cause' of an action) can be correlated to the audit records (the "effect" of the action) through the unique `transactionId` GUID
- if [publishing](./publishing-service.html) is configured, they provide better traceability as the `Command` is also correlated with any published events, again through the unique `transactionId` GUID

Assuming that the `CommandService` supports persistent `Command`s, the associated [@Command](../recognized-annotations/Command.html) annotation also allows action invocations to be performed in the background.  In this case the act of invoking the action on an object instead returns the `Command` to the user.

## <a name="screencast">Screencast</a>

The screencast provides a run-through of the command (profiling) service, auditing service, publishing service.  It also shows how commands can be run in the background either explicitly by scheduling through the background service or implicitly by way of a framework annotation.

<iframe width="560" height="315" src="//www.youtube.com/embed/tqXUZkPB3EI" frameborder="0" allowfullscreen></iframe>


## API

The `CommandContext` request-scoped service defines the following very simple API:

    @RequestScoped
    public class CommandContext {
    
        @Programmatic
        public Command getCommand() { ... }
    }

where `Command` is defined in turn as:

    public interface Command extends HasTransactionId {
    
        public abstract String getUser();
        public abstract Timestamp getTimestamp();

        public abstract Bookmark getTarget();
        public abstract String getMemberIdentifier();
        public abstract String getTargetClass();
        public abstract String getTargetAction();
        public String getArguments();
        public String getMemento();

        public ExecuteIn getExecuteIn();
        public Executor getExecutor();
        public Persistence getPersistence();
        public boolean isPersistHint();

        public abstract Timestamp getStartedAt();
        public abstract Timestamp getCompletedAt();
        public Command getParent();

        public Bookmark getResult();
        public String getException();
        
    }    

and where `Command` has the members:

* `getUser()` - is the user that initiated the action.
* `getTimestamp()` - the date/time at which this action was created.
* `getTarget()` - bookmark of the target object (entity or service) on which this action was performed
* `getMemberIdentifier()` - holds a string representation of the invoked action
* `getTargetClass()` - a human-friendly description of the class of the target object
* `getTargetAction()` - a human-friendly name of the action invoked on the target object
* `getArguments()` - a human-friendly description of the arguments with which the action was invoked
* `getMemento()` - a formal (XML or similar) specification of the action to invoke/being invoked
* `getExecuteIn()` - whether this command is executed in the foreground or background
* `getExecutor()` - the (current) executor of this command, either user, or background service, or other (eg redirect after post).
* `getPersistence()`- the policy controlling whether this command should ultimately be persisted (either "persisted", "if hinted", or "not persisted")
* `isPersistHint()` - whether that the command should be persisted, if persistence policy is "if hinted".
* `getStartedAt()` - the date/time at which this action started (same as `timestamp` property for foreground commands)
* `getCompletedAt()` - the date/time at which this action completed.
* `getParent()` - for actions created through the `BackgroundService`, captures the parent action
* `getResult()` - bookmark to object returned by action, if any
* `getException()` - exception stack trace if action threw exception
    

## Implementation

#### CommandContext

The `CommandContext` implementation is part of the core framework (isis-core), in fact is a concrete class in the applib:

* `org.apache.isis.applib.services.command.CommandContext`

#### CommandService (for persistent `Command`s)

The `CommandService` interface - which acts as the factory for different `Command` implementations - is pluggable.  Currently there is only a single implementation, provided by the JDO objectstore, which persists `Command`s to an RDBMS:

* `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdo`

There is also a supporting repository to query persisted `Command`s:

* `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoRepository`


## Usage

#### Explicitly treating an action as a command

The typical way to indicate that an action should be treated as a command is to annotate it with the [@Command](../recognized-annotations/Command.html) annotation, for example:

    public class ToDoItem ... {
    
        @Command
        public ToDoItem completed() { ... }
    
    }

The annotation can also be used to specify whether the command should be performed in the background, for example:

    public class ToDoItem ... {

        @Command(executeIn=ExecuteIn.BACKGROUND)
        public ToDoItem scheduleImplicitly() {
            completeSlowly(3000);
            return this;
        }
    }        

When a background command is invoked, the user is returned the command object itself (to provide a handle to the command being invoked).

#### Making commands the default

As an alternative to annotating every action with `@Command`, alternatively this can be configured as the default.  

To treat every action as a command, add the following to `isis.properties`:

    isis.services.command.actions=all 

For some applications it may be required to record (as commands) only those actions that update objects; in other words queries and searches can be ignored.  Put another way, only actions annotated (with [@ActionSemantics](../recognized-annotations/ActionSemantics.html)) as IDEMPOTENT or NON_IDEMPOTENT should be treated as commands.  In this case, use:

    isis.services.command.actions=ignoreQueryOnly

To prevent an action from being treated as a command (even if globally enabled), use the `@Command` annotation with the `disabled` attribute:

    @Command(disabled=true)
    public void notACommand() { ... }

To disable globally, use:    
    
    isis.services.command.actions=none

If the key is not present in `isis.properties`, then commands are disabled by default.
    
#### Interating with the services

Typically the domain objects have little need to interact with the `CommandContext` and `Command` directly; what is more useful is that these are persisted in support of the various use cases identified above.

One case however where a domain object might want to obtain the `Command` is to determine whether it has been invoked in the foreground, or in the background.  It can do this using the `getExecutedIn()` method:

    ExecutedIn executedIn = commandContext.getCommand().getExecutedIn();

If run in the background, it might then notify the user (eg by email) if all work is done.

This leads us onto a related point, distinguishng the effective user vs the real user.  When running in the foreground, the current user can be obtained from the `DomainObjectContainer`, using:

    String user = container.getUser().getName();

If running in the background, however, then the current user will be the credentials of the background process, for example as run by a Quartz scheduler job.

The domain object can still obtain the original ("effective") user that caused the job to be created, using:

    String user = commandContext.getCommand().getUser();


## Registering the Services

Register like any other service in `isis.properties`.  For example, if using the core `CommandContext` service along with the [JDO implementation](../../components/objectstores/jdo/services/command-service-jdo.html) of the `CommandService`, then it would be:

    isis.services=...,\
                  org.apache.isis.applib.services.command.CommandContext,\
                  org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdo,\
                  org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoRepository,\
                  ...


## Related Services

These services are most often used in conjunction with the `BackgroundService` and `BackgroundCommandService` (both described [here](./background-service.html)).  For `BackgroundService` captures commands for execution in the background, while the [BackgroundCommandService] persists such commands for execution.  

The implementations of `CommandService` and `BackgroundCommandService` are intended to go together, so that persistent parent `Command`s can be associated with their child background `Command`s.
