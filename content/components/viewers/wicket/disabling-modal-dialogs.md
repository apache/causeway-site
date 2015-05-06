Title: Disabling Modal Dialogs

[//]: # (content copied to _user-guide_configuration_properties_wicket-viewer)

By default the Isis Wicket viewer uses a modal dialog for action parameters.  
Before this feature was implemented (prior to 1.4.0), Isis rendered action parameters
on its own page.  This old behaviour can be re-enabled using:

    isis.viewer.wicket.disableModalDialogs=true

Note that action pages are still used for bookmarked actions.
