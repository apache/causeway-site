Title: isis-viewer-wicket-1.4.0
                           
<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-472'>ISIS-472</a>] -         Limit number of bookmarks
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-608'>ISIS-608</a>] -         Show count for collections (if rendered eagerly), else a hint to expand.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-609'>ISIS-609</a>] -         Suppress showing actions for collections that are not rendered eagerly
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-612'>ISIS-612</a>] -         Return a URL from an action opens a new browser window
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-625'>ISIS-625</a>] -         Better reporting of metamodel violation errors
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-633'>ISIS-633</a>] -         Press ESC to close/cancel the action prompt dialog
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-638'>ISIS-638</a>] -         Provide the capability to capture UI hints, and copy to clipboard
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-642'>ISIS-642</a>] -         Provide breadcrumb drop-down; when revisiting a page, any UI hints from last visit should be retained.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-648'>ISIS-648</a>] -         Improve support for bulk update
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-649'>ISIS-649</a>] -         In wicket viewer, make it easier to develop custom styling by wrapping the body of all pages in a div with custom style
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-701'>ISIS-701</a>] -         In Wicket viewer, make uppercase text switchable
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-727'>ISIS-727</a>] -         Enhance standalone tables so that renders according to runtime type, not compile-time type
</li>
</ul>

<h2>        Improvement
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-486'>ISIS-486</a>] -         Show action dialogs in a modal dialog rather than new page (less context switching for user)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-587'>ISIS-587</a>] -         Various UI improvements for Wicket viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-588'>ISIS-588</a>] -         In Wicket viewer, make bookmark panel smaller, and enable with a keyboard shortcut
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-589'>ISIS-589</a>] -         Bundle all (or at least most) of the Wicket viewer&#39;s individual CSS resources into a single bundle, because hitting a limitation of no more than 31 CSS files in IE9 :-(
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-590'>ISIS-590</a>] -         Wicket viewer strip wicket tags should depend on the deployment mode.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-591'>ISIS-591</a>] -         For Wicket viewer, load Javascript libraries (except for JQuery) from the footer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-594'>ISIS-594</a>] -         Tidy up and simplify URLs in Wicket viewer.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-596'>ISIS-596</a>] -         Require smarter handling of bookmarked objects that have been deleted
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-618'>ISIS-618</a>] -         Simplify ActionPage, separate out result components from prompt.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-626'>ISIS-626</a>] -         Recognize Wicket PageExpiredExceptions and display a friendlier error message
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-634'>ISIS-634</a>] -         Drop-downs (for enums/bounded and autocomplete) should honour TypicalLengthFacet.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-658'>ISIS-658</a>] -         Provide a custom panel for java.sql.Timestamp
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-677'>ISIS-677</a>] -         The blob/clob panel does not show the name of the blob/clob present (eg if just uploaded).
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-680'>ISIS-680</a>] -         Provide an alternative (perhaps lower-fidelity) alternative to the clipboard link, for those environments where flash is not supported.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-682'>ISIS-682</a>] -         In the Wicket viewer, the tooltip for icons should show the title (and perhaps also the type) of the icon being linked to.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-683'>ISIS-683</a>] -         In Wicket viewer, if delete objects from a standalone collection, then selecting again causes an exception.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-692'>ISIS-692</a>] -         Prevent/reduce flicker on pages with drop-down list box.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-699'>ISIS-699</a>] -         In Wicket viewer, when redirect to next page after invoking an action, have the browser&#39;s address bar show the URL of the object
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-706'>ISIS-706</a>] -         Blob vs Clob request handling, also relationship with bulk actions.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-718'>ISIS-718</a>] -         Actions that return a URL should open in new tab/window
</li>
</ul>
    
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-429'>ISIS-429</a>] -         Hard-coded dependency to WicketSignInPage in PageAbstract...
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-617'>ISIS-617</a>] -         Wicket viewer throws NPE when rendering Isis DateTime in a collection
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-620'>ISIS-620</a>] -         When editing an entity twice a concurrency exception is thrown
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-621'>ISIS-621</a>] -         Improve the Wicket viewer&#39;s parsing of numbers 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-629'>ISIS-629</a>] -         Selecting a different option from a dropdown resets other fields
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-630'>ISIS-630</a>] -         LocalDates are parsed to a wrong date when running in different timezone
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-637'>ISIS-637</a>] -         StalePage exceptions ... when omitting mandatory entity drop-down in action prompt 
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-669'>ISIS-669</a>] -         Download of Excel files in Wicket viewer on *nix/OSx machines doesn&#39;t work.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-675'>ISIS-675</a>] -         If try to upload attachment, then have to do the operation twice.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-676'>ISIS-676</a>] -         In Wicket viewer for object with an editable drop-down of an object, if edit, then cancel, then edit, then the drop-down widget is no longer rendered.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-686'>ISIS-686</a>] -         Logout as admin doesn&#39;t work (could be if on any machine other than localhost?)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-691'>ISIS-691</a>] -         In Wicket viewer, improve drop-down list&#39;s handling of null entity or values
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-711'>ISIS-711</a>] -         Fix so that can raiseError in bulk actions.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-712'>ISIS-712</a>] -         Inconsistency in domain logic for validation of optional strings causes Wicket viewer to trip up.
</li>
</ul>
                
                            
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-695'>ISIS-695</a>] -         Tidy-up tasks for Isis 1.4.0 release
</li>
</ul>
                
                