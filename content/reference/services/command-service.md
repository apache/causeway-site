Title: CommandService (isis-module-command-jdo)

[//]: # (content copied to _user-guide_xxx)

The `CommandService` service supports the [CommandContext](./command-context.html) service such that `Command` objects (that reify the invocation of an action on a domain object into an object) can be persisted.

Persistent `Command`s support several use cases:

- they enable profiling of the running application (which actions are invoked then most often, what is their response time)
- they act as a parent to any background commands that might be invoked through the [BackgroundService](./background-service.html)
- if [auditing](./auditing-service.html) is configured, they provide better audit informatio, since the `Command` (the 'cause' of an action) can be correlated to the audit records (the "effect" of the action) through the unique `transactionId` GUID
- if [publishing](./publishing-service.html) is configured, they provide better traceability as the `Command` is also correlated with any published events, again through the unique `transactionId` GUID
- the associated [@Command](../recognized-annotations/Command.html) annotation also allows action invocations to be performed in the background.  In this case the act of invoking the action on an object instead returns the `Command` to the user.

## <a name="screencast">Screencast</a>

The screencast provides a run-through of the command (profiling) service, auditing service, publishing service.  It also shows how commands can be run in the background either explicitly by scheduling through the background service or implicitly by way of a framework annotation.

<iframe width="560" height="315" src="//www.youtube.com/embed/tqXUZkPB3EI" frameborder="0" allowfullscreen></iframe>


## API

The `CommandService` service defines the following very simple API:

    public interface CommandService {

        @Programmatic
        Command create();
        
        @Programmatic
        void startTransaction(final Command command, final UUID transactionId);
        
        @Programmatic
        void complete(final Command command);

        @Programmatic
        boolean persistIfPossible(Command command);

        }

where `Command` is defined as defined by the [CommandContext](./command-context.html) service.

   

## Implementation

#### CommandService (for persistent `Command`s)

The `CommandService` interface (defined in the Isis applib) is implemented within `isis-module-command-jdo` by:

* `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdo`

There is also a supporting repository to query persisted `Command`s:

* `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoRepository`

In addition, there is a supporting contributions service that contributes actions for searching for persisted `Command`s for any object:

* `org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoContributions`


## Usage


## Registering the Services

Assuming that the `configuration-and-annotation` services installer is configured:

    isis.services-installer=configuration-and-annotation

then the `CommandServiceJdo` and `CommandServiceJdoRepository` services are automatically registered if the `isis-module-command-jdo` module
is on the classpath.  The `CommandServiceJdoContributions` service (because it influences the user interface) must be explicitly
registered:


    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoContributions,\
                  ...


## Related Services

As discussed above, this service supports the [CommandContext](./command-context.html), providing the ability for `Command` objects to be
persisted.  This is closely related to the [BackgroundCommandService](./background-command-service.html) that allows the [BackgroundService](./background-service.html)) to schedule commands for background/asynchronous execution.

The implementations of `CommandService` and `BackgroundCommandService` are intended to go together, so that persistent parent `Command`s can be associated with their child background `Command`s.
