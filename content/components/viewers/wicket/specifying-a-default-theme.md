Title: Specifying a Default Theme (1.8.0)

[//]: # (content copied to _user-guide_xxx)

The Isis Wicket viewer uses [Bootstrap](http://getbootstrap.com/) styles and components (courtesy of the 
[Wicket Bootstrap](https://github.com/l0rdn1kk0n/wicket-bootstrap) integration).

Unless specified otherwise, the viewer uses the default bootstrap theme.  However, this can be changed by overriding
 `init()` in the application's subclass of `IsisWicketApplication`.  For example, to set the [bootswatch.com flatly](http://bootswatch.com/flatly/) theme
 as the default, use:
  
    @Override
    protected void init() {
        super.init();

        IBootstrapSettings settings = Bootstrap.getSettings();
        settings.setThemeProvider(new BootswatchThemeProvider(BootswatchTheme.Flatly));
    }

If you have developed a custom theme, then this can also be specified using the [Wicket Bootstrap API](https://github.com/l0rdn1kk0n/wicket-bootstrap/wiki/Themes).
