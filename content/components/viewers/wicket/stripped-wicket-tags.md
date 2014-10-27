Title: Stripped Wicket Tags

##  1.8.0-SNAPSHOT

By default the Isis Wicket viewer will always strip wicket tags.  However, this behaviour can be overridden using a configuration setting.

To force wicket tags to be NOT be stripped, use:

    isis.viewer.wicket.stripWicketTags=false

This only applies in [prototype](../../../reference/deployment-type.html) mode.

Typically this should be added to the `viewer_wicket.properties` file (in `WEB-INF`), though you can add to `isis.properties` if you wish.


## In 1.7.0 and earlier

In 1.7.0 and earlier, the behaviour is different; the Isis Wicket viewer will preserve wicket tags when running in Isis' exploration/prototype  mode (equivalent to Wicket's "development" mode), but will still strip wicket tags in Isis' server mode (equivalent to Wicket's "deployment" mode).

To force Wicket tags to be stripped even in exploration/prototype mode, set:

    isis.viewer.wicket.stripWicketTags=true

> We have found that Internet Explorer can be sensitive to the presence of Wicket tags.  If using this browser, we recommend that you force wicket tags to be stripped


