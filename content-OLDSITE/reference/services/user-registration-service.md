Title: User Registration Service (1.8.0)

[//]: # (content copied to _user-guide_xxx)

The user registration service API provides the ability for users to sign-up to access an application by providing a valid email address.  The Wicket viewer will check whether an implementation of this service (and also the [email notification service](./email-notification-service.html)) is available, and if so will (unless configured not to) expose a sign-up page where the user enters their email address.  A verification email is sent (using the aforementioned [email notification service](./email-notification-service.html)) which includes a link back to the running application; this allows the user then to complete their registration process (choose user name, password and so on).  When the user has provided the additional details, the Wicket viewer calls this service in order to create an account for them, and then logs the user on.

The user registration API also includes the ability to reset password, again by sending a verification email to the provided email address.

See [here](../../components/viewers/wicket/user-registration.html) for more on the Wicket viewer's support.

Domain objects may also use this service; it will be injected into domain object or other domain services in the usual way.  (That said, we expect that such use cases will be comparatively rare; the primary use case is for the Wicket viewer's sign-up page).

The core Isis framework itself defines only an API; there is no default implementation.  Rather, the implementation will depend on the security mechanism being used.  That said, if you have configured your app to use the [Isis addons security module](http://github.com/isisaddons/isis-module-security), then note that the security module does provide an abstract implementation (`SecurityModuleAppUserRegistrationServiceAbstract`) of the user registration service.  You will need to extend that service and provide implementation for the two abstract methods - `#getInitialRole()` and `#getAdditionalInitialRoles()`. This is needed so that the self-registered users are assigned automatically to your application role(s) and be able to use the application. Without any role such user will be able only to see/use the logout link of the application.
Note: do not forget to register this service in isis.properties!
An example of such implementation can be seen at isis-module-security's [demo application](https://github.com/isisaddons/isis-module-security/blob/master/webapp/src/main/java/org/isisaddons/module/security/webapp/AppUserRegistrationService.java).

## API

The API for the service is:

    public interface UserRegistrationService {

        @Programmatic
        boolean usernameExists(String username);

        @Programmatic
        boolean emailExists(String emailAddress);

        @Programmatic
        void registerUser(String username, String password, String emailAddress);

        @Programmatic
        boolean updatePasswordByEmail(String emailAddress, String password);
    }

where:

* `usernameExists()` checks if there is already a user with the specified username
* `emailExists()` checks if there is already a user with the specified email address
* `registerUser(...)` creates the user, with specified password and email address.  The username nor email address must be unique (not being used by an existing user)
* `updatePasswordByEmail()` allows the user to reset their password
      
## Implementation

There is no default implementation of the service provided by the core framework.  However, the [Isis addons security module](http://github.com/isisaddons/isis-module-security), provides an abstract implementation with almost all needed functionality. You may extend from it and provide the application role(s) for the self-registered users. **Note**: the custom implementation of this service should be registered manually in Isis!

## Related Services

The most common use case is to allow users to sign-up through Isis' Wicket viewer.  Because the process requires email to be sent, the following services must be configured:

* `EmailService` (as described [here](./email-service.html)).
* `EmailNotificationService` (as described [here](./email-notification-service.html)).
* `UserRegistrationService` (this service)

The `EmailService` in particular requires additional configuration properties to specify the external SMTP service.
