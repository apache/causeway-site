Title: Stripped Wicket Tags

By default the Isis Wicket viewer will preserve wicket tags when running in Isis' [exploration/prototype](../../../reference/deployment-type.html) mode (equivalent to Wicket's "development" mode), 
but will strip wicket tags in Isis' server mode (equivalent to Wicket's "deployment" mode).

This behaviour can be overridden using a configuration setting.

> We have found that Internet Explorer can be sensitive to the presence of Wicket tags.  If using this browser, we recommend that you force wicket tags to be stripped
The 'remember me' checkbox on the login page can be suppressed, if required, by setting a configuration flag.

##Configuration

To force wicket tags to be stripped (even in exploration/prototype mode), use:

    isis.viewer.wicket.stripWicketTags=false

Conversely, to force wicket tags to always be available, set to `true`.
    
Typically this should be added to the `viewer_wicket.properties` file (in `WEB-INF`), though you can add to `isis.properties` if you wish.

