Title: isis-1.5.0
                   
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-550'>ISIS-550</a>] -         Complete the guava EventBus support with new annotations
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-776'>ISIS-776</a>] -         FixtureScripts service as means of doing fixture management for end-to-end stories.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-786'>ISIS-786</a>] -         Allow event bus subscribers to veto interactions by throwing a RecoverableException or NonRecoverableException
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-569'>ISIS-569</a>] -         Fix JMock to support JDK7 (JavassistImposteriser)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-745'>ISIS-745</a>] -         Do not suppress the org.apache.isis classes from the &quot;download metamodel&quot; action (as provided by DeveloperUtilities service)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-749'>ISIS-749</a>] -         Make logging less noisy for selected classes
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-762'>ISIS-762</a>] -         For commands on contributed actions, the target and &quot;user friendly&quot; target details should be captured as the contributee, not the contributed service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-765'>ISIS-765</a>] -         Allow UserMemento#hasRole to match on wildcards
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-770'>ISIS-770</a>] -         Remove dependency on wicket-ioc (because brings in cglib/asm dependency)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-772'>ISIS-772</a>] -         Reimplement WrapperFactory to use javassist instead of cglib/asm (for Java7 support)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-782'>ISIS-782</a>] -         Integration testing framework should automatically install the FixtureClock singleton rather than the regular Clock
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-783'>ISIS-783</a>] -         Integration test support enhancements
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-795'>ISIS-795</a>] -         disable persistence-by-reachability-at-commit in the archetypes.
</li>
</ul>
    
                            
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-758'>ISIS-758</a>] -         Auditing should be able to cope with a change to a property where the referenced object has been deleted.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-759'>ISIS-759</a>] -         Transient errors being logged as result of incorrect call to sendRedirect; not sure why, need diagnostics.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-760'>ISIS-760</a>] -         IllegalStateException when commands/audit enabled in Estatio and failing to persist the Oid of a view model.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-769'>ISIS-769</a>] -         IsisTransaction should do a &quot;precommit&quot; for pending updates to applib services, prior to commiting the underlying (JDO) transaction.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-777'>ISIS-777</a>] -         RO Viewer is not thread-safe for concurrent requests.
</li>
</ul>

                
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-751'>ISIS-751</a>] -         Update NOTICE copyright dates
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-792'>ISIS-792</a>] -         Tidy-up tasks for Isis 1.5.0 release
</li>
</ul>
                