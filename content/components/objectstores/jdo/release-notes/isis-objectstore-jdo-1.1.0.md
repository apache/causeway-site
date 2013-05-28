Title: isis-objectstore-jdo-1.0.0
                               
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-370'>ISIS-370</a>] -         Provide a service to allow all @PersistenceCapable entities to be eagerly registered with Isis (and therefore with DataNucleus)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-377'>ISIS-377</a>] -         Publishing Service implementation that writes to a queue (using JDO).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-379'>ISIS-379</a>] -         Move AuditingService out of the ToDo app demo and into JDO objectstore as a service impl.
</li>
</ul>



                                            
<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-270'>ISIS-270</a>] -         NotYetImplementedException in JDO objectstore when debug logging enabled
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-326'>ISIS-326</a>] -         Make Datanucleus JNDI aware
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-362'>ISIS-362</a>] -         Upgrade to JMock 2.6.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-376'>ISIS-376</a>] -         Enhance JDO objectstore to also support IdentityType.APPLICATION (as well as DATASTORE)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-386'>ISIS-386</a>] -         Provide the ability to force a reload of an object by the JDO objectstore, and provide a domain service for clients.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-387'>ISIS-387</a>] -         Enhance PublishingService and AuditingService for created and deleted objects (as well as just updated objects).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-389'>ISIS-389</a>] -         Ensure that objects lazily loaded by JDO/DataNucleus get domain services injected into them consistently.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-391'>ISIS-391</a>] -         Upgrade JDO objectstore to Datanucleus 3.2.1
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-396'>ISIS-396</a>] -         Wicket/JDO handling of BigDecimal properties should honour the @Column&#39;s scale attribute.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-303'>ISIS-303</a>] -         Migration of DataNucleus (DN) type support to use DN v3.2 standard
</li>
</ul>
 




<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-296'>ISIS-296</a>] -         wicket viewer display ??? ENTITYMODEL OBJECTADAPTER OID: NULL when view a root entity&#39;s  collection member which data type is primitive String.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-301'>ISIS-301</a>] -         Error when using class name as discriminator strategy
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-302'>ISIS-302</a>] -         Ensure related items are mapped into pojo (possible eager loading of parent/child relationship)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-321'>ISIS-321</a>] -         gracefully handle any constraint violation thrown by the DataNucleus persistence mechanism (to be handled by JDO ObjectStore &amp; Wicket)
</li>
</ul>
