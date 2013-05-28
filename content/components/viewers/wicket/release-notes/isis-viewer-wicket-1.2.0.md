Title: isis-viewer-wicket-1.2.0
                
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-328'>ISIS-328</a>] -         Wicket viewer should shutdown Isis core on completion
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-344'>ISIS-344</a>] -         Automatically exclude &quot;parent references&quot; from parented collections.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-351'>ISIS-351</a>] -         Provide the ability for certain runtime exceptions to be recognized as non-fatal, for rendering to the user.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-360'>ISIS-360</a>] -         About page on wicket viewer should show version, build number and other details.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-363'>ISIS-363</a>] -         Wicket viewer should abbreviate title to different lengths for parented vs standalone collections.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-384'>ISIS-384</a>] -         Provide automatic totalling of collections.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-400'>ISIS-400</a>] -         In the wicket viewer, allow actions to be associated with properties (similar to how this can be done with collections)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-407'>ISIS-407</a>] -         Annotation to automatically adjust end dates of ranges so that they are shown as inclusive vs exclusive.
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-314'>ISIS-314</a>] -         The wicket viewer should honour precision and scale when rendering BigDecimal values.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-320'>ISIS-320</a>] -         Be more verbose when wicket page fails to render
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-330'>ISIS-330</a>] -         Wicket viewer calls choices method while figuring out how to render properties.  Should call less often (if not at all).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-335'>ISIS-335</a>] -         Don&#39;t include (or perhaps abbreviate) the title text in collections
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-337'>ISIS-337</a>] -         Reduce size of font in breadcrumbs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-338'>ISIS-338</a>] -         Right align number fields (byte, short, int, long, float, double, BigInteger, BigDecimal)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-339'>ISIS-339</a>] -         Wicket Autocomplete should only fire if at least 1 character has been entered.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-340'>ISIS-340</a>] -         Wicket viewer bookmarks should show icon as well as title
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-343'>ISIS-343</a>] -         Introduce @Render annotation and deprecate @Resolve
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-349'>ISIS-349</a>] -         Show notifications, warning messages and error messages in Wicket
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-350'>ISIS-350</a>] -         Provide a fallback error page in case of runtime exception being thrown.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-357'>ISIS-357</a>] -         Gracefully handle objects that have been deleted.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-362'>ISIS-362</a>] -         Upgrade to JMock 2.6.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-364'>ISIS-364</a>] -         Suppress components of title when rendered in a parented collection.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-365'>ISIS-365</a>] -         Should not add same object to bookmarks (breadcrumbs) twice if its title has changed.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-392'>ISIS-392</a>] -         In Wicket, provide a datepicker for all of the date/datetime value types.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-393'>ISIS-393</a>] -         Upgrade to Wicket 6.7.0
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-394'>ISIS-394</a>] -         Use JQuery UI date picker rather than the YUI picker.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-395'>ISIS-395</a>] -         Allow Wicket viewer&#39;s date pattern to be globally configurable
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-396'>ISIS-396</a>] -         Wicket/JDO handling of BigDecimal properties should honour the @Column&#39;s scale attribute.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-403'>ISIS-403</a>] -         Improve the bookmarks in the Wicket viewer.
</li>
</ul>

<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-295'>ISIS-295</a>] -         NullPointerException when view aggregated entity using Wicket viewer
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-321'>ISIS-321</a>] -         gracefully handle any constraint violation thrown by the DataNucleus persistence mechanism (to be handled by JDO ObjectStore &amp; Wicket)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-334'>ISIS-334</a>] -         method String iconName() is never called in entities
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-336'>ISIS-336</a>] -         Fix CSS for Wicket viewer so that disabled application actions (on menu bar) are shown greyed out.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-341'>ISIS-341</a>] -         if search and get no results, then click on the OK, then get a stack trace
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-342'>ISIS-342</a>] -         Bootstrapping Wicket application should load supplementary config files for viewers.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-354'>ISIS-354</a>] -         Issues with Wicket viewer and tck examples
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-359'>ISIS-359</a>] -         Bulk actions being shown even if action is not a no-arg...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-382'>ISIS-382</a>] -         Quickly pressing enter multiple times on an object form creates multiple instances.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-385'>ISIS-385</a>] -         In the wicket viewer, actions rendered by collections are never shown as disabled.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-388'>ISIS-388</a>] -         Bulk actions in Wicket viewer not correctly redirecting to error page if an unexpected error occurs
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-390'>ISIS-390</a>] -         Fix NPE in Wicket viewer if tries to render an action that is invisible.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-402'>ISIS-402</a>] -         Wicket viewer, show bulk actions for prototype or exploring modes.
</li>
</ul>

                        
                                        