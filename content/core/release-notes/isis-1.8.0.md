Title: isis-1.8.0

Note that Isis 1.8.0 now incorporates the Wicket viewer, which was previously a separately released component.  Other components that are included in core (that were previously released separately are: the Restful Objects viewer, Shiro Security and the JDO/DataNucleus ObjectStore.

<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-284'>ISIS-284</a>] -         Maven plugin to validate domain object model w.r.t. Isis programming conventions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-537'>ISIS-537</a>] -         Convert Wicket viewer to use Bootstrap, so that it can be themed.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-690'>ISIS-690</a>] -         &#39;Show all&#39; button for tables.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-702'>ISIS-702</a>] -         Provide new annotation/facet as a hint for the layout of the label for a property.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-703'>ISIS-703</a>] -         Provide a switch in the Wicket viewer to make the positioning of a fields label either to the left or above the field.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-819'>ISIS-819</a>] -         Wicket viewer should show the environment details so can distinguish if running in productnio vs UAT/systest/dev etc
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-854'>ISIS-854</a>] -         Separator between for menu items
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-874'>ISIS-874</a>] -         Allow individual items to stand out in a collection, eg new reserved method
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-901'>ISIS-901</a>] -         Use @DomainService(repositoryFor=...) as the basis for an implementation of the IconFacet.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-930'>ISIS-930</a>] -         Support use of &quot;font awesome&quot; icons as decoration of actions and also instead of entity icons.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-933'>ISIS-933</a>] -         Allow the RO viewer to be configured so that it can honour or ignore UI hints (in particular, the @Render(EAGERLY) facet).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-951'>ISIS-951</a>] -         Add menu separators (bootstrap dividers) when multiple services define actions on the same menu 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-956'>ISIS-956</a>] -         Allow fa-icons to be specified using pattern matching on member names.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-963'>ISIS-963</a>] -         Allow service actions to be rendered either on a primary, secondary or tertiary (the &quot;me&quot; icon) menu
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-964'>ISIS-964</a>] -         Unify UI hints into @XxxLayout annotations with corresponding support in .layout.json for properties, collections and actions.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-967'>ISIS-967</a>] -         Let the LayoutMetadataReader implementation(s) be configured using isis.properties.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-983'>ISIS-983</a>] -         Embedded Neo4J support
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-985'>ISIS-985</a>] -         Filter collections so that objects that are not visible to the current user are not shown.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-987'>ISIS-987</a>] -         Provide some sort of mechanism to allow users to self-register for an Isis application.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-990'>ISIS-990</a>] -         Optional UserProfileService to allow the user profile information to be customized.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-995'>ISIS-995</a>] -         Allow the label of a property to be rendered as HTML.  Also, allow the label of boolean panels to be rendered on the right hand side.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-999'>ISIS-999</a>] -         Provide a log to administrator of which users logged in and logged out
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1000'>ISIS-1000</a>] -         Allow objects to return CSS  class (analogous to iconName() method) so that their presentation can be dynamically reflected in tables or on an object form.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1016'>ISIS-1016</a>] -         Make it possible to use brand logo instead of plain text in the header
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1024'>ISIS-1024</a>] -         Support imperative validation of a single action parameter argument (as well as of entire parameter args).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1027'>ISIS-1027</a>] -         Raise metamodel validation exceptions if deprecated annotations or method prefixes are used.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1033'>ISIS-1033</a>] -         Extend DomainObjectContainer, add isViewModel(...).
</li>
</ul>
    
<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-568'>ISIS-568</a>] -         Drop support for JDK 1.6, standardize on JDK 1.7.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-650'>ISIS-650</a>] -         Nested Menu Support in Apache ISIS
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-705'>ISIS-705</a>] -         Support actions accepting parameters that return Blobs/Clobs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-755'>ISIS-755</a>] -         Allow external system data to be integrated and managed with an Apache Isis domain object 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-779'>ISIS-779</a>] -         Refactor EventBusService as a @RequestScoped service, and have it own the guava EventBus as a field.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-903'>ISIS-903</a>] -         Improve i18n support (in NamedFacetDecorator etc) to honour client-side locale.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-931'>ISIS-931</a>] -         Make Isis faster to start.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-934'>ISIS-934</a>] -         RO JSON representations should only be pretty-printed if running in prototype mode.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-935'>ISIS-935</a>] -         RO viewer should return a 404 exception if object not found.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-936'>ISIS-936</a>] -         Incorporate the objectstore modules (JDO and in-memory) into core (metamodel and runtime)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-937'>ISIS-937</a>] -         Move TCK out of core
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-938'>ISIS-938</a>] -         Mothball the core-bytecode modules (as no longer used by either objectstore)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-939'>ISIS-939</a>] -         Simplify Persistor and ObjectStore components.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-944'>ISIS-944</a>] -         Minor improvements to TitleBuffer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-948'>ISIS-948</a>] -         Fix concurrent exception in EventBus, improve support for request-scoped services
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-950'>ISIS-950</a>] -         Suppress stack trace from Error page if exception is recognised.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-953'>ISIS-953</a>] -         Minor enhancements to Fixture script execution context
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-955'>ISIS-955</a>] -         Merge JDO Java Type Mapping for Money.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-960'>ISIS-960</a>] -         The event bus swallows errors thrown in the subscribers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-968'>ISIS-968</a>] -         Rationalize handling of menu actions and contributed actions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-969'>ISIS-969</a>] -         Create new @DomainServiceLayout annotation, and move UI hints out of @DomainService
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-970'>ISIS-970</a>] -         Introduce new annotations to collect together all non-UI (layout) hints, and deprecate old annotations
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-972'>ISIS-972</a>] -         Make it possible to set FontAwesome icons after the label for action links
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-973'>ISIS-973</a>] -         Simplify the FixtureScript API so that child fixtures are executed using the ExecutionContext object
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-980'>ISIS-980</a>] -         Do not render empty sub-menu sections in the tertiary actions menu panel 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-981'>ISIS-981</a>] -         Should be able to use the wrapper factory when installing fixtures.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1002'>ISIS-1002</a>] -         Recognize (JDO) exceptions for foreign key constraint violations
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1003'>ISIS-1003</a>] -         Add &quot;veto&quot; as a simpler API for EventBusSubscribers
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1008'>ISIS-1008</a>] -         Make it possible to stream Lobs after using the action prompt
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1012'>ISIS-1012</a>] -         Use the same date and time format across tables and fields
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1014'>ISIS-1014</a>] -         Modal window improvements
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1018'>ISIS-1018</a>] -         Do not allow http session replacement in Wicket because Shiro knowledge becomes outdated
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1019'>ISIS-1019</a>] -         Upgrade dependencies to javassist, org.reflections
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1026'>ISIS-1026</a>] -         Upgrade jetty-console-maven-plugin to 1.56
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1032'>ISIS-1032</a>] -         Contract test for bidirectional relationship can&#39;t handle overridden methods
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1036'>ISIS-1036</a>] -         Inject services into Comparators specified in a @CollectionLayout(sortedBy=...) clause
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1038'>ISIS-1038</a>] -         Extend ActionDomainEvent so that it provides the return value during the Executed phase.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1039'>ISIS-1039</a>] -         XmlSnapshot.Builder interface missing the build() method...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1040'>ISIS-1040</a>] -         Extend FixtureScript / ExecutionContext with defaultParam / checkParam...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1043'>ISIS-1043</a>] -         Enhance fixture script framework with better support for parameters being passed between scripts.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1049'>ISIS-1049</a>] -         Move Wicket viewer under core.
</li>
</ul>
    
                                
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-853'>ISIS-853</a>] -         joda DateTime properties loose time when persisted
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-878'>ISIS-878</a>] -         Wicket viewer escape does not dismiss some (though not all) action dialog boxes
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-881'>ISIS-881</a>] -         Menu service ordering appears to be non-deterministic?
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-897'>ISIS-897</a>] -         Wrong format for org.joda.time.LocalDateTime
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-911'>ISIS-911</a>] -         The blob panel&#39;s &quot;additionalLinks&quot; (for upload and clear buttons) should be hidden in Edit mode.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-941'>ISIS-941</a>] -         Wicket viewer shouldn&#39;t try to flush properties that are disabled.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-942'>ISIS-942</a>] -         Auditing broken for deleted objects.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-943'>ISIS-943</a>] -         ObjectContracts#equals should be more resilient.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-946'>ISIS-946</a>] -         Isis application won&#39;t run from Eclipse
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-954'>ISIS-954</a>] -         Duplicate menu items in the application menu
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-961'>ISIS-961</a>] -         Throwing exception in application code does NOT abort the transaction (it should, of course).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-966'>ISIS-966</a>] -         Restful viewer doesn&#39;t return a JSON representation when hits a 500 internally (instead getting an HTML page)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-971'>ISIS-971</a>] -         Ignore anonymous classes which inherit from @DomainService (eg in integ tests).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1010'>ISIS-1010</a>] -         &quot;Session already open&quot; error if attempting to login in a second browser tab
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1011'>ISIS-1011</a>] -         Select2 component doesn&#39;t filter the suggestions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1017'>ISIS-1017</a>] -         @PreDestroy annotated method is not called
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1029'>ISIS-1029</a>] -         Hidden{where} in layout is not honored by table representations
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1030'>ISIS-1030</a>] -         Not possible for a declarative view model (@ViewModel) to reference another view model/
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1041'>ISIS-1041</a>] -         Under certain circumstances, appears that auditing can cause the same tuple to be audited within a single transaction.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-1042'>ISIS-1042</a>] -         Dropdown of Enums does not honour title() method
</li>
</ul>
                
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-928'>ISIS-928</a>] -         Isis 1.8.0 release tasks
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-959'>ISIS-959</a>] -         Update Jackson dependency from 1.9.11 to 2.4.3
</li>
</ul>
                
<h2>        Sub-task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-512'>ISIS-512</a>] -         Wicket: render icons for actions (if available)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-556'>ISIS-556</a>] -         Re-enable maven-enforcer-plugin before merging ISIS-537 branch to master
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-876'>ISIS-876</a>] -         Action prompt dialog box rendering when title too long...
</li>
</ul>
            
