Title: @ViewModel

The `@ViewModel` annotation, applied to a class, is the simplest way to indicate that the class is a view model.
View models are not persisted to the database, instead their state is encoded within their identity (ultimately
represented in the URL).  As such, view models are immutable.

For example:

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


## See also

Other domain semantics:

* [@Property](./Property.html)
* [@Collection](./Collection.html)
* [@Action](./Action.html)
* [@Parameter](./Parameter.html)
* [@DomainObject](./DomainObject.html)
* [@DomainService](./DomainService.html)

Corresponding view layer ("Layout") annotation:

* [@ViewModelLayout](./ViewModelLayout.html)
