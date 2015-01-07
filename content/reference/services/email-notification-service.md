Title: Email Notification Service (1.8.0-SNAPSHOT)

The email notification service supports the user registration process whereby a user can sign-up to access an application by providing a valid email address.  The Wicket viewer will check whether an implementation of this service (and also the [user registration service](./user-registration-service.html)) is available, and if so will (unless configured not to) expose a sign-up page where the user enters their email address.  A verification email is sent using this service; the email includes a link back to the running application.  The user then completes the registration process (choosing a user name, password and so on) and the Wicket viewer creates an account for them (using the aforementioned [user registration service](./user-registration-service.html)).

The framework provides both an API and a default implementation of this service.  The implementation depends in turn on the [email service](./email-service.html).

## API

The API for the service is:

    public interface EmailNotificationService extends Serializable {

        @PostConstruct
        @Programmatic
        public void init() ;

        @Programmatic
        boolean send(EmailRegistrationEvent ev);

        @Programmatic
        boolean send(PasswordResetEvent ev);

        @Programmatic
        boolean isConfigured();
    }

where:

* `init()` is always called by the framework, and allows the implementation to read configuration properties and initialize itself
* `send(...)` is the API to send an email either to verify an email (as part of the initial user registration) or to reset a password for an already-registered user
* `isConfigured()` determines whether the implementation was configured and initialized correctly.

If `isConfigured()` returns false then it is NOT valid to call `send(...)` (and doing so will result in an `IllegalStateException` being thrown.
      
## Implementation & Configuration

The framework provides a default implementation (`EmailNotificationServiceDefault`) that delegates to the [email service](./email-service.html) to send an (HTML) message.  As such, it requires that the email service has been configured.

If you have configured an alternative email service implementation, it should process the message body as HTML.

## Alternative Implementations

If you wish to write an alternative implementation of this service, note that (unlike most Isis domain services) the implementation is also instantiated and injected by Google Guice.  This is because `EmailNotificationService` is used as part of the [user registration](../../components/viewers/wicket/user-registration.html) functionality and is used by Wicket pages that are accessed outside of the usual Isis runtime.

This implies a couple of additional constraints:

* first, implementation class should also be annotated with `@com.google.inject.Singleton`
* second, there may not be any Isis session running.  (If necessary, one can be created on the fly using `IsisContext.doInSession(...)`)

To ensure that your alternative implementation takes the place of the default implementation, register it explicitly in `isis.properties`.

## Register the Service

If using the default implementation of the `EmailService` then there is nothing to do because it is automatically registered (it is annotated with `@DomainService`).

If you have written an alternative implementation, then register your implementation in `isis.properties` under the "isis.services" key.
