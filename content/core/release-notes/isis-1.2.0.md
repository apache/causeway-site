Title: isis-1.2.0
                   
<h2>New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-323'>ISIS-323</a>] -         Provide the capability to publish events, either changed objects or invoked actions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-327'>ISIS-327</a>] -         Initialize and shutdown domain services
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-344'>ISIS-344</a>] -         Automatically exclude &quot;parent references&quot; from parented collections.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-351'>ISIS-351</a>] -         Provide the ability for certain runtime exceptions to be recognized as non-fatal, for rendering to the user.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-356'>ISIS-356</a>] -         Allow &#39;inject&#39; to be used as a prefix for injecting services into entities, fixtures or other services.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-360'>ISIS-360</a>] -         About page on wicket viewer should show version, build number and other details.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-367'>ISIS-367</a>] -         Refactor to support JTA transactions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-377'>ISIS-377</a>] -         Publishing Service implementation that writes to a queue (using JDO).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-378'>ISIS-378</a>] -         IsisServices - a service for prototyping that allows access into the internals of the Isis runtime
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-380'>ISIS-380</a>] -         Enhance BookmarkService API to allow objects to be looked up directly (rather than by dint of a BookmarkHolder)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-407'>ISIS-407</a>] -         Annotation to automatically adjust end dates of ranges so that they are shown as inclusive vs exclusive.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-409'>ISIS-409</a>] -         Move the &#39;wrapper&#39; progmodel component into core, reworked as an optional service
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-208'>ISIS-208</a>] -         If two services accidentally have the same Id, then should throw an exception.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-326'>ISIS-326</a>] -         Make Datanucleus JNDI aware
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-330'>ISIS-330</a>] -         Wicket viewer calls choices method while figuring out how to render properties.  Should call less often (if not at all).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-331'>ISIS-331</a>] -         Explicitly specify project.build.sourceEncoding for both Isis and the quickstart archetype
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-343'>ISIS-343</a>] -         Introduce @Render annotation and deprecate @Resolve
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-345'>ISIS-345</a>] -         Move the Bookmark service in the applib to a different package
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-353'>ISIS-353</a>] -         compareTo methods (when implement Comparable) should be automatically hidden
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-358'>ISIS-358</a>] -         Should be able to delete objects even if they are not versioned.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-362'>ISIS-362</a>] -         Upgrade to JMock 2.6.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-364'>ISIS-364</a>] -         Suppress components of title when rendered in a parented collection.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-366'>ISIS-366</a>] -         Core unit testing support JUnitRuleMockery2 does not support autoinjection of setters
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-386'>ISIS-386</a>] -         Provide the ability to force a reload of an object by the JDO objectstore, and provide a domain service for clients.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-387'>ISIS-387</a>] -         Enhance PublishingService and AuditingService for created and deleted objects (as well as just updated objects).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-396'>ISIS-396</a>] -         Wicket/JDO handling of BigDecimal properties should honour the @Column&#39;s scale attribute.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-397'>ISIS-397</a>] -         Change default AuditingService impl to write to stderr, not stdout
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-398'>ISIS-398</a>] -         Extend applib&#39;s Clock interface to also return time as Joda LocalDate or LocalDateTime
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-403'>ISIS-403</a>] -         Improve the bookmarks in the Wicket viewer.
</li>
</ul>
 
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-359'>ISIS-359</a>] -         Bulk actions being shown even if action is not a no-arg...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-408'>ISIS-408</a>] -         Auditing should ignore non-persistable properties (annotated with @NotPersisted).
</li>
</ul>
                                    
                   