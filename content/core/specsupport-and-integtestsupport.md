Title: BDD Specs and Integration testing Support (1.3.0-SNAPSHOT)

> This new feature replaces the integration test support provided in 1.2.0.  Please note that some small changes to your tests will be required.

## Concepts ##

The `isis-core-specsupport` and `isis-core-integtestsupport` modules provide the ability to bootstrap Isis and run either BDD specifications
or regular integration tests.

* In the case of BDD specs, these are run using [Cucumber-JVM](https://github.com/cucumber/cucumber-jvm), the Java port of the original Ruby [Cucumber](http://cukes.info) tool.
 
    Specifications are written in the [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) DSL, following the ["given/when/then"](https://github.com/cucumber/cucumber/wiki/Given-When-Then) format.  Cucumber-JVM itself is a JUnit runner, and searches for [feature files](https://github.com/cucumber/cucumber/wiki/Feature-Introduction) on the classpath.   These in turn are matched to [step definition](http://cukes.info/step-definitions.html)s through regular expressions.  It is the step definitions (the "glue") that exercise the system. 

* In the case of integration tests, these are run using JUnit.

To untangle the above a little: in terms of lines of code to be written, the code that goes in step definitions is broadly the same as the code that goes in an integration test method.  The benefit of the former is that the given/then/when scenarios feature file describe the context of the interaction, and the step definitions are reusable across scenarios.  

There are some key framework classes that make up the spec/integtest support; these are discussed below.

### IsisSystemForTest ###

To support both BDD specs and integration tests, Isis provides the `IsisSystemForTest` class.  This allows a complete running instance of Isis to be bootstrapped (usually with the JDO objectstore), and then held on a `ThreadLocal` from one test to another.

Typically bootstrapping code is used to lazily instantiate the `IsisSystemForTest` once and once only.  The mechanism for doing this is line-for-line identical in both BDD step defs and integration tests.  


### ScenarioExecution ###

Isis also provides a `ScenarioExecution` class.  The purpose of this class is to provide a context under which the specification or an integration test is executing.

For both BDD specs and integration tests, the `ScenarioExecution` also provides access to the configured domain services (accessible through the `service(...)` method) and the `DomainObjectContainer` (through the `container()` method).
  
In addition, UI behaviour can be integration tested by "wrapping" each domain object in a proxy.  This proxy ensures that the "see it/use it/do it" rules (ie to hide, disable, or validate) are enforced.  The wrapping is performed using the `WrapperFactory`, part of the [isis-core-wrapper](wrapper.html) module.    The `ScenarioExecution`'s `wrap()` and `unwrap()` helper methods provide access to this capability.

The `ScenarioExecution` also provides the `install()` method, allowing fixtures to be installed in the normal way.  If using the JDO Object store, then these fixtures the `IsisJdoSupport` service can be used to run arbitrary SQL against the underlying database (eg to truncate/delete existing tables as need be).

Of relevance only to BDD specs, the `ScenarioExecution`'s `getVar()` and `putVar()` methods also allow variables to be passed from one step definition to the next.  (Broadly speaking, this is the same as the "World" object in Ruby-flavoured Cucumber).

Like the `IsisSystemForTest` class, the `ScenarioExecution` class also binds an instance of itself onto a `ThreadLocal`.  It can then be accessed in both BDD step defs and in integration tests using `ScenarioExecution.current()` static method.

### CukeStepDefsAbstract and IntegrationTestAbstract ###

The `CukeStepDefsAbstract` acts as a convenience superclass for writing BDD step definitions.  Similarly, the `IntegrationTestAbstract` acts as a convenience subclass for writing integration tests.  These two classes are very similar in that they both delegate to an underlying `ScenarioExecution`.


### Integration- vs Unit- Scope

Although BDD specs are most commonly used for end-to-end tests (ie at the same scope as an integration test), the two concerns (expressability of a test to a business person vs granularity of the test) should not be conflated.  There [are](http://tooky.co.uk/2013/01/18/cucumber-and-full-stack-testing.html) several [good](http://silkandspinach.net/2013/01/18/a-testing-strategy/) blog [posts](http://claysnow.co.uk/the-testing-iceberg/) discussing [this](http://claysnow.co.uk/living-documentation-can-be-readable-and-fast/).  The basic idea is to avoid the overhead of a heavy-duty integration test if possible.

Isis takes inspiration from these to optionally allow BDD specs to be run at a unit scope.  The scope is indicated by annotating the scenario with the `@unit` or `@integration` tags.

When running under unit-level scope, the Isis system is *not* instantiated.  Instead, `ScenarioExecution` class returns JMock mocks (except for the `WrapperFactory`, if configured).

Writing a BDD spec that supports both modes of operation therefore takes more effort, but the benefit is a (much) faster executing test suite.  Writing to support both modes means that the developer/tester can easily check the scenario at both scopes just by altering the tag.

To support unit-testing, Isis provides the `InMemoryDB` class; a glorified hashmap of "persisted" objects.  Use of this utility class is optional.

## Usage

The following examples are taken from the [quickstart ("todo") application](https://github.com/apache/isis/tree/master/example/application/quickstart_wicket_restful_jdo); in particular from that project's [integration test](https://github.com/apache/isis/tree/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integtests) module.


### Root pom ###

In the root [`pom.xml`](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/pom.xml), we recommend that you update the `maven-surefire-plugin` patterns, so that BDD specs are recognised alongside unit and integration tests:

    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-surefire-plugin</artifactId>
        <version>2.10</version>
        <configuration>
            <includes>
                <include>**/*Test.java</include>
                <include>**/*Test_*.java</include>
                <include>**/*Spec*.java</include>
            </includes>
            <excludes>
                <exclude>**/Test*.java</exclude>
                <exclude>**/*ForTesting.java</exclude>
                <exclude>**/*Abstract*.java</exclude>
            </excludes>
            <useFile>true</useFile>
            <printSummary>true</printSummary>
            <outputDirectory>${project.build.directory}/surefire-reports</outputDirectory>
        </configuration>
    </plugin>

### Integration testing module ###

Assuming you have a module for your integration tests, add in the dependencies:

    <dependency>
        <groupId>org.apache.isis.core</groupId>
        <artifactId>isis-core-specsupport</artifactId>
    </dependency>
    <dependency>
        <groupId>org.apache.isis.core</groupId>
        <artifactId>isis-core-integtestsupport</artifactId>
    </dependency>

There is no need to explicitly add in a dependency on `isis-core-wrapper`; this is done automatically.

### Writing an Integration test ###

Integration tests should subclass from `IntegrationTestAbstract`.  For example, here's a the [`ToDoItemTest_completed`](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/tests/actions/ToDoItemTest_completed.java) test which exercises of the `ToDoItem`'s `completed()` action:


    public class ToDoItemTest_completed  {

        @BeforeClass
        public static void initClass() {
            PropertyConfigurator.configure("logging.properties");
            ToDoSystemInitializer.initIsft();
            
            // instantiating will install onto ThreadLocal
            new ScenarioExecutionForIntegration();
        }
    
        private ToDoItem toDoItem;
    
        @Before
        public void setUp() throws Exception {
            scenarioExecution().install(new ToDoItemsFixture());
    
            final List<ToDoItem> all = wrap(service(ToDoItems.class)).notYetComplete();
            toDoItem = wrap(all.get(0));
        }   
    
        @Test
        public void happyCase() throws Exception {
            assertThat(toDoItem.isComplete(), is(false));
            toDoItem.completed();
            assertThat(toDoItem.isComplete(), is(true));
        }
        
        @Test
        public void cannotCompleteIfAlreadyCompleted() throws Exception {
            unwrap(toDoItem).setComplete(true);
            expectedExceptions.expectMessage("Already completed");
            toDoItem.completed();
        }
        
        @Test
        public void cannotSetPropertyDirectly() throws Exception {
            expectedExceptions.expectMessage("Always disabled");
            toDoItem.setComplete(true);
        }
    }

The [ToDoItemsFixture](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/fixture/src/main/java/fixture/todo/ToDoItemsFixture.java) referenced above tears down data as well as installs new data.  In this example it runs at the class level (`@BeforeClass`), but it can also run at the instance level (`@Before`).  

Note also that when the `ToDoItem` is wrapped, it is not possible to call `setComplete()` directly on the object; but when it is unwrapped then this call can be made as per normal.

The [ToDoSystemInitializer](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/ToDoSystemInitializer.java) class referenced above is responsible for setting up the `IsisSystemForTest`.  You can think of it as being broadly equivalent to the information that is in the regular `isis.properties` file: 

    public class ToDoSystemInitializer {
        
        public static IsisSystemForTest initIsft() {
            IsisSystemForTest isft = IsisSystemForTest.getElseNull();
            if(isft == null) {
                isft = new ToDoSystemBuilder().build().setUpSystem();
                IsisSystemForTest.set(isft);
            }
            return isft;
        }
    
        private static class ToDoSystemBuilder extends IsisSystemForTest.Builder {
            public ToDoSystemBuilder() {
                withLoggingAt(Level.INFO);
                with(testConfiguration());
                with(new DataNucleusPersistenceMechanismInstaller());
                withServices(
                        new ToDoItemsJdo(),
                        new WrapperFactoryDefault(),
                        new RegisterEntities(),
                        new IsisJdoSupportImpl()
                        );
            }
    
            private IsisConfiguration testConfiguration() {
                // ... elided ...
            }
        }
    }

### Writing a BDD specification ###

BDD specifications contain a few more parts:

* a `XxxSpec.feature` file, describing the feature and the scenarios (given/when/then)s that constitute its acceptance criteria

* a `XxxSpec.java` class file to run the specification (all boilerplate).  This must have the same basename as the `.feature` file

* one or several `XxxStepDefs` constituting the step definitions to be matched against.  (I believe...) these must reside in the same package as the specification.

* a system initializer class.  This can be reused with any integration tests (eg the `ToDoSystemInitializer` class, shown above).

It's usually more convenient to place the `.feature` files in `src/test/java`, rather than `src/test/resources`.  If you wish to do this, then your integration test module's `pom.xml` must contain:
 
    <build>
        <testResources>
            <testResource>
                <filtering>false</filtering>
                <directory>src/test/resources</directory>
            </testResource>
            <testResource>
                <filtering>false</filtering>
                <directory>src/test/java</directory>
                <includes>
                    <include>**</include>
                </includes>
                <excludes>
                    <exclude>**/*.java</exclude>
                </excludes>
            </testResource>
        </testResources>
    </build>

Let's now look at the a specification for the `ToDoItem'`s "completed" feature.  Firstly, the [`ToDoItemSpec_findAndComplete.feature`](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/specs/todoitem/ToDoItemSpec_findAndComplete.feature):

    Feature: Find And Complete ToDo Items

        @integration
        Scenario: Todo items once completed are no longer listed
          Given there are a number of incomplete ToDo items
          When  I choose the first of the incomplete items
          And   mark the item as complete
          Then  the item is no longer listed as incomplete 

The corresponding [`ToDoItemSpec_findAndComplete`](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/specs/todoitem/ToDoItemSpec_findCompletedAndMarkAsNotYetComplete.java) class is just boilerplate:

    @RunWith(Cucumber.class)
    @Cucumber.Options(
            format = {
                    "html:target/cucumber-html-report"
            },
            strict = true,
            tags = { "~@backlog", "~@ignore" })
    public class ToDoItemSpec_findAndComplete {
    }
    
The heavy lifting is done in the [`ToDoItemStepDefs`](https://github.com/apache/isis/blob/master/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/specs/todoitem/ToDoItemStepDefs.java) class:

    public class ToDoItemStepDefs extends CukeStepDefsAbstract {
       
        @Before(value={"@integration"}, order=100)
        public void beforeScenarioIntegrationScope() {
            PropertyConfigurator.configure("logging.properties");
            ToDoSystemInitializer.initIsft();
            
            before(ScenarioExecutionScope.INTEGRATION);
        }
    
        @After
        public void afterScenario(cucumber.api.Scenario sc) {
            assertMocksSatisfied();
            after(sc);
        }
    
        @Before(value={"@integration"}, order=20000)
        public void integrationFixtures() throws Throwable {
            scenarioExecution().install(new ToDoItemsFixture());
        }
        
        // //////////////////////////////////////
    
        @Given("^there are a number of incomplete ToDo items$")
        public void there_are_a_number_of_incomplete_ToDo_items() throws Throwable {
            final List<ToDoItem> notYetComplete = service(ToDoItems.class).notYetComplete();
            assertThat(notYetComplete.isEmpty(), is(false));
            putVar("list", "notYetCompleteItems", notYetComplete);
        }
        
        @When("^I choose the first of the incomplete items$")
        public void I_choose_the_first_one() throws Throwable {
            List<ToDoItem> notYetComplete = getVar(null, "notYetCompleteItems", List.class);
            assertThat(notYetComplete.isEmpty(), is(false));
            
            putVar("todo", "toDoItem", notYetComplete.get(0));
        }
        
        @When("^mark the item as complete$")
        public void mark_it_as_complete() throws Throwable {
            ToDoItem toDoItem = getVar(null, "toDoItem", ToDoItem.class);
            wrap(toDoItem).completed();
        }
        
        @Then("^the item is no longer listed as incomplete$")
        public void the_item_is_no_longer_listed_as_incomplete() throws Throwable {
            ToDoItem toDoItem = getVar(null, "toDoItem", ToDoItem.class);
            whetherNotYetCompletedContains(toDoItem, false);
        }
    
        @Given("^.*completed .*item$")
        public void a_completed_ToDo_item() throws Throwable {
            final List<ToDoItem> allToDos = service(ToDoItems.class).allToDos();
            for (ToDoItem toDoItem : allToDos) {
                if(toDoItem.isComplete()) {
                    putVar("todo", "toDoItem", toDoItem);
                    return;
                }
            }
            Assert.fail("could not locate any completed ToDo items");
        }
    
        @When("^I mark the .*item as not yet complete$")
        public void I_mark_it_as_not_yet_complete() throws Throwable {
            ToDoItem toDoItem = getVar(null, "toDoItem", ToDoItem.class);
            assertThat(toDoItem.isComplete(), is(true));
            
            toDoItem.setComplete(false);
        }
    
        @Then("^the .*item is listed as incomplete$")
        public void the_item_is_listed_as_incomplete() throws Throwable {
            ToDoItem toDoItem = getVar(null, "toDoItem", ToDoItem.class);
            whetherNotYetCompletedContains(toDoItem, true);
        }
    
        private void whetherNotYetCompletedContains(ToDoItem toDoItem, final boolean whetherContained) {
            final List<ToDoItem> notYetComplete = service(ToDoItems.class).notYetComplete();
            assertThat(notYetComplete.contains(toDoItem), is(whetherContained));
        }
    }
    
If you look at the code in the github repo, you will see that the code is slightly more complex than this, because it also uses mocks to enable it to run under `@unit` scope.  

## BDD Tooling ##

To help write feature files and generate step definitions, we recommend [Roberto Lo Giacco's Eclipse plugin](https://github.com/rlogiacco/Natural).  For more information, see Dan's short [blog post](http://danhaywood.com/2013/07/05/cucumber-editors-in-eclipse/).  It works very well.  Of interest: this is implemented using [XText](http://www.eclipse.org/Xtext/). 
