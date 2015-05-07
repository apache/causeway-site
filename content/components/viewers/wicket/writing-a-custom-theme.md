Title: Writing a Custom Theme (1.8.0)

[//]: # (content copied to _user-guide_extending_wicket-viewer)

The Isis Wicket viewer uses [Bootstrap](http://getbootstrap.com/) styles and components (courtesy of the 
[Wicket Bootstrap](https://github.com/l0rdn1kk0n/wicket-bootstrap) integration).

By default the viewer uses the default bootstrap theme.  As described [here](showing-a-theme-chooser.html), it is 
possible to allow the user to select other themes provided by [bootswatch.com](http://bootswatch.com), and if required
one of these can be [set as the default](specifying-a-default-theme.html).

However, you may instead want to write your own custom theme, for example to fit your company's look-n-feel/interface
guidelines.  This is done by implementing [Wicket Bootstrap](https://github.com/l0rdn1kk0n/wicket-bootstrap)’s 
`de.agilecoders.wicket.core.settings.ITheme` class.  This defines: 

* the name of the theme
* the resources it needs (the CSS and optional JS and/or fonts), and
* optional urls to load them from a Content Delivery Network (CDN).

To make use of the custom `ITheme` the application should register it by adding the following snippet in 
(your application's subclass of) `IsisWicketApplication`:

    public void init() {
    
        ...
        IBootstrapSettings settings = new BootstrapSettings();
        ThemeProvider themeProvider = new SingleThemeProvider(new MyTheme());
        settings.setThemeProvider(themeProvider);

        Bootstrap.install(getClass(), settings);
    }
        


