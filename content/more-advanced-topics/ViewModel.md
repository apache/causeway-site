Title: ViewModels
----------

In most cases users can accomplish the business operations they need by invoking actions directly on domain entities.  For some high-volume or specialized uses cases, 
though, there may be a requirement to bring together data or functionality that spans several entities.

Also, if using Isis' REST API then the REST client may be a native application (on a smartphone or tablet, say) that is owned/deployed by a third party.  In these cases exposing the entities directly would be inadvisable because a refactoring of the domain entity would change the REST API and probably break that REST client.

To support these use cases, Isis therefore allows you to write a view model, either by annotating the class with [@ViewModel](http://isis.apache.org/reference/recognized-annotations/ViewModel.html) or (for more control) by implementing the `ViewModel` interface.

View models are immutable; their state is in fact encoded in their identity.  Editable view models can be simulated by implementing the `ViewModel.Cloneable` interface.


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
    
The view model's memento will be derived from the value of the view model object's properties.  Any [@NotPersistent](http://isis.apache.org/reference/recognized-annotations/NotPersistent.html) properties will be excluded from the memento, as will any [@Programmatic](http://isis.apache.org/reference/recognized-annotations/Programmatic.html) properties.  Properties that are merely [@Hidden](http://isis.apache.org/reference/recognized-annotations/Hidden-deprecated.html) are included in the memento.

Only properties supported by the configured [MementoService](../reference/services/memento-service.html) can be used.  The default implementation supports all the value types and persisted entities.

(As of 1.8.0-SNAPSHOT) there are some limitations:
* view models cannot reference other view models
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


 