Title: Isis Core v1.0.0

## Bug
    * [ISIS-184] - PasswordValueSemanticsProvider.doEncode threw exception when I provided a defaultXXX method
    * [ISIS-255] - Test in Runtime TestSupport component fails due to TimeZone
    * [ISIS-265] - NullPointerException when storing new objects
    * [ISIS-266] - BoundedFacetAbstract was invalidating using disabledReason()



## Improvement
    * [ISIS-89] - Finish off updating documentation post the first (pre 1.0) release of Isis.
    * [ISIS-131] - Archive off (and no longer support) the default runtime's client/server remoting
    * [ISIS-188] - Stabilization for isis-1.0.0 release.
    * [ISIS-192] - Change the default config files for file-based authentication and file-based authorization
    * [ISIS-202] - Rename @Stable to @ViewModel
    * [ISIS-203] - Improve the logging at startup
    * [ISIS-216] - Make OIDs immutable and self-describing (ie make OidWithSpecification the norm, using an ObjectTypeFacet as a way of determining the type).
    * [ISIS-227] - Separate out Eclipse (m2e) target classes from Maven cli,so co-exist better.
    * [ISIS-228] - Use JUnit categories to distinguish between tests that can be run on CI server and those that cannot.
    * [ISIS-243] - Remove the Maybe type from the Isis applib.
    * [ISIS-245] - Collapse the Version hierarchy
    * [ISIS-248] - Perform concurrency checking within the persistor (rather than rely on every viewer/client to do the check)
    * [ISIS-252] - Use enums instead of booleans in FacetFactory's/Facets/ValueSemanticsProvider
    * [ISIS-253] - Get rid of DateValueFacet#getLevel(), since unused
    * [ISIS-257] - Remove the @Executed annotation from the applib (and corresponding metadata stuff) since remoting no longer supported.
    * [ISIS-258] - Extend @Hidden and @Disabled to specify Where the object member should be hidden/disabled.
    * [ISIS-259] - Replace @QueryOnly and @Idempotent with a new @ActionSemantics annotation.
    * [ISIS-260] - If a property is annotated as @Title, then by default it should not appear as a column in tables.
    * [ISIS-261] - Remove obsolete code (Enumeration interface, AnnotationBasedFacetFactory)
    * [ISIS-262] - Real composite for ResourceSourceStream
    * [ISIS-267] - Handle "recreating" object adapters which are already resolved
    * [ISIS-274] - Simplify the bootstrapping of Isis so that there are fewer configuration properties to set in isis.properties
    * [ISIS-280] - More consistent support for @Prototype and @Exploration, by utilizing the existing HidingInteractionAdvisor API
    * [ISIS-281] - Provide support for integration testing using a JUnit rule.
    * [ISIS-283] - Provide the ability to use fixtures as domain objects, eg within demo apps
    * [ISIS-285] - Add additional MetaModelValidators so that orphaned prefixes are treated as a validation error.
    * [ISIS-286] - Make sure pending changes are stored before issuing a query

## New Feature
    * [ISIS-52] - Extend the NoSQL Object Store to properly support MongoDB.
    * [ISIS-240] - Provide a bookmark service in order to lookup any object
    * [ISIS-242] - Provide support for JODA LocalDate and LocalDateTime as value types.
    * [ISIS-250] - Change MetaModelValidator such that multiple validation errors can be reported in a single shot....
    * [ISIS-263] - Introduce a new @CommonlyUsed annotation as a hint for the UI.  To be implemented by Wicket viewer (as a minimum)
    * [ISIS-264] - Add @Paged annotation (for use by viewer-side paging as a minimum).  Implement in Wicket as a minimum

