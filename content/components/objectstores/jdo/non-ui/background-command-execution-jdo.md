Title: BackgroundCommandExecution (JDO implementation)

The `BackgroundCommandExecutionFromBackgroundCommandServiceJdo` is a concrete subclass of [BackgroundCommandExecution](../../../../reference/non-ui/background-command-execution.html).  The intended use is for the class to be instantiated regularly (eg every 10 seconds) by a scheduler such as [Quartz](http://quartz.org)) to poll for `Command`s to be executed, and then execute them.  As you might imagine, this implementation queries for `Command`s persisted by the JDO implementations of [CommandService](../services/command-service-jdo.html) and [BackgroundCommandService](../services/background-command-service-jdo.html), using the `BackgroundCommandServiceJdoRepository`.

The diagram below shows how the inheritance hierarchy for this class:

![](http://yuml.me/363b335f)


#### neat!
The diagrams on this page were created using [yuml.me](http://yuml.me). 

DSL ([edit](http://yuml.me/edit/363b335f)):
    
    [AbstractIsisSessionTemplate|#doExecute()]^-[BackgroundCommandExecution|#findBackgroundCommandsToExecute()]
    [BackgroundCommandExecution]^-[BackgroundCommandExecutionFromBackgroundCommandServiceJdo]
    [BackgroundCommandExecutionFromBackgroundCommandServiceJdo]->injected[BackgroundCommandServiceJdoRepository|findBackgroundCommandsNotYetStarted()]

    
    
