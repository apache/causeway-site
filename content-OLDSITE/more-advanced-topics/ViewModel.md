Title: ViewModels

[//]: # (content copied to _user-guide_xxx)

In most cases users can accomplish the business operations they need by invoking actions directly on domain entities.  For some high-volume or specialized uses cases, 
though, there may be a requirement to bring together data or functionality that spans several entities.

Also, if using Isis' REST API then the REST client may be a native application (on a smartphone or tablet, say) that is owned/deployed by a third party.  In these cases exposing the entities directly would be inadvisable because a refactoring of the domain entity would change the REST API and probably break that REST client.

To support these use cases, Isis therefore allows you to write a view model, either by annotating the class with [@ViewModel](http://isis.apache.org/reference/recognized-annotations/ViewModel.html) or (for more control) by implementing the `ViewModel` interface.

View models are immutable; their state is in fact encoded in their identity.  Editable view models can be simulated by implementing the `ViewModel.Cloneable` interface.

#### A word of caution: don't use view models indiscriminately

One of the compelling things about Isis-based applications is that the cost of the UI/Application layer is zero if you don't make use of View Models.  To put that another way: if you develop your Isis application only in terms of view models, then you are throwing away one of the major benefits of the framework.

So, the sensible thing to do when building non-trivial business applications is:

1. Focus on the overall domain model (particularly the shape which in turn gets influenced by the domain behaviour required - so sorting out the business behaviour up front with your business subject matter experts avoids an unsuitable shape that results from a "CRUD" behaviour alone). The domain model as represented by a UML class/object model should be devoid of all infrastructure plumbing concerns.

2. Build the Isis app with just using Domain Objects taken directly from the Domain Model only (do not introduce View Models at this crucial stage).

3. Verify the domain model with the business  using the live application from (2) and adjust as necessary.

4. Once you have a consensus with the overall domain model then you can have a discussion with the business about any specialised UI interactions that might require the use of a View Model or several. 

5. Add as many View Models over time as necessary but don't use these to compensate for an inadequate Domain Model and don't use them in lieu of a required extension to the Domain Model (a good domain model shape that more or less follows Peter Coad's [Domain Neutral Component archetypal](http://www.step-10.com/SoftwareDesign/ModellingInColour/dnc.html) domain shape will stand you in good stead for extensibility and longevity). 

6. Never be tempted to put domain logic into View Models. 

7. Never have any of the domain objects dependent on View Models. I.e. The direction of dependency is one way: The View Models depend on the Domain Layer."

(Adapted from [this post](http://isis.markmail.org/thread/uxo66yc54xdon4u5) on users@isis.a.o; many thanks).


## @ViewModel annotation

The simplest way to create a view model is to annotate the class with `@ViewModel`:

    @ViewModel
    public class MyViewModel {
    
        public MyViewModel() {}
        
        ...
        
    }

View models must have a no-arg constructor, but there are few other constraints.

* if the view model has dependencies on domain services, then either:
  * instantiate using `DomainObjectContainer#newTransientInstance()` or
  * instantiate directly and then inject explicitly using `DomainObjectContainer#injectServicesInto(.)`
* if the view model has no dependencies on domain services, then just instantiate directly 

>
> Note that there is a `DomainObjectContainer#newViewModelInstance(.)`; this is for view models that implement `ViewModel` interface and can be safely ignored.
>
    
The view model's memento will be derived from the value of the view model object's properties.  Any [@NotPersisted](http://isis.apache.org/reference/recognized-annotations/NotPersisted.html) properties will be excluded from the memento, as will any [@Programmatic](http://isis.apache.org/reference/recognized-annotations/Programmatic.html) properties.  Properties that are merely [@Hidden](http://isis.apache.org/reference/recognized-annotations/Hidden-deprecated.html) *are* included in the memento.

Only properties supported by the configured [MementoService](../reference/services/memento-service.html) can be used.  The default implementation supports all the value types and persisted entities.

(As of 1.8.0) there are some limitations:
* view models cannot hold collections other view models (simple properties *are* supported, though)
* collections (of either view models or entities) are ignored.



## ViewModel interface

Another way to indicate that a domain object is a view model is by implementing the `ViewModel` interface:

    public interface ViewModel {
    
        @Hidden
        public String viewModelMemento();
        
        @Hidden
        public void viewModelInit(String memento);
    }

where:

* `viewModelMemento()`

   is called by the framework, to obtain a memento of the view model.  Typically this will be the identifier of a backing domain entity, but it could also be an arbitrary string, for example a bunch of JSON.

* `viewModelInit()`

   is called by the framework so that the view model may initialize or subsequently recreate its state in a subsequent call (using the memento that the framework obtained from `viewModelMemento()`

View models implemented this way must be instantiated using `DomainObjectContainer#newViewModelInstance(Class,String)`, where the second String argument is the memento of the view model, and which is passed to the view model in turn through the `viewModelInit(.)` method.

   
The `viewModelMemento()` and `viewModelInit()` methods should be reciprocals of each other, but there are no other constraints.  The [MementoService](../reference/services/memento-service.html) provides a convenient mechanism for view models to build up and parse memento strings.  But the methods could do anything; it would even be possible for a view model to store its state in the `HttpSession` and key that state with a GUID.



 