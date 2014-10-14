Title: BackgroundCommandServiceJdo

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-command-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-command) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-command) implementation is released.**
}

The JDO objectstore provides an implementation of the applib [BackgroundCommandService](../../../../reference/services/background-service.html) that persists the command data into a `CommandJdo` entity.  This is mapped to an `IsisCommand` table.

There are two further services that can be used:

* the `BackgroundCommandServiceJdoRepository` service provides a set of finders to query `Command`s.  
* the `BackgroundCommandServiceJdoContributions` service defines a number of contributed collections into the user interface for any persisted `Command`s.  These have the effect of showing the child background `Command`s for a parent `Command` (usually foreground).

### Executing the `Command`s

The `BackgroundCommandServiceJdo` only persists the `Command`s to a database table, it doesn't actually execute those commands.  For this, you can use  [BackgroundCommandExecutionFromBackgroundCommandServiceJdo](../non-ui/background-command-execution-jdo.html) class, a subclass implementation of [BackgroundCommandExecution](../../../../reference/non-ui/background-command-execution.html).  The intention is that this class is instantiated regularly (eg every 10 seconds) by a scheduler such as [Quartz](http://quartz.org)) to poll for `Command`s to be executed, and then execute them.  As you might imagine, to find new `Ccommand`s it uses the `BackgroundCommandServiceJdoRepository`. 

An example of how to configure the Quartz scheduler can be found on the page that describes the applib [BackgroundService](../../../../reference/services/background-service.html).

### Related services

This service is intended to be deployed in conjunction with the [JDO implementation](./command-service-jdo.html) of the applib [CommandService](../../../../reference/services/command-context.html), which provides the ability to persist "foreground" `Command`s also as `CommandJdo`s (and to the same `IsisCommand` table.

*Note* the `BackgroundCommandServiceJdoRepository` queries for any `Command`s that needs to be executed (has not yet started).  Typically these will be those created explicitly through the `BackgroundService` API.  However, `Command`s to be executed in the background can also be created implicitly through the `@Command(executeIn=BACKGROUND)` annotation, whereby the `CommandContext` service delegates to the configured `CommandService` to persist the `Command`.  For these to be picked up, the `CommandService` in use should be the JDO implementation.

Put another way: just make sure you use the JDO implementations of `CommandService` and `BackgroundCommandService` together.

### Register the Service(s)

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdo,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoRepository,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoContributions,\
                  ...

                    