Title: Publishing Service [not yet released]

The Publishing Service enables Isis to publish both changes to domain objects, and also action invocations to third parties.  A typical use case is to publish onto a pub/sub bus such as [ServiceMix](http://servicemix.apache.org/) or [ActiveMQ](http://activemq.apache.org/) to keep other systems up to date.

Publishing requires at minimum two things:

*  domain classes annotated with `PublishedAction` or `PublishedObject`
   
   The former causes any invocations of an action to be published, the latter causes any changes to the object to be published.  You can annotate with either or both.  

* an implementation of the `org.apache.isis.applib.services.publish.PublishingService` interface must be registered as a domain services

   This is done in the usual way, under the `isis.properties` config file

Over and above this, the service does provide considerable flexibility for fine-tuning the serialized form and the contents (payload) of the event.

### Annotating the Domain Model

To indicate that an action should be published, use the `PublishedAction` annotation.  For example:

<pre>
  public class ToDoItem {
    ...
    @PublishedAction
    public void completed() { ... }
    ...
  }
</pre>

Similarly, to indicate that any changes to an object should be published, use the `PublishedObject` annotation:

<pre>
  @PublishedObject
  public class ToDoItem {
    ...
  }
</pre>

Either or both of these annotations can be used.

As described further down in this article, it is possible to fine-tune the payload.  However, simply using the above annotations will suffice in many cases.

### Configuring the Publishing Service

The `PublishingService` interface is:

<pre>
  package org.apache.isis.applib.services.publish;

  public interface PublishingService {
    
    @Hidden
    public void publish(EventMetadata metadata, EventPayload payload);
    
    void setEventSerializer(EventSerializer eventSerializer);
  }
</pre>

Typically implementations will use the injected `EventSerializer` to convert the metadata and payload into a form to be published:

<pre>
  package org.apache.isis.applib.services.publish;

  public interface EventSerializer {
    public Object serialize(EventMetadata metadata, EventPayload payload);
  }
</pre>

The serialized form returned by `EventSerializer` will typically be something like JSON, XML or a string.  The signature of `serialize(...)` returns an object 
Although not necessary to implement `EventSerializer`, typically one should also for maximum flexibility, but its important to make sure that the `PublishingService` is able to handle the serialized form.  Strings are a good
lowest common denominator, but in some cases are type-safe equivalent, such as a
`org.w3c.dom.Document` or an `org.json.JSONObject` might be returned instead.

### Default Implementations

A default implementation of `EventSerializer` will be supplied to the `PublishingService` if none has been specified as a domain service.  This default implementation simply concatenates the metadata and payload together into a single string:

<pre>
  public interface EventSerializer {
    ...
    public static class Simple implements EventSerializer {

      @Programmatic
      @Override
      public Object serialize(EventMetadata metadata, EventPayload payload) {
          return "PUBLISHED: \n    metadata: " + 
                    metadata.getGuid() + ":" + 
                    metadata.getUser() + ":" + 
                    metadata.getTimestamp() + 
                 ":    payload:s\n" + 
                    payload.toString();
      }
    }
    ...
  }
</pre>

A simple implementation of `PublishingService` (which must be configured as a domain service) is also available; this simply writes to stderr is also provided:

<pre>
  public interface PublishingService {
  ...
    public static class Stderr implements PublishingService {
    private EventSerializer eventSerializer = new EventSerializer.Simple();
      @Hidden
      @Override
      public void publish(EventMetadata metadata, EventPayload payload) {
        Object serializedEvent = eventSerializer.serialize(
          metadata, payload);
        System.err.println(serializedEvent);
      }

      @Override
      public void setEventSerializer(EventSerializer eventSerializer) {
        this.eventSerializer = eventSerializer;
      }
    }
    ...
  }
</pre>

Thus, to configure a very simple form of publishing, add the following to `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
        org.apache.isis.applib.services.publish.PublishingService$StdErr
</pre>

### Restful Objects (JSON) Serializer

An alternative serializer is provided by the `isis-viewer-restfulobjects-rendering` module.  This converts the provided `EventPayload` into the form specified by the [Restful Objects spec](http://restfulobjects.org).

To configure this serializer, add the following to `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
       org.apache.isis.viewer.restfulobjects.rendering.eventserializer.RestfulObjectsSpecEventSerializer
</pre>

TODO: need to specify the base url via config.

### Fine-tuning the payload

The `EventPayload` that is serialized identifies the object(s) being interacted with or changed, and in the case of the action invocation provides details of the action arguments and result (if any) of that action.  However, the payload does not include the new state of these objects.  It is therefore the responsibility of the subscriber to call back to Isis to determine any information that has not been published.

Doing this is comparatively straightforward if using the Restful Object serializer and Restful Objects viewer; the JSON provided includes hrefs to the objects.

In some circumstances, however, it may make more sense to eagerly "push" information about the change to the subscriber by including that state within the payload.  

To accomplish this, an implementation of a "`PayloadFactory`" must be specified in the annotation.  For actions, implement `@PublishedAction.PayloadFactory`:

<pre>
  public @interface PublishedAction {
    
    public interface PayloadFactory {
      @Programmatic
      public EventPayload payloadFor(
          Identifier actionIdentifier, 
          Object target, List&lt;Object&gt; arguments, Object result);
    }
    Class&lt;? extends PayloadFactory&gt; value()  default PayloadFactory.class;
  }
</pre>

For objects, the interface to implement is `@PublishedObject.PayloadFactory`:

<pre>
  public @interface PublishedObject {
    
    public interface PayloadFactory {
      @Programmatic
      public EventPayload payloadFor(Object changed);
    }
    Class&lt;? extends PayloadFactory&gt; value()  default PayloadFactory.class;
  }
</pre>

For example, the following will eagerly include the `ToDoItem`'s `description` property whenever it is changed:

<pre>
  @PublishedObject(ToDoItemPayloadFactory.class)
  public class ToDoItem {
    ...
  }
</pre>

where `ToDoItemPayloadFactory` is defined as:

<pre>
  public class ToDoItemChangedPayloadFactory implements PayloadFactory {

    public static class ToDoItemPayload 
        extends EventPayloadForChangedObject<ToDoItem> {

      public ToDoItemPayload(ToDoItem changed) {
          super(changed);
      }
        
      public String getDescription() {
          return getChanged().getDescription();
      }
    }
    @Override
    public EventPayload payloadFor(Object changedObject) {
      return new ToDoItemPayload((ToDoItem) changedObject);
    }
  }
</pre>

### Class Diagram

The following class diagram shows how the above components fit together:

 ![](images/yuml.me-23db58a4.png)

The diagram was generated at [yuml.me](http://yuml.me/edit/23db58a4) using the following description:

<pre>
[PublishingService]++-serializesUsing>[EventSerializer]
[PublishingService]++-defaultOpf>[PublishedObject.PayloadFactory]
[PublishingService]++-defaultApf>[PublishedAction.PayloadFactory]
[EventPayload]^-[EventPayloadForChangedObject]
[EventPayload]^-[EventPayloadForActionInvocation]
[PublishedObject]annotatedWith-.->[PublishedObject.PayloadFactory]
[PublishedAction]annotatedWith-.->[PublishedAction.PayloadFactory]
[PublishedObject.PayloadFactory]creates-.->[EventPayloadForChangedObject]
[PublishedAction.PayloadFactory]creates-.->[EventPayloadForActionInvocation]
[EventMetadata]
[EventSerializer]-serializes>[EventMetadata]
[EventSerializer]-serializes>[EventPayload]
</pre>