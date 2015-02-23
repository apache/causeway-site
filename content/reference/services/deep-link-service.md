Title: Deep Link Service (1.8.0)

The `DeepLinkService` provides the ability to obtain a `java.net.URI` that links to a representation of any (persisted) domain entity or
view model.

The framework currently provides a single implementation for accessing the representation provided by the Wicket viewer.


## API

The API defined by `DeepLinkService` is:

    public interface DeepLinkService {

        /**
         * Creates a URI that can be used to obtain a representation of the provided domain object in one of the
         * Isis viewers.
         */
        URI deepLinkFor(Object domainObject);
    }

## Implementations

## Usage within the framework

At the time of writing there is no usage within the core framework, though this service is (planned to be) used by
some of the [Isis addons](http://www.isisaddons.org).


## Implementations

The Wicket viewer core framework provides a default implementation of this API:

* `org.apache.isis.viewer.wicket.viewer.services.DeepLinkServiceWicket`


## Register the Service

The `DeepLinkServiceWicket` is automatically registered with the framework (it is annotated with `@DomainService`) so there is no need to explicitly register the service.

