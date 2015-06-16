Title: isis-1.7.0
                
                
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-809'>ISIS-809</a>] -         Provide implementation of ViewModelFacet that doesn&#39;t require explicit implementation of the IViewModel interface.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-873'>ISIS-873</a>] -         CommandContext.getCommand() should also expose the ActionInteractionEvent.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-917'>ISIS-917</a>] -         Support pluggable representations for the RO viewer (object and list representations)
</li>
</ul>
                

<h2>        Security fixes
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-846'>ISIS-846</a>] -         Enhance ExceptionRecognizer so that the stack trace can be suppressed in certain circumstances (for security)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-895'>ISIS-895</a>] -         HomePage should honour authorization rules.
</li>
</ul>



<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-864'>ISIS-864</a>] -         Command should be persisted if any dirty objects enlisted into transaction, in order to ensure no accidental orphans.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-866'>ISIS-866</a>] -         Request-scoped service should be told when the request is starting and stopping.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-882'>ISIS-882</a>] -         Appropriate facets should be copied over to contributed collections and properties.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-907'>ISIS-907</a>] -         Enums drop-downs are truncated... the (derived) typical length for enums uses the name() rather than the toString()
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-908'>ISIS-908</a>] -         Enhance FixtureScript service, support &quot;non-strict&quot; mode
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-916'>ISIS-916</a>] -         Provide a mechanism so that framework-provided services, such as MementoService or BookmarkService, can be overridden by the developer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-918'>ISIS-918</a>] -         Remove special-case handling of DomainObjectContainer; is just another service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-927'>ISIS-927</a>] -         BookmarkService should be WrapperFactory aware...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-805'>ISIS-805</a>] -         (Mac and Linux) Class discovery service throws errors on startup
</li>
</ul>
    

                
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-404'>ISIS-404</a>] -         Testing if a &quot;wrapped&quot; Domain Object has been persisted fails
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-643'>ISIS-643</a>] -         FrameworkSynchronizer throws NPE on delete of child entity in 1-N relationship
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-852'>ISIS-852</a>] -         Derived property cannot be written properly
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-871'>ISIS-871</a>] -         NPE - ActionInvocationFacetForInteractionAbstract passes Null to &quot;ObjectSpecification.isViewModelCloneable&quot;
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-879'>ISIS-879</a>] -         ObjectMemberAbstract#isAlwaysHidden() does not honour where=Where.EVERYWHERE.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-899'>ISIS-899</a>] -         Can&#39;t return a view model in Isis 1.6.0 over RO viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-905'>ISIS-905</a>] -         Transaction handling fix, if throw exception on flush for no-arg action.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-912'>ISIS-912</a>] -         Not possible to specify the fixtures to be loaded from the command line (ie --fixture flag is broken).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-919'>ISIS-919</a>] -         Don&#39;t &quot;touch&quot; a (request-scoped) service when logging in DEBUG mode.
</li>
</ul>


<h2>        Removed features - available in <a href="http://www.isisaddons.org">isiaddons.org</a>
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-851'>ISIS-851</a>] -         Remove modules from Isis core (available instead through isisaddons).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-887'>ISIS-887</a>] -         Mothball the o.a.isis.core:isis-module-xxx modules, as now in isisaddons.
</li>
</ul>


<h2>        Removed features (obsolete)
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-802'>ISIS-802</a>] -         Remove the ProfileStore component (in future, can raise a ProfileService as and when we identify a concrete reqt).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-913'>ISIS-913</a>] -         Remove the &quot;ViewerInstaller&quot; and &quot;EmbeddedWebServerInstaller&quot; APIs, since in effect defunct.
</li>
</ul>

                
<h2>        Unreleased features (Implemented but then backed out)
</h2>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-865'>ISIS-865</a>] -         Either warn or fail-fast if an action is annotated with safe semantics but nevertheless results in dirty objects in the xactn.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-921'>ISIS-921</a>] -         Disable &quot;ensure safe semantics&quot; feature (ISIS-865), since does not cater for edits with contributed properties.
</li>


<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-872'>ISIS-872</a>] -         1.7.0 release activities
</li>
</ul>
                

