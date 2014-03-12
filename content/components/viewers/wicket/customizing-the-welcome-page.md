Title: Customizing the Welcome Page
    
It's possible to customize the application name, welcome message and about message can also be customized.  This is done by adjusting the Guice bindings (part of Isis' bootstrapping) in your custom subclass of `IsisWicketApplication`:

    public class MyAppApplication extends IsisWicketApplication {
        @Override
        protected Module newIsisWicketModule() {
            final Module isisDefaults = super.newIsisWicketModule();
            final Module myAppOverrides = new AbstractModule() {
                @Override
                protected void configure() {
                    ...
                    bind(String.class)
                        .annotatedWith(Names.named("applicationName"))
                         .toInstance("My Wonderful App");
                    bind(String.class)
                        .annotatedWith(Names.named("welcomeMessage"))
                        .toInstance(readLines("welcome.html"));
                    bind(String.class)
                        .annotatedWith(Names.named("aboutMessage"))
                        .toInstance("My Wonderful App v1.0");
                    ...
                }
            };
    
            return Modules.override(isisDefaults).with(myAppOverrides);
        }
    }

Here the `welcome.html` file is resolved relative to `src/main/webapp`.

