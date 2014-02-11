Title: ViewModel interface
----------

Indicates that a domain object is intended to be used as a view model.

### API

    public interface ViewModel {
    
        @Hidden
        public String viewModelMemento();
        
        @Hidden
        public void viewModelInit(String memento);
    }

Where:

* `viewModelMemento()`

   is called by the framework, to obtain a memento of the view model.  Typically this will be the identifier of a backing domain entity, but it could also be an arbitrary string, for example a bunch of JSON.

* `viewModelInit()`

   is called by the framework so that the view model may recreate its state in a subsequent call (using the memento that the framework obtained from `viewModelMemento()`

### Usage

Used in the example [todo app](https://github.com/apache/isis/tree/quickstart_wicket_restful_jdo-archetype-1.3.1-RC1/example/application/quickstart_wicket_restful_jdo/dom/src/main/java/app), for example the [ToDoAppDashboard](https://github.com/apache/isis/blob/quickstart_wicket_restful_jdo-archetype-1.3.1-RC1/example/application/quickstart_wicket_restful_jdo/dom/src/main/java/app/ToDoAppDashboard.java) that is rendered on the home page.


### Related Services

The [MementoService](../../core/services/memento-service.html) provides a convenient mechanism for view models to build up and parse memento strings (for the implementation of the `viewModelMemento()` and `viewModelInit()` methods.
 