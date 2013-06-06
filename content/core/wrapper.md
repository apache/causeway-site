Title: Wrapper Factory

{stub
This is a stub.  However there is some material on the [Integration Testing](integtestsupport.html) page
}

The 'wrapper' factory provides the ability for domain objects to be wrapped such that interactions between domain objects can be "as if" through the viewer. (In other words, business rule constraints are applied).  This is typically used within integration tests (though could be used in production code in certain circumstances; somewhat akin to interacting through an EJB local interface).

The service is defined through the `WrapperFactory` API, defined in the core applib.

To use, update the `pom.xml`:

<pre>
    &lt;dependency&gt;
        &lt;groupId&gt;org.apache.isis.core&lt;/groupId&gt;
        &lt;artifactId&gt;isis-core-wrapper&lt;/artifactId&gt;
    &lt;/dependency&gt;
</pre>
