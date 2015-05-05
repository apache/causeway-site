Title: Background Service

[//]: # (content copied to _user-guide_xxx)

The `BackgroundService`, and its companion `BackgroundCommandService`, enable action invocations to be persisted such that they may be invoked in the background.
 
The `BackgroundService` is responsible for capturing a memento representing the action invocation, and persisting it.  The default `BackgroundServiceDefault` implementation (provided by isis-core) uses (a private copy of) [MementoService](./memento-service.html), and then delegates the persistence of the memento to an appropriate implementation of the companion `BackgroundCommandService`.  One such implementation is `isis-module-command-jdo`'s [BackgroundCommandServiceJdo](./background-command-service.html).
 
The persisting of commands is only half the story; there needs to be a separate process  to read the commands and execute them.  The `BackgroundCommandExecution` abstract class (discussed [below](#BackgroundCommandExecution) provides infrastructure to do this; the concrete
implementation of this class depends on the configured `BackgroundCommandService` (in order to query for the persisted (background) `Command`s.


## BackgroundService

The `BackgroundService` is the entry point for domain classes wishing to perform actions asynchronously.  This can be done in a typesafe way; the (default implementation of) `BackgroundService` actually uses a proxy wrapper around the target so that it can capture the action to invoke and its arguments, and then persist them rather than execute them.

### API & Implementation

Returns a proxy around the object which is then used to obtain the signature of the action to be invoked in the background.

    public interface BackgroundService {
    
        @Programmatic
        <T> T execute(final T object);
    }

The default implementation is provided by core:

* `org.apache.isis.core.runtime.services.background.BackgroundServiceDefault`


### Usage

Using the `BackgroundService` is very straight-forward.  For example:

    public void submitCustomerInvoices() {
        for(Customer customer: customerRepository.findCustomersToInvoice()) {
            backgroundService.execute(customer).submitInvoice();
        }
        container.informUser("Calculating...");
    }

Will create a bunch of background commands executing the `submitInvoice()` action for each of the customers returned from the customer repository.

The action method invoked must be part of the Isis metamodel, which is to say it must be public, accept only scalar arguments, and must not be annotated with `@Programmatic` or `@Ignore`.  However, it may be annotated with `@Hidden`, and it will still be invoked.  

In fact, when invoked by the background service, no business rules (hidden, disabled, validation) are enforced; the action method must take responsibility for performing appropriate validation and error checking.

### End-user experience

For the end-user, executing an action that delegates work off to the `BackgroundService` raises the problem of how does the user know the work is complete?

One option is for the background jobs to take responsibility to notify the user themselves.  In the above example, this would be the `submitInvoice()` method called upon each customer.  One could imagine more complex designs where only the final command executed notifies the user.

However, an alternative is to rely on the fact that the `BackgroundService` will automatically hint that the `Command` representing the original interaction (to `submitCustomerInvoices()` in the example above) should be persisted.  This will be available if the related `CommandContext` and `CommandService` domain services are configured, and the `CommandService` supports persistent commands.  You can read more about `CommandContext` and `CommandService` [here](./command-context.html).

Thus, the original action can run a query to obtain it corresponding `Command`, and return this to the user.  The child `Command`s created by the `BackgroundService` will then be associated with it.

We could therefore refactor the method as follows:

    public Command submitCustomerInvoices() {
        for(Customer customer: customerRepository.findCustomersToInvoice()) {
            backgroundService.execute(customer).submitInvoice();
        }
        return commandContext.getCommand();
    }

where `commandContext` field is the injected `CommandContext` domain service.


## Related Services

This service is closely related to the [CommandContext](./command-context.html) and also that service's supporting [CommandService](./command-service.html) service.  The `CommandContext` service is responsible for providing a parent `Command` with which the background `Command`s can then be associated as children, while the `CommandService` is responsible for persisting those parent `Command`s.  The latter is analogous to the way in which the  `BackgroundCommandService` persists the child background `Command`s.

The implementations of `CommandService` and `BackgroundCommandService` go together; typically both parent `Command`s and child background `Command`s will be persisted in the same way.  The `isis-module-command-jdo` module provides implementations of both (see [CommandServiceJdo](../../components/objectstores/jdo/services/command-service-jdo.html) and [BackgroundCommandServiceJdo](../../components/objectstores/jdo/services/background-command-service-jdo.html)).
 

## BackgroundCommandExecution abstract class

The `BackgroundCommandExecution` (in isis-core) is an abstract template class provided by isis-core that defines an abstract hook method to obtain background `Command`s to be executed:

    public abstract class BackgroundCommandExecution 
                             extends AbstractIsisSessionTemplate {
        ...
        protected abstract List<? extends Command> findBackgroundCommandsToExecute();
        ...
    }

The developer is required to implement this hook method in a subclass.  The `isis-module-command-jdo` module provides a suitable concrete implementation.


## Quartz Scheduler Configuration

The last part of the puzzle is to actually run this class.  These could be run in a batch job overnight, or run continually by, say, the [Quartz](http://quartz-scheduler.org) scheduler.  For the latter case, we want to define a Quartz cron job that will inherit the `execute(...)` method of `BackgroundCommandExecution` (inherited from *its* superclass, `AbstractIsisSessionTemplate`).

If using the `isis-module-command-jdo`, then the following does the trick:

    import org.apache.isis.objectstore.jdo.service.BackgroundCommandExecutionFromBackgroundCommandServiceJdo;
    
    public class BackgroundCommandExecutionQuartzJob extends AbstractIsisQuartzJob {
    
        public BackgroundCommandExecutionQuartzJob() {
            super(new BackgroundCommandExecutionFromBackgroundCommandServiceJdo());   
        }
    }

where `AbstractIsisQuartzJob` is the following boilerplate:

    import org.quartz.Job;
    import org.quartz.JobExecutionContext;
    import org.quartz.JobExecutionException;
    ...
    public class AbstractIsisQuartzJob implements Job {
    
        public static enum ConcurrentInstancesPolicy {
            SINGLE_INSTANCE_ONLY,
            MULTIPLE_INSTANCES
        }
        
        private final AbstractIsisSessionTemplate isisRunnable;
    
        private final ConcurrentInstancesPolicy concurrentInstancesPolicy;
        private boolean executing;
    
        public AbstractIsisQuartzJob(AbstractIsisSessionTemplate isisRunnable) {
            this(isisRunnable, ConcurrentInstancesPolicy.SINGLE_INSTANCE_ONLY);
        }
        public AbstractIsisQuartzJob(
                AbstractIsisSessionTemplate isisRunnable, 
                ConcurrentInstancesPolicy concurrentInstancesPolicy) {
            this.isisRunnable = isisRunnable;
            this.concurrentInstancesPolicy = concurrentInstancesPolicy;
        }
    
        // //////////////////////////////////////
    
        public void execute(final JobExecutionContext context) 
                throws JobExecutionException {
            final AuthenticationSession authSession = newAuthSession(context);
            try {
                if(concurrentInstancesPolicy == ConcurrentInstancesPolicy.SINGLE_INSTANCE_ONLY && 
                   executing) {
                    return;
                }
                executing = true;
    
                isisRunnable.execute(authSession, context);
            } finally {
                executing = false;
            }
        }
    
        AuthenticationSession newAuthSession(JobExecutionContext context) {
            String user = getKey(context, SchedulerConstants.USER_KEY);
            String rolesStr = getKey(context, SchedulerConstants.ROLES_KEY);
            String[] roles = Iterables.toArray(
                    Splitter.on(",").split(rolesStr), String.class);
            return new SimpleSession(user, roles);
        }
    
        String getKey(JobExecutionContext context, String key) {
            return context.getMergedJobDataMap().getString(key);
        }
    }
    
This can be configured to run using Quartz' `quartz-config.xml` file:

    <?xml version="1.0" encoding="UTF-8"?>
    <job-scheduling-data
    	xmlns="http://www.quartz-scheduler.org/xml/JobSchedulingData"
    	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    	xsi:schemaLocation="http://www.quartz-scheduler.org/xml/JobSchedulingData 
    http://www.quartz-scheduler.org/xml/job_scheduling_data_1_8.xsd"
    	version="1.8">
    
    	<schedule>
    		<job>
    			<name>BackgroundCommandExecutionJob</name>
    			<group>Isis</group>
    			<description>
                    Poll and execute any background actions persisted by the BackgroundActionServiceJdo domain service
                </description>
    			<job-class>webapp.scheduler.BackgroundCommandExecutionQuartzJob</job-class>
    			<job-data-map>
    				<entry>
    					<key>webapp.scheduler.user</key>
    					<value>scheduler_user</value>
    				</entry>
    				<entry>
    					<key>webapp.scheduler.roles</key>
    					<value>admin_role</value>
    				</entry>
    			</job-data-map>
    		</job>
    
    		<trigger>
    			<cron>
    				<name>BackgroundCommandExecutionJobEveryTenSeconds</name>
    				<job-name>BackgroundCommandExecutionJob</job-name>
    				<job-group>Isis</job-group>
    				<cron-expression>0/10 * * * * ?</cron-expression>
    			</cron>
    		</trigger>
    	</schedule>
    </job-scheduling-data>

The remaining two pieces of configuration are the `quartz.properties` file:

    org.quartz.scheduler.instanceName = SchedulerQuartzConfigXml
    org.quartz.threadPool.threadCount = 1
    org.quartz.jobStore.class = org.quartz.simpl.RAMJobStore
    org.quartz.plugin.jobInitializer.class =org.quartz.plugins.xml.XMLSchedulingDataProcessorPlugin 
    org.quartz.plugin.jobInitializer.fileNames = webapp/scheduler/quartz-config.xml 
    org.quartz.plugin.jobInitializer.failOnFileNotFound = true

and the entry in `web.xml` for the Quartz servlet:

    <servlet>
         <servlet-name>QuartzInitializer</servlet-name>
         <servlet-class>org.quartz.ee.servlet.QuartzInitializerServlet</servlet-class>
         <init-param>
             <param-name>config-file</param-name>
             <param-value>webapp/scheduler/quartz.properties</param-value>
         </init-param>
         <init-param>
             <param-name>shutdown-on-unload</param-name>
             <param-value>true</param-value>
         </init-param>
         <init-param>
             <param-name>start-scheduler-on-load</param-name>
             <param-value>true</param-value>
         </init-param>
         <load-on-startup>1</load-on-startup>
     </servlet>




## Registering the Services

Assuming that the `configuration-and-annotation` services installer is configured:

    isis.services-installer=configuration-and-annotation

then Isis' core implementation of `BackgroundService` will be automatically registered and injected into your entities/services.

