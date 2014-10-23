Title: @ViewModel

{note
This is a stub.
}


Indicates that the class is a view model whose identity is inferred from the state of its (non-@NotPersisted) properties.  

Only properties supported by the configured [MementoService](../services/memento-service.html) can be used.  The default implementation supports all the value types and persisted entities.  However, view models are NOT supported.

