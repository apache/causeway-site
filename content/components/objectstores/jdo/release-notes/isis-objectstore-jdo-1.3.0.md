Title: isis-objectstore-jdo-1.0.0
                               

<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-322'>ISIS-322</a>] -         Allow JDO objectstore to run on the Google App Engine
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-422'>ISIS-422</a>] -         Create Apache Isis API for custom Queries sent to the Objectstore by the PersistenceManager
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-427'>ISIS-427</a>] -         An application setting service (both global and user-specific), with JDO implementation.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-450'>ISIS-450</a>] -         Provide an EventBusService (based on guava) for decoupled intra-session interaction between entities.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-459'>ISIS-459</a>] -         Enhance IsisJdoSupport service to support integration testing (execute arbitrary SQL, delete all instances of an entity)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-488'>ISIS-488</a>] -         Derive Isis&#39; MandatoryFacet from JDO @Column(allowNulls=) annotation, and provide @Mandatory annotation as override
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-553'>ISIS-553</a>] -         Provide view model support, as sketched out in the Restful Objects spec
</li>
</ul>
                    

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-270'>ISIS-270</a>] -         NotYetImplementedException in JDO objectstore when debug logging enabled
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-436'>ISIS-436</a>] -         Extend the ApplicationSettings and UserSettings (read/write and listAll)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-438'>ISIS-438</a>] -         Upgrade to DN 3.2.3 and remove the workaround we had introduced ...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-460'>ISIS-460</a>] -         JDO objectstore should sync adapters on bulk delete.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-509'>ISIS-509</a>] -         Tidy up and rationalize Util classes in core (and all dependents)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-524'>ISIS-524</a>] -         Allow to control the database schema generation using a property in isis.properties file. 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-529'>ISIS-529</a>] -         Provide hidden versions of the ApplicationSettingsService and UserSettingsService.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-540'>ISIS-540</a>] -         ExceptionRecognizerForJDODataStoreException is too general...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-557'>ISIS-557</a>] -         If @javax.jdo.annotations.Column(length=...) is specified, then should be used to infer the MaxLengthFacet
</li>
</ul>
    
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-476'>ISIS-476</a>] -         Update JDO/DN to allow for fact that invoking the Persisting callback may have resulted in the target object having already been updated.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-549'>ISIS-549</a>] -         RegisterEntities has two @PostConstruct methods...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-566'>ISIS-566</a>] -         Concurrency conflict on related entity that has not been edited
</li>
</ul>
    
<h2>        Dependency upgrade
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-501'>ISIS-501</a>] -         Maven error with DN enhancer: required artifact missing
</li>
</ul>
            

    
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-437'>ISIS-437</a>] -         Tidy-up tasks for Isis 1.3.0 and associated components.
</li>
</ul>
                    