Title: Integration testing Support

> See also Isis' [BDD support](specsupport-and-integtestsupport.html).

The `isis-core-integtestsupport` module provides the ability to bootstrap Isis within a JUnit testing framework, using any object store.  This is done using a JUnit rule.

In addition, the UI can be integration tested by "wrapping" each domain object in a proxy.  This proxy ensures that the "see it/use it/do it" rules (ie to hide, disable, or validate) are enforced.  The wrapping is performed using the [WrapperFactory](../reference/services/wrapper-factory.html), part of Isis core.

To use, update the `pom.xml`:

    <dependency>
        <groupId>org.apache.isis.core</groupId>
        <artifactId>isis-core-integtestsupport</artifactId>
    </dependency>
    <dependency>
        <groupId>org.apache.isis.core</groupId>
        <artifactId>isis-core-wrapper</artifactId>
    </dependency>

A full example is provided in the [simpleapp archetype](../intro/getting-started/simpleapp-archetype.html).  But to briefly explain; the recommended approach is to create an abstract class for all your integration tests.  Here's an example derived from the Isis addons example [todoapp](https://github.com/isisaddons/isis-app-todoapp/) (not ASF):

    public abstract class AbstractIntegTest {

        @Inject
        protected ToDoItems toDoItems;
        @Inject
        protected WrapperFactory wrapperFactory;
        @Inject
        protected DomainObjectContainer container;
    
        @Rule
        public JUnitRuleMockery2 context = JUnitRuleMockery2.createFor(Mode.INTERFACES_AND_CLASSES);
        
        @Rule
        public IsisSystemForTestRule bootstrapIsis = new IsisSystemForTestRule();
    
        @Rule
        public ExpectedException expectedExceptions = ExpectedException.none();
    
        /**
         * Same running system returned for all tests, set up with {@link ToDoItemsFixture}.
         * 
         * <p>
         * The database is NOT reset between tests.
         */
        public IsisSystemForTest getIsft() {
            return bootstrapIsis.getIsisSystemForTest();
        }
    
        protected <T> T wrap(T obj) {
            return wrapperFactory.wrap(obj);
        }
    
        protected <T> T unwrap(T obj) {
            return wrapperFactory.unwrap(obj);
        }
    
        // other boilerplate omitted
    }    

Each of the integration tests then inherit from this abstract class.  For example, here's a test of the `ToDoItem`'s `completed()` action:
    
    public class ToDoItem_completed extends AbstractIntegTest {
    
        private ToDoItem toDoItem;
        private boolean isComplete;
    
        @Before
        public void setUp() throws Exception {
            // given
            final List<ToDoItem> all = wrap(toDoItems).notYetComplete();
            toDoItem = wrap(all.get(0));
    
            // to reset after
            isComplete = toDoItem.isComplete();
        }
    
        @After
        public void tearDown() throws Exception {
            unwrap(toDoItem).setComplete(isComplete);
        }
    
        @Test
        public void happyCase() throws Exception {
            
            // given
            assertThat(toDoItem.isComplete(), is(false));
            
            // when
            toDoItem.completed();
            
            // then
            assertThat(toDoItem.isComplete(), is(true));
        }
    
        @Test
        public void cannotCompleteIfAlreadyCompleted() throws Exception {
            
            // given
            unwrap(toDoItem).setComplete(true);
    
            // when, then should fail
            expectedExceptions.expectMessage("Already completed");
            toDoItem.completed();
        }
    
        @Test
        public void cannotSetPropertyDirectly() throws Exception {
            
            // given
    
            // when, then should fail
            expectedExceptions.expectMessage("Always disabled");
            toDoItem.setComplete(true);
        }
    }

Note that when the `ToDoItem` is wrapped, it is not possible to call `setComplete()` directly on the object; but when it is unwrapped then this call can be made as per normal.

The full source code, plus other example tests, can be found [here](https://github.com/apache/isis/tree/3dcfb2fcd61636ff2fac66a3c7c54a500fdf2c6a/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/tests).
