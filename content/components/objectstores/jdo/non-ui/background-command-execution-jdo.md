Title: BackgroundCommandExecution (JDO implementation)

[//]: # (content copied to user-guide_background-execution)

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-command-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-command) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-command) implementation is released.**
}

The `BackgroundCommandExecutionFromBackgroundCommandServiceJdo` is a concrete subclass of [BackgroundCommandExecution](../../../../reference/non-ui/background-command-execution.html).  The intended use is for the class to be instantiated regularly (eg every 10 seconds) by a scheduler such as [Quartz](http://quartz.org)) to poll for `Command`s to be executed, and then execute them. 

As you might imagine, this implementation queries for `Command`s persisted by the JDO implementations of [CommandService](../services/command-service-jdo.html) and [BackgroundCommandService](../services/background-command-service-jdo.html), using the `BackgroundCommandServiceJdoRepository`.

The diagram below shows the inheritance hierarchy for this class:

![](http://yuml.me/363b335f)


#### neat!
The diagrams on this page were created using [yuml.me](http://yuml.me). 

DSL ([edit](http://yuml.me/edit/363b335f)):
    
    [AbstractIsisSessionTemplate|#doExecute()]^-[BackgroundCommandExecution|#findBackgroundCommandsToExecute()]
    [BackgroundCommandExecution]^-[BackgroundCommandExecutionFromBackgroundCommandServiceJdo]
    [BackgroundCommandExecutionFromBackgroundCommandServiceJdo]->injected[BackgroundCommandServiceJdoRepository|findBackgroundCommandsNotYetStarted()]

    
    
