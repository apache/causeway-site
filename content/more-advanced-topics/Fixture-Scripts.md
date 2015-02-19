Fixture Scripts
===============

Fixture scripts are intended to support development and testing, by setting up the system into a known state.   A 
fixture script is invoked using a "fixture script" service, and typically invokes business actions on domain objects, 
either directly, or by delegating to child fixture scripts (the composite pattern).

One simple, but noteworthy point about fixture scripts is that they can be invoked through the UI.  This makes them
useful for more than "just" testing:

* If working with your domain experts/business analyst, fixture scripts allow you to set up the app in the appropriate
  state to start exploring proposed new functionality
  
* if implementing a user story/feature, fixture scripts (by setting up the system into a specific state) can make it 
  faster for you to manually verify that you've implemented the functionality correctly
  
* if writing automated [integration tests](../core/integtestsupport.html), the fixture scripts can be used as the
  "given" in a "given/when/then" style test
  
* if demo'ing your feature to the domain experts/stakeholder, fixture scripts can automate any tedious setup prior to
  demoing that feature.
  
* if performing manual/exploratory testing or user acceptance testing, the fixture script can setup the system into
  a known state for the feature being tested
  
* if training new users, the fixture script can be used to setup the system into a known state so that the users
  can practice using the features of the system.

The "fixture script" service is an application-specific subclass of the abstract `FixtureScripts` service provided in
Isis' applib.  An example of this can be found in the [simple app](../intro/getting-started/simpleapp-archetype.html)
archetype, which defines `SimpleObjectsFixtureService`.

## Using Fixture Scripts in the UI ##

The normal convention is to for the (application's) fixture script service to be surfaced on a "Prototyping" menu.  Here's
how the [simpleapp](../intro/getting-started/simpleapp-archetype.html) defines its fixture script service:

    @DomainService
    @DomainServiceLayout(
            named="Prototyping",
            menuBar = DomainServiceLayout.MenuBar.SECONDARY,
            menuOrder = "20"
    )
    public class SimpleObjectsFixturesService extends FixtureScripts {
        ...
    }

On the prototyping menu the fixture script service's "run fixture script" action can be called (these screenshots
taken from the [todoapp](https://github.com/isisaddons/isis-app-todoapp) (not ASF):

<img src="images/fixture-scenarios-run.png" width="800"></img>

This brings up an action prompt that lists the available fixture scripts:

<img src="images/fixture-scenarios-choice.png" width="800"></img>

Selecting and running one of these generates a list detailing the results of running the fixture:

<img src="images/fixture-scenarios-results.png" width="800"></img>

This list acts as a useful transcript of the steps taken by the fixture script.  It also allows the user to navigate
to any of the objects created/updated by the fixture script.

The fixture script framework automatically detects all available fixture scripts by searching the classpath.  The (application-specific) fixture service subclass specifies which packages to search in through the constructor.

So, for example, the `SimpleObjectsFixturesService`'s constructor is:

    public class SimpleObjectsFixturesService extends FixtureScripts {
        public ToDoItemsFixturesService() {
            super("simpleapp.fixture");
        }
        ...
    }


## Using Fixture Scripts in Integration Tests ##

Fixture scripts can be invoked in integration tests by injecting the `FixtureScripts` service and then using the service to execute the required fixture script.

For example, here's one of the [simpleapp](../intro/getting-started/simpleapp-archetype.html)'s integration tests:

    public class SimpleObjectsIntegTest extends SimpleAppIntegTest {

        @Inject
        FixtureScripts fixtureScripts;
        SimpleObject simpleObjectPojo;

        @Before
        public void setUp() throws Exception {
            // given
            fs = new RecreateSimpleObjects().setNumber(1);
            fixtureScripts.runFixtureScript(fs, null);

            simpleObjectPojo = fs.getSimpleObjects().get(0);
        }
        ...
    }

The test invokes the `RecreateSimpleObjects` fixture script, instructing it to set up one object:

    fs = new RecreateSimpleObjects().setNumber(1);

the retrieves that object later:

    simpleObjectPojo = fs.getSimpleObjects().get(0);

There's further discussion on this style of writing fixture scripts (with the input "setNumber" property and the
output "simpleObjects" property) below.


## Writing Fixture Scripts ##

We find it's helpful to distinguish:

* scenario fixture scripts - coarse-grained, to accomplish a particular business goal (or set up a bunch of related data)
* action fixture scripts - fine-grained, perform a single action on a domain object or service

Scenario scripts can be called from the UI, making it easy to demonstrate new features, or for manual exploratory testing.
These scenario scripts then call action scripts, with the action scripts as the atomic building blocks that do the actual work.

Both scenario scripts and action scripts are subclasses of the `FixtureScript` class (defined in the applib), with an
implementation of the `execute(ExecutionContext)` method:

    public abstract class FixtureScript ... {
        @Programmatic
        protected abstract void execute(final ExecutionContext executionContext);
        ...
    }

The `ExecutionContext` provides three main capabilities to the fixture script:

* the script can execute other child fixture scripts (eg a scenario script calling an action script) (1.8.0-SNAPSHOT)

<pre>
    executionContext.executeChild(this, someObject);
</pre>

* the script can get and set parameters from/to the context.

   More on this topic below.

* the script can add created or updated objects to the fixture's results, so that they can be rendered in the UI.

<pre>
    executionContext.addResult(this, someObject);
</pre>

> Prior to 1.8.0-SNAPSHOT, child fixture scripts were executed using the inherited `FixtureScript#executeChild(FixtureScript, ExecutionContext)` method.  That has now been deprecated).

The script can do whatever is necessary within its `execute` method to set up the state of the system (read: insert data
into the database).  One way of doing this would be simple SQL INSERT or UPDATE statements, or calling stored procs to
do the same.  This can lead to unmaintainable tests, however: if the business logic changes, then the knowledge encoded
in those SQL statements will be out-of-date.

Therefore a better approach is to have the fixture scripts simply invoke the relevant actions and other business logic
on the domain objects.  Then, if those actions change in the future, the scripts remain valid.  Put another way: have
the fixture scripts replay the "cause" of the change (business actions) rather than the "effect" (data inserts).

### Execution context parameters

As the screenshots above show, the `FixtureScripts#runFixtureScript` action allows optional parameters to be provided to the called fixture scripts:

    public abstract class FixtureScripts {
        ...
        public List<FixtureResult> runFixtureScript(
                final FixtureScript fixtureScript,
                @ParameterLayout(
                    named="Parameters",
                    describedAs="Script-specific parameters (if any).  The format depends on the script implementation...",
                    multiLine = 10
                )
                @Optional
                final String parameters) {
            ...
        }
        ...
    }

These parameters are then made available in `ExecutionContext` to be consumed by the fixture script (and any child
fixture scripts that might be called in turn):

    public class ExecutionContext {
        ...
        public String getParameters() { ... }
        ...
    }

The fixture script framework itself places no conditions on the format of these parameters, but it would quickly become
tedious to have to parse that single parameter string.  The `ExecutionContext` therefore provides additional methods
that parses that initial string into a set of parameters as key=value pairs:

    public class ExecutionContext {
        ...
        public Map<String,String> getParameterMap() { ... }
        ...
    }

There are also various overloads to retrieve each parameter as a particular datatype:

    public class ExecutionContext {
        ...
        public String getParameter(String parameterName) { ... }
        public String getParameterAsInteger(String parameterName) { ... }
        public LocalDate getParameterAsLocalDate(String parameterName) { ... }
        public Boolean getParameterAsBoolean(String parameterName) { ... }
        ...
    }

For example:

<pre>
    LocalDate dob = executionContext.getParameterAsLocalDate("dateOfBirth");
    // or equivalently:
    LocalDate dob = executionContext.getParameterAsT("dateOfBirth", LocalDate.class);
</pre>

Parameter values can also be set on `ExecutionContext`:

    public class ExecutionContext {
        ...
        public void setParameter(String parameterName, String parameterValue) { ... }
        public void setParameter(String parameterName, Integer parameterValue) { ... }
        public void setParameter(String parameterName, LocalDate parameterValue) { ... }
        public void setParameter(String parameterName, Boolean parameterValue) { ... }
        ...
    }

For example:

<pre>
    executionContext.setParameter("dateOfBirth", clockService.now().minus(new Years(18)));
</pre>

This provides a useful mechanism for sharing data between fixture scripts that call child fixture scripts.  And on that topic...


## Input and output properties

We also recommend that fixture scripts define both inputs and outputs, as simple JavaBean properties.
Input properties are used to adjust the behaviour of the fixture script, while the output properties provide the means for
the fixture script to make the object(s) created/modified available to a calling integration test.

So that they can be "just be executed" from the UI, scenario scripts should have defaults for all inputs.  A lot of
the value for fixture scripts arises if they can perform their setup with a minimum of inputs, in other words using
sensible defaults if none are specified.  Action scripts should also default as much as possible, on the other hand may
have some mandatory inputs that must be set by the calling scenario.

> Check out libraries that can generate random test data (a quick google search throws up
[this ASLv2 licensed port](https://github.com/DiUS/java-faker) of the popular Ruby Faker library.

To assist with this all of this, the `FixtureScript` class provides two methods:

* `defaultParam(...)` will attempt to (reflectively) read a parameter the fixture script itself, otherwise from the
execution context itself, otherwise will fall back on a default value:

<pre>
    LocalDate dateOfBirth = defaultParam("dateOfBirth", executionContext ec, clockService.now().minus(new Years(18)));
</pre>

* `checkParam(...)` will attempt to (reflectively) read a parameter the fixture script itself, otherwise from the
execution context itself, otherwise will throw an exception:

<pre>
    LocalDate dateOfBirth = defaultParam("dateOfBirth", executionContext ec, LocalDate.class);
</pre>

As you can probably guess, scenario scripts should only call `defaultParam(...)`, whereas action scripts can also call
`checkParam(...)` for any mandatory parameters.

### Example Usage (1.8.0-SNAPSHOT)

The [simpleapp](../intro/getting-started/simpleapp-archetype.html) has fixtures that follow this pattern:

* `RecreateSimpleObjects` is a scenario that creates a number of simple objects
* `SimpleObjectCreate` is an action script that creates a single simple object.

Because the `RecreateSimpleObjects` is a scenario script, it can be run without any input parameters, and will by default
cause 3 object to be created.  This can be influenced by the "number" input property, a simple JavaBean:

    private Integer number;

    /**
     * The number of objects to create, up to 10; optional, defaults to 3.
     */
    public Integer getNumber() { return number; }

    public RecreateSimpleObjects setNumber(final Integer number) {
        this.number = number;
        return this;
    }

(The setter returns 'this' to allow for chaining).

In the body of the scenario, the script uses `defaultParam(...)` to default this value if not specified:

        final int number = defaultParam("number", ec, 3);

This scenario script also provides an output property, being a list of the objects created by the script:

    private final List<SimpleObject> simpleObjects = Lists.newArrayList();

    /**
     * The simpleobjects created by this fixture (output).
     */
    public List<SimpleObject> getSimpleObjects() { return simpleObjects; }

Then (as already shown in an earlier section on this page), these properties together constitute a simple and
convenient API for integration tests to use:

    @Before
    public void setUp() throws Exception {
        // given
        fs = new RecreateSimpleObjects().setNumber(1);
        fixtureScripts.runFixtureScript(fs, null);

        simpleObjectPojo = fs.getSimpleObjects().get(0);
    }

Or, if the end-user (using the UI) wants to specify a different number of objects to be created than the default, they
can simply execute the script specifying a parameter such as "number=6" (or whatever).


## Running a fixture script automatically on start up

If working or prototyping a particular user story (running with an in-memory database) it can be useful to have the
application automatically run a specific fixture script.  There are several ways to accomplish this.

### Using isis.properties

First, the fixture script class name can be specified in `isis.properties` config file:

    isis.fixtures=fixture.todo.scenarios.ToDoItemsRecreateForSven

The app must also be started using the following system property:

    -D isis.persistor.datanucleus.install-fixtures=true

### On the command line, using --fixture

Alternatively, the fixture class itself can be specified on the command line using the `--fixture` flag:

    --fixture fixture.todo.scenarios.ToDoItemsRecreateForSven \
    -D isis.persistor.datanucleus.install-fixtures=true

### On the command line, using system properties

A variation on this is to specify the fixture class using the following system properties:

    -D isis.fixtures=fixture.todo.scenarios.ToDoItemsRecreateForSven \
    -D isis.persistor.datanucleus.install-fixtures=true

Note that the key is "isis.fixtures", not "isis.fixture".

### Running the standalone jetty-console

A final variation allows the app to be run as a standalone WAR using jetty-console (ie `xxx-jetty-console.war`).  This
is accomplished using the `--initParam` flag:

    java -jar todoapp-jetty-console.war \
        --initParam isis.fixtures=fixture.todo.scenarios.ToDoItemsRecreateForSven \
        --initParam isis.persistor.datanucleus.install-fixtures=true

In this case any initParam named "isis." wil be loaded into Isis' configuration.
