Title: isis-1.0.0
                
<h2>        New Feature
</h2>
<ul>
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-240'>ISIS-240</a>] -         Provide a bookmark service in order to lookup any object
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-242'>ISIS-242</a>] -         Provide support for JODA LocalDate and LocalDateTime as value types.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-250'>ISIS-250</a>] -         Change MetaModelValidator such that multiple validation errors can be reported in a single shot....
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-263'>ISIS-263</a>] -         Introduce a new @CommonlyUsed annotation as a hint for the UI.  To be implemented by Wicket viewer (as a minimum)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-264'>ISIS-264</a>] -         Add @Paged annotation (for use by viewer-side paging as a minimum).  Implement in Wicket as a minimum
</li>
</ul>

           
<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-89'>ISIS-89</a>] -         Finish off updating documentation post the first (pre 1.0) release of Isis.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-131'>ISIS-131</a>] -         Archive off (and no longer support) the default runtime&#39;s client/server remoting
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-188'>ISIS-188</a>] -         Stabilization for isis-1.0.0 release.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-192'>ISIS-192</a>] -         Change the default config files for file-based authentication and file-based authorization
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-202'>ISIS-202</a>] -         Rename @Stable to @ViewModel
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-203'>ISIS-203</a>] -         Improve the logging at startup
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-216'>ISIS-216</a>] -         Make OIDs immutable and self-describing (ie make OidWithSpecification the norm, using an ObjectTypeFacet as a way of determining the type).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-227'>ISIS-227</a>] -         Separate out Eclipse (m2e) target classes from Maven cli,so co-exist better.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-228'>ISIS-228</a>] -         Use JUnit categories to distinguish between tests that can be run on CI server and those that cannot.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-243'>ISIS-243</a>] -         Remove the Maybe type from the Isis applib.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-245'>ISIS-245</a>] -         Collapse the Version hierarchy
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-248'>ISIS-248</a>] -         Perform concurrency checking within the persistor (rather than rely on every viewer/client to do the check)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-252'>ISIS-252</a>] -         Use enums instead of booleans in FacetFactory&#39;s/Facets/ValueSemanticsProvider
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-253'>ISIS-253</a>] -         Get rid of DateValueFacet#getLevel(), since unused
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-257'>ISIS-257</a>] -         Remove the @Executed annotation from the applib (and corresponding metadata stuff) since remoting no longer supported.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-258'>ISIS-258</a>] -         Extend @Hidden and @Disabled to specify Where the object member should be hidden/disabled.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-259'>ISIS-259</a>] -         Replace @QueryOnly and @Idempotent with a new @ActionSemantics annotation.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-260'>ISIS-260</a>] -         If a property is annotated as @Title, then by default it should not appear as a column in tables.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-261'>ISIS-261</a>] -         Remove obsolete code (Enumeration interface, AnnotationBasedFacetFactory)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-262'>ISIS-262</a>] -         Real composite for ResourceSourceStream
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-267'>ISIS-267</a>] -         Handle &quot;recreating&quot; object adapters which are already resolved
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-274'>ISIS-274</a>] -         Simplify the bootstrapping of Isis so that there are fewer configuration properties to set in isis.properties
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-280'>ISIS-280</a>] -         More consistent support for @Prototype and @Exploration, by utilizing the existing HidingInteractionAdvisor API
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-281'>ISIS-281</a>] -         Provide support for integration testing using a JUnit rule.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-283'>ISIS-283</a>] -         Provide the ability to use fixtures as domain objects, eg within demo apps
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-285'>ISIS-285</a>] -         Add additional MetaModelValidators so that orphaned prefixes are treated as a validation error.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-286'>ISIS-286</a>] -         Make sure pending changes are stored before issuing a query
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-288'>ISIS-288</a>] -         During start up the configuration files are read in repeatedly making it confusing to track down configuration issues
</li>
</ul>
    
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-184'>ISIS-184</a>] -         PasswordValueSemanticsProvider.doEncode threw exception when I provided a defaultXXX method
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-255'>ISIS-255</a>] -         Test in Runtime TestSupport component fails due to TimeZone
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-265'>ISIS-265</a>] -         NullPointerException when storing new objects
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-266'>ISIS-266</a>] -         BoundedFacetAbstract was invalidating using disabledReason()
</li>
</ul>
                                             
