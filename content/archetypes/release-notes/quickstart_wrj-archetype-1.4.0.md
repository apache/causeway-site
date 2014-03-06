Title: quickstart-wrj-archetype-1.4.0

Uses:

* Isis Core 1.4.0
* Wicket 1.4.0
* JDO 1.4.0
* Restful 2.2.0
* Shiro 1.4.0


<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-586'>ISIS-586</a>] -         Allow the IsisLdapRealm to read its role/perm mappings from an .ini file
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-592'>ISIS-592</a>] -         Make XmlSnapshot (in core.runtime) available as an applib service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-593'>ISIS-593</a>] -         MementoService enhancements 
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
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-649'>ISIS-649</a>] -         In wicket viewer, make it easier to develop custom styling by wrapping the body of all pages in a div with custom style
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-660'>ISIS-660</a>] -         Profiling support and also infrastructure for background (async job) support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-685'>ISIS-685</a>] -         Add new @Command(async=true|false) flag, so that Command is automatically scheduled to run in the background
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-730'>ISIS-730</a>] -         Provide a very simple ClockService, so all services accessed in same way via DI
</li>
</ul>

            
<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-590'>ISIS-590</a>] -         Wicket viewer strip wicket tags should depend on the deployment mode.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-598'>ISIS-598</a>] -         Add support for @Inject standard annotation
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-599'>ISIS-599</a>] -         Better message and diagnostics for Exception Recognizers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-611'>ISIS-611</a>] -         Ensure classes are properly eagerly registered with JDO Object store
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-665'>ISIS-665</a>] -         ObjectActionImpl should escalate a thrown Isis ApplicationException to its underlying cause if the transaction is in a state of mustAbort.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-667'>ISIS-667</a>] -         General tidy-up/rationalization of JDO domain service impls
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-668'>ISIS-668</a>] -         Improve parsing of isis.services key in the isis.properties file, to allow &quot;commented-out&quot; services.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-671'>ISIS-671</a>] -         Add a ReifiableActionFacet and @Reifiable annotation as a way to restrict which ReifiableActions are persisted.  Enable background task service to hint that an ReifiableAction should be persisted even if not annotated.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-672'>ISIS-672</a>] -         Unify BackgroundTask and Interaction into same entity, rename to &quot;ReifiableAction&quot;.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-684'>ISIS-684</a>] -         Rename ReifiableAction to simply &#39;Command&#39;, and update services also
</li>
</ul>
    

    <h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-691'>ISIS-691</a>] -         In Wicket viewer, improve drop-down list&#39;s handling of null entity or values
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
                