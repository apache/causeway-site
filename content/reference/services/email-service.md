Title: Email Service (1.8.0-SNAPSHOT)

The email service provides the ability to send emails to one or more recipients.  The framework also provides a default implementation that sends email as an HTML message, using an external SMTP provider.

## API

The API for the service is:

    public interface EmailService {

        @PostConstruct
        @Programmatic
        public void init() ;

        @Programmatic
        boolean send(List<String> to, List<String> cc, List<String> bcc, String subject, String body, DataSource... attachments);

        @Programmatic
        boolean isConfigured();
        
      }

where:

* `init()` is always called by the framework, and allows the implementation to read configuration properties and initialize itself
* `send(...)` is the main API to send the email (and optional attachments)
* `isConfigured()` determines whether the implementation was configured and initialized correctly.

If `isConfigured()` returns false then it is NOT valid to call `send(...)` (and doing so will result in an `IllegalStateException` being thrown.
      
## Implementation & Configuration

The framework provides a default implementation (`EmailServiceDefault`) that sends email as an HTML message, using an external SMTP provider.

To use this service the following properties must be configured:

* `isis.service.email.sender.address`
* `isis.service.email.sender.password`

and these properties may optionally be configured (each has a default):

* `isis.service.email.sender.hostname` (defaults to "smtp.gmail.com" if not specified)
* `isis.service.email.port` (defaults to "587" if not specified)
* `isis.service.email.tls.enabled` (defaults to "true" if not specified)

These configuration properties can be specified either in `isis.properties` or in an [external configuration file](../externalized-configuration.html).

If prototyping (that is, running the app using `org.apache.isis.WebServer`), the configuration properties can also be specified as system properties.  For example, if you create a test email account on gmail, you can configure the service using:

    -Disis.service.email.sender.address=xxx@gmail.com -Disis.service.email.sender.password=yyy

where "xxx" is the gmail user account and "yyy" is its password

## Alternative Implementations

If you wish to write an alternative implementation, be aware that it should process the message body as HTML (as opposed to plain text or any other format).

Also, note that (unlike most Isis domain services) the implementation is also instantiated and injected by Google Guice.  This is because `EmailService` is used as part of the [user registration](../../components/viewers/wicket/user-registration.html) functionality and is used by Wicket pages that are accessed outside of the usual Isis runtime.


This implies a couple of additional constraints:

* first, implementation class should also be annotated with `@com.google.inject.Singleton`
* second, there may not be any Isis session running.  (If necessary, one can be created on the fly using `IsisContext.doInSession(...)`)

To ensure that your alternative implementation takes the place of the default implementation, register it explicitly in `isis.properties`.

## Register the Service

If using the default implementation of the `EmailService` then there is nothing to do because it is automatically registered (it is annotated with `@DomainService`).

If you have written an alternative implementation, then register your implementation in `isis.properties` under the "isis.services" key.

## Related Services

The email service is used by the `EmailNotificationService`, see [here](./email-notification-service.html).
