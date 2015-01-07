Title: Suppressing Sign Up (1.8.0-SNAPSHOT)

If [user registration](./user-registration.html) has been configured, then the Wicket viewer allows the user to
sign-up a new account and to reset their password from the login page.

The 'sign up' link can be suppressed, if required, by setting a configuration flag.

##Screenshots

With 'sign up' not suppressed (the default):

![](images/login-page-default.png)

and with the link suppressed:

![](images/login-page-suppress-sign-up.png)

##Configuration

To suppress the 'sign up' link, add the following configuration flag:

    isis.viewer.wicket.suppressSignUp=true

Typically this should be added to the `viewer_wicket.properties` file (in `WEB-INF`), though you can add to `isis.properties` if you wish.

##See also

The [password reset link](./suppressing-password-reset.html) can be suppressed in a similar manner.
