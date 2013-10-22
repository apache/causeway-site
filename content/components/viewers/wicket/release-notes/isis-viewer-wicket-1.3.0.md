Title: isis-viewer-wicket-1.3.0
                           
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-417'>ISIS-417</a>] -         In wicket viewer, provide a &#39;select all&#39; checkbox on table (for invoking bulk actions)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-419'>ISIS-419</a>] -         Add an autoCompleteXxx() method for more context-sensitive lookups.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-430'>ISIS-430</a>] -         Allow the sort order for SortedSet parented collections to be overridden with a new @SortedBy annotation.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-432'>ISIS-432</a>] -         In the wicket viewer, table columns should be sortable
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-433'>ISIS-433</a>] -         Provide context-specific autoComplete through prefixed methods on actions parameters (cf choices method).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-434'>ISIS-434</a>] -         Provide context-specific autoComplete through prefixed methods on properties
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-443'>ISIS-443</a>] -         Provide the ability to group domain services into logical menus, using @MemberOrder.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-445'>ISIS-445</a>] -         Actions returning blobs or clobs should download as a file.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-447'>ISIS-447</a>] -         In Wicket viewer, distinguish prototype/exploration actions in the app menu
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-457'>ISIS-457</a>] -         New annotation @CssClass for class member, should render in the HTML markup for that member.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-468'>ISIS-468</a>] -         Provide better layout management of pages in the Wicket viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-475'>ISIS-475</a>] -         Dynamic layout using JSON, using an Xxx.layout.json file
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-478'>ISIS-478</a>] -         Provide conditional choices, defaults and validation between action parameters
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-497'>ISIS-497</a>] -         Allow service actions to be rendered as contributed collections or as contributed properties.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-498'>ISIS-498</a>] -         Enhance Wicket&#39;s BlobPanel so that, if an image is uploaded as the blob, then it is displayed in thumbnail form.
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
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-416'>ISIS-416</a>] -         Make spinning icon image in Wicket pluggable
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-424'>ISIS-424</a>] -         Make rememberMe configurable on Wicket sign-in page, and make non-final so can be subclassed.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-444'>ISIS-444</a>] -         Autocomplete should allow minimum characters to be specified; choices should require no characters to be specified.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-453'>ISIS-453</a>] -         Extend @MemberGroups annotation so that it can provide a hint to lay out properties on either left or right hand side of the page (with respect to Wicket viewer&#39;s rendering)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-455'>ISIS-455</a>] -         In Wicket viewer, the links (rendered as buttons) for actions should include the identifier of the action, so that they can be targetted for application-specific CSS.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-473'>ISIS-473</a>] -         Allow operations to individually be specified for &quot;@bookmarkable&quot; behaviour.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-480'>ISIS-480</a>] -         With the new multiple columns for properties, should only be a single edit form, and should also allow collections to &quot;overflow&quot; underneath property columns if need be.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-490'>ISIS-490</a>] -         Switch from log4j to using slf4j throughout
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-500'>ISIS-500</a>] -         Make EntityIconAndTitlePanel easier to subclass; minor tidy up ComponentFactory and PageRegistryDefault.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-520'>ISIS-520</a>] -         Allow wicket viewer to be run in either development or deployment mode by passing in the Isis --type cmd line arg.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-521'>ISIS-521</a>] -         Xxx.layout.json is not read for abstract classes (as used for parented collections)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-523'>ISIS-523</a>] -         If max length of title in collections is 0, then suppress the title label also.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-525'>ISIS-525</a>] -         Wicket tags should be stripped by default, overridable with an Isis property.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-527'>ISIS-527</a>] -         Wicket viewer, auto-focus on first field when edit an object or on action parameter.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-530'>ISIS-530</a>] -         Upgrade to Wicket 6.10.0 and wicket-jquery-ui
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-538'>ISIS-538</a>] -         Improve performance of rendering lists (in Wicket viewer)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-547'>ISIS-547</a>] -         Provide better error logging from the Wicket applicaiton init() method if Isis fails to boot.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-558'>ISIS-558</a>] -         When bulk action is invoked, the action that generated the collection should be resubmitted (so that a full refresh takes place).
</li>
</ul>
    


<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-401'>ISIS-401</a>] -         In wicket viewer, concurrency checking is currently disabled when invoke action on an entity.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-449'>ISIS-449</a>] -         Error handling when transaction aborted incorrect
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-551'>ISIS-551</a>] -         Not forwarding onto the error page correctly if any of the application actions (ie menus) hit the object store when the transaction has been set to ABORT due to an earlier failure.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-552'>ISIS-552</a>] -         Upgrade to Wicket 6.11.0 and disable HTML5 functionality that caused interference between required text fields and the Wicket viewer&#39;s veil.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-560'>ISIS-560</a>] -         When invoking an action, drop downs get cleared (in the UI) if there is a validation error, but the underlying model is set.  
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-566'>ISIS-566</a>] -         Concurrency conflict on related entity that has not been edited
</li>
</ul>
     