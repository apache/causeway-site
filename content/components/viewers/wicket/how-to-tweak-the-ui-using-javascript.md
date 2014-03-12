Title: Tweaking the UI using Javascript

The Wicket viewer allows you to customize the GUI in several (progressively more sophisticated) ways:

* through CSS (see [here](./how-to-tweak-the-ui-using-css-classes.html))
* through Javascript snippets (eg JQuery) (described below)
* by replacing elements of the page using the `ComponentFactory` interface (see [here](./customizing-the-viewer.html))
* by providing new pages (see [here](./custom-pages.html))

Customizing the viewer using Javascript is discouraged, however, as there is no formal API that such custom JS can target.  Instead, consider implementing the customization server-side, using the `ComponentFactory` interface (described [here](./customizing-the-viewer.html)).

## Customizing using Javascript snippets

The Wicket viewer ships with embedded JQuery, so this can be leveraged (eg to run some arbitrary JQuery on page load).  

This is done by adjusting the Guice bindings (part of Isis' bootstrapping) in your custom subclass of `IsisWicketApplication`:

    public class MyAppApplication extends IsisWicketApplication {
        @Override
        protected Module newIsisWicketModule() {
            final Module isisDefaults = super.newIsisWicketModule();
            final Module myAppOverrides = new AbstractModule() {
                @Override
                protected void configure() {
                    ...
                    bind(String.class)
                        .annotatedWith(Names.named("applicationJs"))
                        .toInstance("scripts/application.js");
                    ...
                }
            };
    
            return Modules.override(isisDefaults).with(myAppOverrides);
        }
    }

Currently only one such `.js` file can be registered.
    
