Title: isis-1.3.0
                   
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-420'>ISIS-420</a>] -         Application-level settings service and a user-level settings service.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-423'>ISIS-423</a>] -         Provide contract test utility for the automatic testing of 1:m and 1:1 bidirectional relationships
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-426'>ISIS-426</a>] -         Provide abstract contract test to easily verify Comparable implementations.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-427'>ISIS-427</a>] -         An application setting service (both global and user-specific), with JDO implementation.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-430'>ISIS-430</a>] -         Allow the sort order for SortedSet parented collections to be overridden with a new @SortedBy annotation.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-433'>ISIS-433</a>] -         Provide context-specific autoComplete through prefixed methods on actions parameters (cf choices method).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-434'>ISIS-434</a>] -         Provide context-specific autoComplete through prefixed methods on properties
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-440'>ISIS-440</a>] -         Contributed collections to allow decoupling
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-441'>ISIS-441</a>] -         Helper classes in the applib to implement common object contracts (toString, equals, hashCode, compareTo)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-446'>ISIS-446</a>] -         A new DeveloperUtilitiesService to download the metamodel as a CSV spreadsheet
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-450'>ISIS-450</a>] -         Provide an EventBusService (based on guava) for decoupled intra-session interaction between entities.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-452'>ISIS-452</a>] -         New @PostsPropertyChangedEvent annotation to post a PropertyChangedEvent via EventBusService
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-457'>ISIS-457</a>] -         New annotation @CssClass for class member, should render in the HTML markup for that member.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-461'>ISIS-461</a>] -         Provide the ability to run arbitrary fixtures (implementing the applib&#39;s InstallableFixture) in integration tests 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-463'>ISIS-463</a>] -         Enhance unittestsupport and integtestsupport to enable Cucumber-JVM specs to be written (at  unit- or integration-scope, respectively)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-468'>ISIS-468</a>] -         Provide better layout management of pages in the Wicket viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-469'>ISIS-469</a>] -         Provide implementations of certain layout facets that read from a &quot;Xxx.layout.properties&quot; file
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-470'>ISIS-470</a>] -         Provide the ability to rebuild the metamodel for individual classes, thus allowing dynamic layout capability...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-475'>ISIS-475</a>] -         Dynamic layout using JSON, using an Xxx.layout.json file
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-478'>ISIS-478</a>] -         Provide conditional choices, defaults and validation between action parameters
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-484'>ISIS-484</a>] -         Contract test for ensuring that injectXxx methods are final and not overridable
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-497'>ISIS-497</a>] -         Allow service actions to be rendered as contributed collections or as contributed properties.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-518'>ISIS-518</a>] -         Support Guava&#39;s Predicate API for allMatches etc in the applib; deprecate the Filter&lt;T&gt; API.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-553'>ISIS-553</a>] -         Provide view model support, as sketched out in the Restful Objects spec
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-554'>ISIS-554</a>] -         Automatically render a &quot;Dashboard&quot; service (perhaps one annotated with @Dashboard) as an object in the Wicket viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-559'>ISIS-559</a>] -         When a @Bulk action is invoked, an interaction context (available via a ThreadLocal) should provide additional contextual information.
</li>
</ul>


<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-51'>ISIS-51</a>] -         Standardize on just one collections API (either google-collections/guava or Apache collections)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-74'>ISIS-74</a>] -         Get rid of BoundedFacet (or keep only for information); instead replace with ChoicesFacetBecauseBounded.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-210'>ISIS-210</a>] -         Support parameter choices on contributed actions
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-425'>ISIS-425</a>] -         Factor out abstract contract test class to make it easier to write contract tests that apply to all entities.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-428'>ISIS-428</a>] -         JUnitMockery2 should automatically instantiate the @ClassUnderTest
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-436'>ISIS-436</a>] -         Extend the ApplicationSettings and UserSettings (read/write and listAll)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-444'>ISIS-444</a>] -         Autocomplete should allow minimum characters to be specified; choices should require no characters to be specified.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-453'>ISIS-453</a>] -         Extend @MemberGroups annotation so that it can provide a hint to lay out properties on either left or right hand side of the page (with respect to Wicket viewer&#39;s rendering)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-456'>ISIS-456</a>] -         ResourceServlet should set the contentType for common file types.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-458'>ISIS-458</a>] -         Allow services to be rendered in a different order than listed in isis.properties.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-462'>ISIS-462</a>] -         Improve ValueTypeContractTestAbstract to also test for value types that implement Comparable.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-465'>ISIS-465</a>] -         Provide the ability to reuse FixtureInstallerDelegate to install demo fixtures (in running application).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-474'>ISIS-474</a>] -         hide operation in the sevice menu that are not invoke-able due to user role permission mapping.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-480'>ISIS-480</a>] -         With the new multiple columns for properties, should only be a single edit form, and should also allow collections to &quot;overflow&quot; underneath property columns if need be.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-482'>ISIS-482</a>] -         Allow as &quot;choices&quot; return type any descendant of &quot;Collection&quot;
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-485'>ISIS-485</a>] -         Clearer messages for validation exceptions (specially MandatoryExceptions)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-490'>ISIS-490</a>] -         Switch from log4j to using slf4j throughout
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-495'>ISIS-495</a>] -         Remove dependences to commons-lang and commons-collection
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-500'>ISIS-500</a>] -         Make EntityIconAndTitlePanel easier to subclass; minor tidy up ComponentFactory and PageRegistryDefault.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-503'>ISIS-503</a>] -         Refactor the way that members are ordered to allow contributee actions to be ordered within regular actions 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-504'>ISIS-504</a>] -         Metamodel validator should throw a violation if discover any properties/collections on a service
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-509'>ISIS-509</a>] -         Tidy up and rationalize Util classes in core (and all dependents)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-519'>ISIS-519</a>] -         Delete applib&#39;s src-archived/old-valueholders (and the other src-archived stuff too, the never implemented searchable annotations/interfaces).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-528'>ISIS-528</a>] -         Allow framework to deal with transient objects not instantiated by newTransientInstance.  Improve javadoc.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-536'>ISIS-536</a>] -         Provide the capability to disable concurrency checking in core through a thread-local
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-539'>ISIS-539</a>] -         Allow a reason to be specified in @Disabled annotation
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-546'>ISIS-546</a>] -         OID marshalling should allow an &#39;@&#39; symbol for the version.getUser()
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-564'>ISIS-564</a>] -         The API for the AuditingService#audit omits the id of the property being changed.  Fix this (respecting semver)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-567'>ISIS-567</a>] -         Provide the capability to disable concurrency checking through a global property (in isis.properties)
</li>
</ul>
 

<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-236'>ISIS-236</a>] -         Classes that are not referenced in the DOM aren&#39;t found by the specification loader
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-435'>ISIS-435</a>] -         Problems with Enums implementing methods on values
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-442'>ISIS-442</a>] -         Fix error handling flow in IsisTransaction
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-449'>ISIS-449</a>] -         Error handling when transaction aborted incorrect
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-451'>ISIS-451</a>] -         Abstract methods (and perhaps synthetic methods) not being filtered out of metamodel
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-464'>ISIS-464</a>] -         Some trivial cleanup
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-467'>ISIS-467</a>] -         timezone difference issue in date test in org.apache.isis.objectstore.sql.HsqlTest
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-531'>ISIS-531</a>] -         Reinstate metamodel pseudo-&quot;API&quot; classes that are used by danhaywood&#39;s wicket extensions, was breaking backward compatibility
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-533'>ISIS-533</a>] -         When flushing transaction, allow for fact that flushing might cause additional persistence commands to be created, and iterate.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-545'>ISIS-545</a>] -         Test in error (Unparseable date)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-549'>ISIS-549</a>] -         RegisterEntities has two @PostConstruct methods...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-565'>ISIS-565</a>] -         NullPointerException on OneToOneAssociation#clearValue
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-566'>ISIS-566</a>] -         Concurrency conflict on related entity that has not been edited
</li>
</ul>
                
    
                        
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-437'>ISIS-437</a>] -         Tidy-up tasks for Isis 1.3.0 and associated components.
</li>
</ul>
                    