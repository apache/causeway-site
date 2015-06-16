Title: isis-viewer-wicket-1.7.0


<h2>        New Feature
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-902'>ISIS-902</a>] -         Enhance ImageResourceCacheClassPath so that can have two entities with the same simple name but in different packages.
</li>
</ul>

    

<h2>        Security fixes
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-920'>ISIS-920</a>] -         (As a configuration option), provide the ability to disable the Wicket viewer automatically continuing to original URL after successful login.
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-846'>ISIS-846</a>] -         Enhance ExceptionRecognizer so that the stack trace can be suppressed in certain circumstances (for security)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-895'>ISIS-895</a>] -         HomePage should honour authorization rules.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-884'>ISIS-884</a>] -         ErrorPage vulnerable to XSS attacks.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-885'>ISIS-885</a>] -         To avoid leaking information (eg in the title) should have a &quot;special&quot; permission to throw a 404 if user doesn&#39;t have permission to view any of the class&#39; members.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-883'>ISIS-883</a>] -         Bookmarkable action URLs can be submitted by a user without permissions to bring up action dialog (thereafter that user can invoke).
</li>
</ul>
                                

                                
<h2>        Bug
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-889'>ISIS-889</a>] -         Action prompt dialog seems to be not quite big enough in Chrome (is ok in Firefox and IEv11)
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-880'>ISIS-880</a>] -         Appearance of Password field (in action dialogs) requires tweaking.
</li>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-910'>ISIS-910</a>] -         Entering invalid data for Char type fails with an internal error
</li>
</ul>

    
<h2>        Dependency upgrade
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-794'>ISIS-794</a>] -         Upgrade to Wicket 6.16.0, remove CharSequenceResource
</li>
</ul>

            
<h2>        Task
</h2>
<ul>
<li>[<a href='https://issues.apache.org/jira/browse/ISIS-872'>ISIS-872</a>] -         1.7.0 release activities
</li>
</ul>
                