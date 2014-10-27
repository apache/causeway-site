Title: Custom Representations

{note
This API should be considered beta, as it may change in the future in response to emerging requirements
}

The Restful Objects viewer implements the [Restful Object spec](http://restfulobjects.org), meaning that it:
 
* defines a well-defined set of endpoint URLs as resources
* generates a well-defined set of (JSON) representations when these resources are accessed.

There are, however, a number of other "standards" for defining representations, among these:

* [HAL](http://stateless.co/hal_specification.html) (Mike Kelly)
* [Collection+JSON](http://amundsen.com/media-types/collection/) (Mike Amundsen)
* [Siren](https://github.com/kevinswiber/siren) (Kevin Swiber)
* [JSON API](http://jsonapi.org/) (Steve Klabnik)
* [Hyper+JSON](https://github.com/cainus/hyper-json-spec) (Gregg Cainus)
* [JSON-LD](https://www.w3.org/TR/json-ld/) (W3C)
* [Hydra](http://www.markus-lanthaler.com/hydra/) (Markus Lanthaler)

A good discussion about the relative merits of several of these different hypermedia formats can be found [here](https://groups.google.com/forum/#!msg/api-craft/NgjzQYVOE4s/EAB2jxtU_TMJ).

While Isis' Restful Objects viewer only has "out-of-the-box" support for the representations defined in the Restful Objects spec,
it is possible to plugin a custom representation generator that can produce any arbitrary representation.

## API

The API to implement is the `RepresentationService` API:

    import javax.ws.rs.core.Response;
    import org.apache.isis.applib.annotation.Programmatic;
    import org.apache.isis.core.metamodel.adapter.ObjectAdapter;
    import org.apache.isis.viewer.restfulobjects.rendering.RendererContext;
    import org.apache.isis.viewer.restfulobjects.rendering.domainobjects.*;

    public interface RepresentationService {
    
        @Programmatic
        Response objectRepresentation(
                Context rendererContext,
                ObjectAdapter objectAdapter);
    
        @Programmatic
        Response propertyDetails(
                Context rendererContext,
                ObjectAndProperty objectAndProperty,
                MemberReprMode memberReprMode);
    
        @Programmatic
        Response collectionDetails(
                Context rendererContext,
                ObjectAndCollection objectAndCollection,
                MemberReprMode memberReprMode);
    
        @Programmatic
        Response actionPrompt(
                Context rendererContext,
                ObjectAndAction objectAndAction);
    
        @Programmatic
        Response actionResult(
                Context rendererContext,
                ObjectAndActionInvocation objectAndActionInvocation,
                ActionResultReprRenderer.SelfLink selfLink);
    
        public static interface Context extends RendererContext {
            ObjectAdapterLinkTo getAdapterLinkTo();
        }
    }

Restful Objects' out-of-the-box support for Restful Objects spec uses this same API, specifically `RepresentationServiceForRestfulObjects` (in the `org.apache.isis.viewer.restfulobjects.rendering.service` package).

Each of these methods provides:
* a `RendererContext`, providing access to request-specific context (eg HTTP headers), session-specific context (eg authentication) and global context (eg configuration settings)
* an object representing the information to be rendered, eg `ObjectAdapter`, `ObjectAndProperty`, `ObjectAndCollection` etc
* for members, whether the representation is in read/write mode (`MemberReprMode`) 

## Configuring

Implement the service and register in `WEB-INF/isis.properties`, eg:

    isis.services=...,\
                  com.mycompany.myservice.RepresentationServiceForMyRestApi,
                  ...

This will replace the default representation.

## See also

If all that is required is a very simple representations (of objects), see [here](simplified-object-representation.html).

Or, it is also possible to simply suppress certain elements; see [here](suppressing-elements-of-the-representations.html).
