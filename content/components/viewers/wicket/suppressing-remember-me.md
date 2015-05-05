Title: Suppressing Remember Me

[//]: # (content copied to _user-guide_xxx)

The 'remember me' checkbox on the login page can be suppressed, if required, by setting a configuration flag.

##Screenshots

With 'remember me' not suppressed (the default):

![](images/login-page-default.png)

and with the checkbox suppressed:

![](images/login-page-suppress-remember-me.png)

##Configuration

To suppress the 'remember me' checkbox, add the following configuration flag:

    isis.viewer.wicket.suppressRememberMe=true

Typically this should be added to the `viewer_wicket.properties` file (in `WEB-INF`), though you can add to `isis.properties` if you wish.
