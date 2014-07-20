Title: isis-1.6.0
                
<i>Isis core 1.6.0 also incorporates the Restful Objects viewer, Shiro Security and JDO Objectstore.</i>

<h2>        New Feature
</h2>

<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-493'>ISIS-493</a>] -         Annotation to identify domain services/repositories
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-800'>ISIS-800</a>] -         Wizard-like form for Wicket viewer
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-813'>ISIS-813</a>] -         Provide the ability to mock out domain services in integration tests.
</li>
</ul>
                                
<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-421'>ISIS-421</a>] -         Write TCK tests for Restful Objects viewer
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-574'>ISIS-574</a>] -         Upgrade isis-security-shiro to use shiro 1.2.3 (currently using 1.2.1)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-798'>ISIS-798</a>] -         Minor improvements in support of integration testing.
</li>
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-823'>ISIS-823</a>] -         Restructure Todo&#39;s tests, nested static classes.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-827'>ISIS-827</a>] -         Introduce WrappingObject, with more unique method names, as a replacement for WrappedObject.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-831'>ISIS-831</a>] -         Extend (custom) EventBus vetoing logic so that can also encompass hide, disable, validate.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-832'>ISIS-832</a>] -         Move jdo, shiro and restful into core
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-833'>ISIS-833</a>] -         Break out applib and JDO services into modules
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-838'>ISIS-838</a>] -         Provide an additional hook method for AbstractIsisSessionTemplate that automatically sets up the transaction.
</li>
</ul>
    
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-796'>ISIS-796</a>] -         lifecycle callback &quot;updating()&quot; is not firing
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-797'>ISIS-797</a>] -         &#39;Restful objects&#39; decodes json request body while this is not 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-801'>ISIS-801</a>] -         Action method taking domain object paramater gets triggered automatically whenever instances of that object type is accessed
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-812'>ISIS-812</a>] -         Isis 1.5 blob mapping broken for PostgreSQL (when set to null)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-818'>ISIS-818</a>] -         wrapSkipRules does not execute action due to being hidden
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-821'>ISIS-821</a>] -         Precision gets lost when double values are use in BigDecimal attributes
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-824'>ISIS-824</a>] -         Generic repository is broken
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-828'>ISIS-828</a>] -         Wrapping an already wrapped object should honour the mode if different.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-836'>ISIS-836</a>] -         Not certain that FixtureScripts&#39; ClassDiscoveryService works when referencing deployed 1.5.0 JAR
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-840'>ISIS-840</a>] -         &quot;Permission groups&quot; for IsisPermission (custom security string for Shiro) not working as advertised.
</li>
</ul>
    
<h2>        Dependency upgrade
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-716'>ISIS-716</a>] -         Update to DN 3.3.8 (deferred)
</li>
</ul>
            
<h2>        Task (Core)
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-751'>ISIS-751</a>] -         Update NOTICE copyright dates
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-839'>ISIS-839</a>] -         1.6.0 release tasks
</li>
</ul>
                