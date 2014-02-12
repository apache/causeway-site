Title: AbstractIsisSessionTemplate (1.4.0-snapshot)

{note
This class is only semi-formalized, and may change (in small ways) over time.
}

The `AbstractIsisSessionTemplate` class (whose name is inspired by the Spring framework's naming convention for similar classes that query [JDBC](http://docs.spring.io/spring/docs/2.5.x/reference/jdbc.html#jdbc-JdbcTemplate), [JMS](http://docs.spring.io/spring/docs/2.5.x/reference/jms.html#jms-jmstemplate), [JPA](http://docs.spring.io/spring/docs/2.5.x/reference/orm.html#orm-jpa-template) etc) provides the mechanism to open up a 'session' within the Isis framework, in order to resolve and interact with entities.

This is a low-level API that circumvents any UI concerns, and allows code to interact very directly with the Isis metamodel and runtime.  Typical use cases are to support batch execution or background scheduler execution.  It could also be used to run Isis as a service, or to integrate within JMS/ESB messaging solutions.

The class itself is intended to be subclassed:


    public abstract class AbstractIsisSessionTemplate {

        public void execute(final AuthenticationSession authSession, final Object context) { ... }
        protected abstract void doExecute(Object context);

        protected ObjectAdapter adapterFor(final Object targetObject) { ... }
        protected ObjectAdapter adapterFor(final RootOid rootOid) { ... }
        
        protected PersistenceSession getPersistenceSession() { ... }
        protected IsisTransactionManager getTransactionManager() { ... }
        protected AdapterManager getAdapterManager() { ... }

    }

where `execute(...)` sets up the `IsisSession` and delegates to `doExecute(...)`, the mandatory hook method for subclasses to implement.  The passed object represents passes a context from the caller (eg the scheduler, cron job, JMS etc) that instantiated and executed the class.

The `protected` methods expose key internal APIs within Isis, for the subclass to use as necessary.

### Auto-injection

One notable feature of `AbstractIsisSessionTemplate` is that it will automatically inject any domain services into itself.  Thus, it is relatively easy for the subclass to "reach into" the domain, through injected repository services.

### Related classes

The [BackgroundCommandExecution](./background-command-execution.html) class is a subclass of `AbstractIsisSessionTemplate`, designed to execute [background commands](../services/background-service.html)).  The `BackgroundCommandExecutionFromBackgroundCommandServiceJdo` (a further subclass) obtains the commands from the `BackgroundCommandJdoServiceRepository`:


![](http://yuml.me/371d0665)


##### neat!
The above diagram was created using this [yuml.me](http://yuml.me] DSL:

    [AbstractIsisSessionTemplate|#doExecute()]^-[BackgroundCommandExecution|#findBackgroundCommandsToExecute()]
    [BackgroundCommandExecution]^-[BackgroundCommandExecutionFromBackgroundCommandServiceJdo]
    [BackgroundCommandExecutionFromBackgroundCommandServiceJdo]->injected[BackgroundCommandServiceJdoRepository|findBackgroundCommandsNotYetStarted()]
