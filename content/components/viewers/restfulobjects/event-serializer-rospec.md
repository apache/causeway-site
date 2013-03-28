Title: Event Serializer for the RO Spec [1.2.0-SNAPSHOT]

The [Publishing Service](../../../core/services/publishing-service.html) enables Isis to publish action invocations and also changes of domain objects to third party systems.

One of the APIs defined by this service is the `EventSerializer`, such that the event can be rendered into different formats.  The Restful Objects viewer provides an implementation of this API, serializing the the provided `EventPayload` into the form specified by the [Restful Objects spec](http://restfulobjects.org).  The serializer itself is part of the `org.apache.isis.viewer:isis-viewer-restfulobjects-rendering` module.  

For example, this is the JSON generated on an action invocation:

 ![](images/action-invocation-published-to-stderr.png)

while this is the object change JSON:

 ![](images/changed-object-published-to-stderr.png)


If you configure the default `PublishingService` (as described [here](../../../core/services/publishing-service.html)) along with the `RestfulObjectsSpecEventSerializer`, then you should see JSON being written to your console.


### Registering and Configuring the Serializer

To register the serializer with Isis, add the following to `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
       org.apache.isis.viewer.restfulobjects.rendering.eventserializer.RestfulObjectsSpecEventSerializer
</pre>

In addition, the `baseUrl` to use in hyperlinks must be specified, also in `isis.properties`; for example:

<pre>
isis.viewer.restfulobjects.RestfulObjectsSpecEventSerializer.baseUrl=https://myapp.mycompany.com:8080/restful/.
</pre>

If no `baseUrl` is specified, then the default URL is `http://localhost:8080/restful/`.

{note
Because the `baseUrl` will be different in production vs development, you will probably want to [configure Isis](configuration-files.html) to pick up its configuration file
from an external directory.
}

