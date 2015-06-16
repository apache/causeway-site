Title: isis-1.4.0
                   
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-592'>ISIS-592</a>] -         Make XmlSnapshot (in core.runtime) available as an applib service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-593'>ISIS-593</a>] -         MementoService enhancements 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-595'>ISIS-595</a>] -         Validate metamodel to ensure that any bookmarkable actions are explicitly annotated as having safe action semantics.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-601'>ISIS-601</a>] -         Extend the dynamic JSON layout so that the PagedFacet (@Paged annotation) can be specified for collections.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-602'>ISIS-602</a>] -         Extend the dynamic JSON layout so that RenderFacet (@Render annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-603'>ISIS-603</a>] -         Extend the dynamic JSON layout so that NamedFacet (@Named annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-604'>ISIS-604</a>] -         Extend the dynamic JSON layout so that TypicalLengthFacet (@TypicalLength annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-605'>ISIS-605</a>] -         Extend the dynamic JSON layout so that MultiLineFacet (@MultiLine annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-606'>ISIS-606</a>] -         Extend the dynamic JSON layout so that CssClassFacet (@CssClass annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-607'>ISIS-607</a>] -         Extend the dynamic JSON layout so that DescribedAsFacet (@DescribedAs annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-612'>ISIS-612</a>] -         Return a URL from an action opens a new browser window
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-613'>ISIS-613</a>] -         Extend the dynamic JSON layout so that HiddenFacet (@Hidden annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-614'>ISIS-614</a>] -         Extend the dynamic JSON layout so that DisabledFacet (@Disabled annotation) can be specified dynamically
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-624'>ISIS-624</a>] -         Use javax.validation.constraints.Digits to specify length and scale for BigDecimal action parameters (to avoid JDO exceptions later).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-625'>ISIS-625</a>] -         Better reporting of metamodel violation errors
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-648'>ISIS-648</a>] -         Improve support for bulk update
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-652'>ISIS-652</a>] -         Support @RequestScoped beans (registered as services)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-653'>ISIS-653</a>] -         Provide a &quot;Scratchpad&quot; request-scoped service, as a way of passing arbitrary user data from one place to another.  One use case is to coordinate the response of bulk actions.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-654'>ISIS-654</a>] -         Provide a request-scoped QueryResultsCache service, as a technique for performance tuning.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-655'>ISIS-655</a>] -         Deprecate Bulk.InteractionContext, instead use a new request-scoped Bulk.InteractionContextService bean.
</li>
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
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-673'>ISIS-673</a>] -         AbstractIsisSessionTemplate as a way to run arbitrary &#39;runnable&#39; in an Isis session
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-685'>ISIS-685</a>] -         Add new @Command(async=true|false) flag, so that Command is automatically scheduled to run in the background
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-696'>ISIS-696</a>] -         Extra overload for BookmarkService for lookup with downcast (making more consistent with API of MementoService).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-697'>ISIS-697</a>] -         Extend DeveloperUtilitiesService to be able to refresh services (for contributed actions)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-728'>ISIS-728</a>] -         Provide facet factory to enable auditing by default on all objects, unless explicitly opted out
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-729'>ISIS-729</a>] -         Provide facet factory to treat all actions by default as commands, unless explicitly opted out
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-730'>ISIS-730</a>] -         Provide a very simple ClockService, so all services accessed in same way via DI
</li>
</ul>
                            

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-272'>ISIS-272</a>] -         Adding ValueSemanticProviders for UUID and URI
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-541'>ISIS-541</a>] -         Enhance contributed actions/associations to support hideXxx, disableXxx, validateXxx, defaultXxx and choices where the contributee is automatically populated.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-543'>ISIS-543</a>] -         title() should take precedence over @Title, or perhaps should fail eagerly?
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-579'>ISIS-579</a>] -         Add support for range queries in JDO objectstore
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-583'>ISIS-583</a>] -         Contributed collections ignore @Render annotation
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-597'>ISIS-597</a>] -         Services still not injected when entering @PostConstruct methods on a Service
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-598'>ISIS-598</a>] -         Add support for @Inject standard annotation
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-599'>ISIS-599</a>] -         Better message and diagnostics for Exception Recognizers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-600'>ISIS-600</a>] -         Change format of facet properties file, scope by member then facet
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-623'>ISIS-623</a>] -         Make the default logging of JDO and IsisSytemForTest less verbose
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-626'>ISIS-626</a>] -         Recognize Wicket PageExpiredExceptions and display a friendlier error message
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-634'>ISIS-634</a>] -         Drop-downs (for enums/bounded and autocomplete) should honour TypicalLengthFacet.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-639'>ISIS-639</a>] -         Jetty webserver support long URLs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-640'>ISIS-640</a>] -         Extend MementoService.Memento API so that can also return the set of keys held in the Memento
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-651'>ISIS-651</a>] -         Modifications to enable JRebel support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-659'>ISIS-659</a>] -         Extend MementoServiceDefault service to handle Bookmarks and also enums (as well as simple values)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-665'>ISIS-665</a>] -         ObjectActionImpl should escalate a thrown Isis ApplicationException to its underlying cause if the transaction is in a state of mustAbort.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-668'>ISIS-668</a>] -         Improve parsing of isis.services key in the isis.properties file, to allow &quot;commented-out&quot; services.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-670'>ISIS-670</a>] -         Replace AuditingService and AuditingService2 with new AuditingService3 API, more consistent with other APIs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-671'>ISIS-671</a>] -         Add a ReifiableActionFacet and @Reifiable annotation as a way to restrict which ReifiableActions are persisted.  Enable background task service to hint that an ReifiableAction should be persisted even if not annotated.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-672'>ISIS-672</a>] -         Unify BackgroundTask and Interaction into same entity, rename to &quot;ReifiableAction&quot;.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-684'>ISIS-684</a>] -         Rename ReifiableAction to simply &#39;Command&#39;, and update services also
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-693'>ISIS-693</a>] -         Minor extensions in support of Excel import/export functionality.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-708'>ISIS-708</a>] -         BookmarkService null handling
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-723'>ISIS-723</a>] -         BookmarkService should support lookup of domain services as well as domain entities (and throw an exception for view models)
</li>
</ul>


<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-234'>ISIS-234</a>] -         Persistence by reachability of aggregated instances fails.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-619'>ISIS-619</a>] -         Extend IsisActions to support easy mocking of the DOC#newTransientInstance
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-627'>ISIS-627</a>] -         Lazily loaded object cannot be deleted, throws an NPE
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-635'>ISIS-635</a>] -         JDO Publishing Service impl causes ConcurrentModificationException in core.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-636'>ISIS-636</a>] -         BookmarkServiceDefault throws NPE if the BookmarkHolder (to which it contributes a property) returns a null Bookmark
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-641'>ISIS-641</a>] -         Incompatibility of TreeSet for @Bulk. 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-691'>ISIS-691</a>] -         In Wicket viewer, improve drop-down list&#39;s handling of null entity or values
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-700'>ISIS-700</a>] -         Bug in memento service - strings with double spaces get converted into single space  :-(
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-707'>ISIS-707</a>] -         Support Bulk.InteractionContext with contributed actions.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-712'>ISIS-712</a>] -         Inconsistency in domain logic for validation of optional strings causes Wicket viewer to trip up.
</li>
</ul>
                
    
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-695'>ISIS-695</a>] -         Tidy-up tasks for Isis 1.4.0 release
</li>
</ul>
                