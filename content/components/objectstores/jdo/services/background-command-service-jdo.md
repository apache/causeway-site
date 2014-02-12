Title: BackgroundCommandServiceJdo

The JDO objectstore provides an implementation of the applib [BackgroundCommandService](../../../../reference/services/background-service.html) that persists the command data into a `CommandJdo` entity.  This is mapped to an `IsisCommand` table.

There are two further services that can be used:

* the `BackgroundCommandServiceJdoRepository` service provides a set of finders to query `BackgroundCommand`s.  
* the `BackgroundCommandServiceJdoContributions` service defines a number of contributed collections into the user interface for any persisted `Command`s.  These have the effect of showing the child background `Command`s for a parent `Command` (usually foreground).

In addition, the `BackgroundCommandExecutionFromBackgroundCommandServiceJdo` class is an implementation of [BackgroundCommandExecution]() that queries for persisted background `Command`s (using the `BackgroundCommandServiceJdoRepository`, in order that the commands can actually be executed (eg by a scheduler such as [Quartz](http://quartz.org)).

### Related services

This service is intended to be deployed in conjunction with the [JDO implementation](./command-service-jdo.html) of the applib [CommandService](../../../../reference/services/command-service.html), which provides the ability to persist "foreground" `Command`s also as `CommandJdo`s (and to the same `IsisCommand` table.

### Register the Service(s)

Register like any other service in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdo,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoRepository,\
                  org.apache.isis.objectstore.jdo.applib.service.background.BackgroundCommandServiceJdoContributions,\
                  ...

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...

                    