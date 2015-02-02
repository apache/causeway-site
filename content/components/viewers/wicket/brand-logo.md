Title: Brand Logo (1.8.0-SNAPSHOT)

By default the Wicket viewer will display the application name top-left in the header menu.  This can be changed to
display a png logo instead.

##Screenshots

The screenshot below shows the todo application with a 'brand logo' image in its header:

![](images/brand-logo.png)


##Configuration

In the application-specific subclass of `IsisWicketApplication`, bind a string with name "brandLogo" to the URL of
an image.

For example:

    @Override
    protected Module newIsisWicketModule() {
        final Module isisDefaults = super.newIsisWicketModule();

        final Module overrides = new AbstractModule() {
            @Override
            protected void configure() {
                ...
                bind(String.class).annotatedWith(Names.named("brandLogo")).toInstance("/images/todoapp-logo-160x40.png");
                ...
            }
        };

        return Modules.override(isisDefaults).with(overrides);
    }


If the logo is hosted locally, add to the relevant directory (eg `src/main/webapp/images`).  It is also valid for the
URL to be absolute.

You may also wish to tweak the `css/application.css`.  For example, a logo with height 40px works well with the following:

    .navbar-brand img {
        margin-top: -5px;
        margin-left: 5px;
    }


