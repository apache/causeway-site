Title: CommandServiceJdo

The JDO objectstore provides an implementation of the applib [CommandService](../../../../reference/services/command-context.html) that persists the command data into a `CommandJdo` entity.  This is mapped to an `IsisCommand` table.

This supports a number of use cases:

* by making action interactions persistent as `Command`s, it enables profiling of actions (eg identify slow actions, or simply to identify the most commonly used transactions)
* it allows foreground `Command`s to be associated with any background child `Command`s created through the applib [BackgroundService](../../../../reference/services/background-service.html).
- if [auditing](../../../../reference/services/auditing-service.html) is configured (for example, the [JDO implementation](./auditing-service-jdo.html)), they provide better audit information as the `Command` (the 'cause' of an action) can be correlated to the audit records (the "effect" of the action) through the unique `transactionId` GUID
- if [publishing](../../../../reference/services/publishing-service.html) is configured (for example the [JDO implementation](./publishing-service-jdo.html)), they provide better traceability as the `Command` is also correlated with any published events, again through the unique `transactionId` GUID


There are a further repository that can also be used:

* the `CommandServiceJdoRepository` service provides a set of finders to query `Command`s.  

Note that this service does *not* provide any infrastructure for executing background `Command`s (actions annotated with `@Command(executeIn=BACKGROUND)`).  To execute these, configure the [JDO implementation](./background-command-service-jdo.html) of the applib [BackgroundCommandService](../../../../reference/services/background-service.html).


### Related services

This service is intended to be deployed in conjunction with the [JDO implementation](./background-command-service-jdo.html) of the applib [BackgroundCommandService](../../../../reference/services/background-service.html), which provides the ability to persist "foreground" `Command`s also as `CommandJdo`s (and to the same `IsisCommand` table.

### Register the Service(s)

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdo,\
                  org.apache.isis.objectstore.jdo.applib.service.command.CommandServiceJdoRepository,\
                  ...

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...

                    
                    