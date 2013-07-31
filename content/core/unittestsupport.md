Title: Unit Test Support

This module provides unit test helpers for use by all other modules.  There are also utilities that you may find useful in testing your domain objects:

To use, update the `pom.xml`:

<pre>
    &lt;dependency&gt;
        &lt;groupId&gt;org.apache.isis.core&lt;/groupId&gt;
        &lt;artifactId&gt;isis-core-unittestsupport&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>


##SortedSets Contract Test [1.3.0-SNAPSHOT]

This contract test automatically checks that all fields of type `java.util.Collection` are declared as `java.util.SortedSet`.  In other words, it precludes either `java.util.List` or `java.util.Set` from being used as a collection.


For example, the following passes the contract test:

    public class Department {
        
        private SortedSet<Employee> employees = new TreeSet<Employee>();
    
        ...
    }

whereas this would not:

    public class SomeDomainObject {
        
        private List<Employee> employees = new ArrayList<Employee>();
    
        ...
    }

If using the JDO Objectstore then we strongly recommend that you implement this test, for several reasons:

* First, `Set`s align more closely to the relational model than do `List`s.  A `List` must have an additional index to specify order.

* Second, `SortedSet` is preferable to `Set` because then the order is well-defined and predictable (to an end user, to the programmer).

    The [ObjectContracts](../applib-guide/reference/Utility.html) utility class substantially simplifies the task of implementing `Comparable` in your domain classes. 

* Third, if the relationship is bidirectional then JDO/Objectstore will automatically maintain the relationship.  See [here](../components/objectstores/jdo/managed-1-to-m-relationships.html) for further discussion.    

To use the contract test, subclass `SortedSetsContractTestAbstract`, specifying the root package to search for domain classes.

For example:

    public class SortedSetsContractTestAll extends SortedSetsContractTestAbstract {
    
        public SortedSetsContractTestAll() {
            super("org.estatio.dom");
            withLoggingTo(System.out);
        }
    }

##Injected Services Method Contract Test [1.3.0-SNAPSHOT]

It is quite common for some basic services to be injected in a project-specific domain object superclass; for example a `ClockService` might generally be injected everywhere:

    public abstract class EstatioDomainObject {
        protected ClockService clockService;
        public void injectClockService(ClockService clockService) {
            this.clockService = clockService;
        }
    }

If a subclass inadvertantly overrides this method and provides its own `ClockService` field, then the field in the superclass will never initialized.  As you might imagine, `NullPointerException`s could then arise.

This contract test automatically checks that the `injectXxx(...)` method, to allow for injected services, is not overridable, ie `final`.

To use the contract test, , subclass `SortedSetsContractTestAbstract`, specifying the root package to search for domain classes.

For example:

    public class InjectServiceMethodMustBeFinalContractTestAll extends InjectServiceMethodMustBeFinalContractTestAbstract {
    
        public InjectServiceMethodMustBeFinalContractTestAll() {
            super("org.estatio.dom");
            withLoggingTo(System.out);
        }
    }


##Bidirectional Contract Test [1.3.0-SNAPSHOT]

This contract test automatically checks that bidirectional 1:m or 1:1 associations are being maintained correctly (assuming that they follow the [mutual registration pattern](../applib-guide/how-tos/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)

>**Note:** 
>
>If using the [JDO Object Store](../components/objectstores/jdo/about.html), then there is generally no need to programmatically maintain 1:m relationships (indeed it may introduce subtle errors).  For more details, see [here](../components/objectstores/jdo/managed-1-to-m-relationships.html).
>
>If *not* using the JDO Object Store, note that *Isis* provides [Eclipse templates](../getting-started/editor-templates.html) to help generate the necessary boilerplate.


For example, suppose that `ParentDomainObject` and `ChildDomainObject` have a 1:m relationship (`ParentDomainObject#children` / `ChildDomainObject#parent`), and also `PeerDomainObject` has a 1:1 relationship with itself (`PeerDomainObject#next` / `PeerDomainObject#previous`).  

The following will exercise these relationships:

    public class BidirectionalRelationshipContractTestAll
            extends BidirectionalRelationshipContractTestAbstract {
    
        public BidirectionalRelationshipContractTestAll() {
            super("org.apache.isis.core.unittestsupport.bidir", 
                    ImmutableMap.<Class<?>,Instantiator>of(
                        ChildDomainObject.class, new InstantiatorForChildDomainObject(),
                        PeerDomainObject.class, new InstantiatorSimple(PeerDomainObjectForTesting.class)
                    ));
            withLoggingTo(System.out);
        }
    }

The first argument to the constructor scopes the search for domain objects; usually this would be something like `"com.mycompany.dom"`.

The second argument provides a map of `Instantiator` for certain of the domain object types.  This has two main purposes.  First, for abstract classes, it nominates an alternative concrete class to be instantiated.  Second, for classes (such as `ChildDomainObject`) that are `Comparable` and are held in a `SortedSet`), it provides the ability to ensure that different instances are unique when compared against each other.  If no `Instantiator` is provided, then the contract test simply attempts to instantiates the class.

If any of the supporting methods (`addToXxx()`, `removeFromXxx()`, `modifyXxx()` or `clearXxx()`) are missing, the relationship is skipped.

To see what's going on (and to identify any skipped relationships), use the `withLoggingTo()` method call.  If any assertion fails then the error should be descriptive enough to figure out the problem (without enabling logging).

The example tests can be found [here](https://github.com/apache/isis/tree/master/core/unittestsupport/src/test/java/org/apache/isis/core/unittestsupport/bidir).

##JUnitRuleMockery2 (enhanced in [1.3.0-SNAPSHOT])

An extension to the JMock's `JunitRuleMockery`, providing a simpler API and also providing support for autowiring.

For example, here we see that the class under test, an instance of `CollaboratingUsingSetterInjection`, is automatically wired up with its `Collaborator`:

    public class JUnitRuleMockery2Test_autoWiring_setterInjection_happyCase {
    
        @Rule
        public JUnitRuleMockery2 context = JUnitRuleMockery2.createFor(Mode.INTERFACES_AND_CLASSES);
    
        @Mock
        private Collaborator collaborator;
    
        @ClassUnderTest
        private CollaboratingUsingSetterInjection collaborating;
    
        @Test
        public void wiring() {
        	assertThat(collaborating.collaborator, is(not(nullValue())));
        }
    }

Prior to 1.3.0-SNAPSHOT, it is necessary to manually lookup the `@ClassUnderTest` instance from the `context`:

        @Before
        public void setUp() throws Exception {
        	collaborating = context.getClassUnderTest();
        }


The example tests can be found [here](https://github.com/apache/isis/tree/master/core/unittestsupport/src/test/java/org/apache/isis/core/unittestsupport/jmocking)

##ValueTypeContractTestAbstract

Automatically tests that a custom value type implements `equals()` and `hashCode()` correctly.

For example, testing JDK's own `java.math.BigInteger` can be done as follows:

    public class ValueTypeContractTestAbstract_BigIntegerTest extends ValueTypeContractTestAbstract<BigInteger> {
    
        @Override
        protected List<BigInteger> getObjectsWithSameValue() {
            return Arrays.asList(new BigInteger("1"), new BigInteger("1"));
        }
    
        @Override
        protected List<BigInteger> getObjectsWithDifferentValue() {
            return Arrays.asList(new BigInteger("2"));
        }
    }

The example unit tests can be found [here](https://github.com/apache/isis/tree/master/core/unittestsupport/src/test/java/org/apache/isis/core/unittestsupport/value).
