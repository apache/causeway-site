Title: isis-objectstore-jdo-1.4.0
                               
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-660'>ISIS-660</a>] -         Profiling support and also infrastructure for background (async job) support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-661'>ISIS-661</a>] -         BackgroundService and BackgroundTaskService as a way of creating mementos to execute jobs asynchronously
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-662'>ISIS-662</a>] -         Provide a &quot;contributions&quot; service to add a PublishedEvents contributed collection for the Interaction entity.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-663'>ISIS-663</a>] -         Provide a &quot;contributions&quot; service for AuditEntry, so that audit entries are shown as a contributed collection to the Interaction entity.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-664'>ISIS-664</a>] -         Provide an abstract class for running &quot;sudo&quot; scheduler jobs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-685'>ISIS-685</a>] -         Add new @Command(async=true|false) flag, so that Command is automatically scheduled to run in the background
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-726'>ISIS-726</a>] -         Provide a &#39;Recent changes&#39; contributed action that provides a unified view of commands and audit entries for domain objects.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-728'>ISIS-728</a>] -         Provide facet factory to enable auditing by default on all objects, unless explicitly opted out
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-729'>ISIS-729</a>] -         Provide facet factory to treat all actions by default as commands, unless explicitly opted out
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-576'>ISIS-576</a>] -         JDO exception recognizer for sql integrity constraints should only recognize uniqueness constraints
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-577'>ISIS-577</a>] -         Specify @Column(length=...) for JDO entities (ApplicationSetting, UserSetting, PublishedEvent)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-579'>ISIS-579</a>] -         Add support for range queries in JDO objectstore
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-597'>ISIS-597</a>] -         Services still not injected when entering @PostConstruct methods on a Service
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-599'>ISIS-599</a>] -         Better message and diagnostics for Exception Recognizers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-611'>ISIS-611</a>] -         Ensure classes are properly eagerly registered with JDO Object store
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-616'>ISIS-616</a>] -         JDO Implementation of the AuditingService should implement the AuditingService2 API
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-623'>ISIS-623</a>] -         Make the default logging of JDO and IsisSytemForTest less verbose
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-651'>ISIS-651</a>] -         Modifications to enable JRebel support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-657'>ISIS-657</a>] -         JDO objectstore service implemenations should use &quot;IsisXxx&quot; as a common prefix to any tables.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-665'>ISIS-665</a>] -         ObjectActionImpl should escalate a thrown Isis ApplicationException to its underlying cause if the transaction is in a state of mustAbort.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-667'>ISIS-667</a>] -         General tidy-up/rationalization of JDO domain service impls
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-670'>ISIS-670</a>] -         Replace AuditingService and AuditingService2 with new AuditingService3 API, more consistent with other APIs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-671'>ISIS-671</a>] -         Add a ReifiableActionFacet and @Reifiable annotation as a way to restrict which ReifiableActions are persisted.  Enable background task service to hint that an ReifiableAction should be persisted even if not annotated.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-672'>ISIS-672</a>] -         Unify BackgroundTask and Interaction into same entity, rename to &quot;ReifiableAction&quot;.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-684'>ISIS-684</a>] -         Rename ReifiableAction to simply &#39;Command&#39;, and update services also
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-698'>ISIS-698</a>] -         Allow JDOQL to be able to select scalars (eg project individual field(s)) rather than entire entities.
</li>
</ul>
    

<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-632'>ISIS-632</a>] -         PublishingService&#39;s PublishedEvent id has an incorrect max length
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-644'>ISIS-644</a>] -         Update FrameworkSynchronizer to avoid the &quot;Object not yet known to Isis&quot; exception
</li>
</ul>
    
<h2>        Dependency upgrade
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-646'>ISIS-646</a>] -         Upgrade DataNucleus to 3.3.6 (JDO 3.1), and use the convenience &#39;accessplatform&#39; POMs.
</li>
</ul>
            
                            
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-695'>ISIS-695</a>] -         Tidy-up tasks for Isis 1.4.0 release
</li>
</ul>
                
