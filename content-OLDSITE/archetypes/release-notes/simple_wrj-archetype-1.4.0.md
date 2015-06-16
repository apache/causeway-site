Title: simple-wrj-archetype-1.4.0

Uses:

* Isis Core 1.4.0
* Wicket 1.4.0
* JDO 1.4.0
* Restful 2.2.0
* Shiro 1.4.0


<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-592'>ISIS-592</a>] -         Make XmlSnapshot (in core.runtime) available as an applib service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-593'>ISIS-593</a>] -         MementoService enhancements 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-595'>ISIS-595</a>] -         Validate metamodel to ensure that any bookmarkable actions are explicitly annotated as having safe action semantics.
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
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-578'>ISIS-578</a>] -         Simple archetype&#39;s links to source code in github mirror is incorrect.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-585'>ISIS-585</a>] -         Fix links in simple archetype html welcome text
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

