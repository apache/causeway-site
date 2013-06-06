Title: Unit Test Support

This module provides unit test helpers for use by all other modules.  There are also utilities that you may find useful in testing your domain objects:

To use, update the `pom.xml`:

<pre>
    &lt;dependency&gt;
        &lt;groupId&gt;org.apache.isis.core&lt;/groupId&gt;
        &lt;artifactId&gt;isis-core-unittestsupport&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>

##Bidirectional Contract Tests [1.3.0-SNAPSHOT]

Automatically tests that bidirectional 1:m or 1:1 associations are being maintained correctly (assuming that they follow the [mutual registration pattern](../applib-guide/how-tos/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html)

{note
Isis provides [Eclipse templates](../getting-started/editor-templates.html) to help generate the necessary boilerplate.
}

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

##JUnitRuleMockery2

An extension to the JMock's `JunitRuleMockery`, providing a simpler API and also providing support for autowiring.

For example, here we see that the class under test, an instance of `CollaboratingUsingSetterInjection`, is automatically wired up with its `Collaborator`:

    public class JUnitRuleMockery2Test_autoWiring_setterInjection_happyCase {
    
        @Rule
        public JUnitRuleMockery2 context = JUnitRuleMockery2.createFor(Mode.INTERFACES_AND_CLASSES);
    
        @Mock
        private Collaborator collaborator;
    
        @ClassUnderTest
        private CollaboratingUsingSetterInjection collaborating;
    
        @Before
        public void setUp() throws Exception {
        	collaborating = context.getClassUnderTest();
        }
        
        @Test
        public void wiring() {
        	assertThat(collaborating.collaborator, is(not(nullValue())));
        }
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
