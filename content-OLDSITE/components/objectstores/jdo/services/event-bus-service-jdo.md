Title: Event Bus Service for JDO

[//]: # (content copied to user-guide_reference_domain-services_event-bus-service)

## 1.6.0+

This service implementation is the default and is automatically registered using `@DomainService`.  No further configuration is necessary.

## 1.5.0 and previous

To use the [EventBusService](../../../../reference/services/event-bus-service.html) with the JDO Object Store, the JDO-specific implementation should be registered.

The JDO implementation does not provide any additional functionality, but is aware of the lifecycle of domain entities and so ensures that objects are not interacted with while they are being rehydrated by the object store.

#### Register the Service

Register this service like any other service, in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.datanucleus.service.eventbus.EventBusServiceJdo,\
                  ...

