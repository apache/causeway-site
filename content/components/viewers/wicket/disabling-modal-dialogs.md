Title: Disabling Modal Dialogs

[//]: # (content copied to _user-guide_wicket-viewer_configuration_properties)

By default the Isis Wicket viewer uses a modal dialog for action parameters.  
Before this feature was implemented (prior to 1.4.0), Isis rendered action parameters
on its own page.  This old behaviour can be re-enabled using:

    isis.viewer.wicket.disableModalDialogs=true

Note that action pages are still used for bookmarked actions.
