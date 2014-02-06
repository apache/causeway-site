@ViewModel
----------

x
> **Support**
> 
> * Not yet supported by any viewers

The `@ViewModel` annotation allows the developer to declare that a domain
object is intended to be used as a view model. As such, any changes to
its structure are guaranteed to be backwardly compatible.

The annotation was originally introduced to support a requirement of the
RestfulObjects viewer which directly expose the domain objects as
RESTful representations

For example, a domain object that represents a summary of a Customer and
their most recent Orders might be annotated as:

    @NotPersistable
    @ViewModel
    public class CustomerAndOrdersViewModel {
       ...
    }
