Singleton &amp; request-scoped domain services
-----------------------------------------------

Services consist of a set of logically grouped actions, and as such follow the same conventions as for entities. However, a service cannot have (persisted) properties, nor can it have (persisted) collections.

For convenience you can [inherit](../how-tos/how-to-01-010-How-to-have-a-domain-object-be-a-POJO.html) from `AbstractService` or one of its subclasses, but this is not mandatory.

### Registering domain services

All noted [elsewhere](../how-to-09-010-How-to-register-domain-services,-repositories-and-factories.html), domain services (which includes repositories and factories) should be registered in the `isis.properties` configuration file, under `isis.services` key (a comma-separated list):

For example:

    isis.services = com.mycompany.myapp.employee.Employees\,
                    com.mycompany.myapp.claim.Claims\,
                    ...

This will then result in the framework instantiating a single instance of each of the services listed.

If all services reside under a common package, then the `isis.services.prefix` can specify this prefix:

    isis.services.prefix = com.mycompany.myapp
    isis.services = employee.Employees,\
                    claim.Claims,\
                    ...

This is quite rare, however; you will often want to use default implementations of domain services that are provided by the framework and so will not reside under this prefix.

Examples of framework-provided services (as defined in the applib) can be found referenced from the main [documentation](../../documentation.html) page.   They include clock, auditing, publishing, exception handling, view model support, snapshots/mementos, and user/application settings management.


### Service scopes

By default all domain services are considered to be singletons, and thread-safe.

Sometimes though a service's lifetime is applicable only to a single request; in other words it is request-scoped.

The CDI annotation `@javax.enterprise.context.RequestScoped` is used to indicate this fact:

     @javax.enterprise.context.RequestScoped
     public class MyService extends AbstractService {
         ...
     }

The framework provides a number of request-scoped services; these can be found referenced from the main [documentation](../../documentation.html) page.   They include scratchpad service, query results caching, and support for co-ordinating bulk actions. 


### (Suppressing) contributed actions

Any n-parameter action provided by a service will automatically be contributed to the list of actions for each of its (entity) parameters. From the viewpoint of the entity the action is called a contributed action.

For example, given a service:

    public interface Library {
        public Loan borrow(Loanable l, Borrower b);
    }

and the entities:

    public class Book implements Loanable { ... }y

and

    public class LibraryMember implements Borrower { ... }

then the `borrow(...)` action will be contributed to both `Book` and to `LibraryMember`.

This is an important capability because it helps to decouple the concrete classes from the services.

If necessary, though, this behaviour can be suppressed by annotating the service action with  `@org.apache.isis.applib.annotations.NotContributed`.

For example:

    public interface Library {
        @NotContributed
        public Loan borrow(Loanable l, Borrower b);
    }

If annotated at the interface level, then the annotation will be inherited by every concrete class. Alternatively the annotation can be applied at the implementation class level and only apply to that particular implementation.

Note that an action annotated as being `@NotContributed` will still appear in the service menu for the service. If an action should neither be contributed nor appear in service menu items, then simply annotate it as `@Hidden`.

### (Suppressing) service menu items

By default every action of a service (by which we also mean repositories and factories) will be rendered in the viewer, eg as a menu item for that service menu. This behaviour can be suppressed by annotating the action using `@org.apache.isis.applib.annotations.NotInServiceMenu`.

For example:

    public interface Library {
        @NotInServiceMenu
        public Loan borrow(Loanable l, Borrower b);
    }

Note that an action annotated as being `@NotInServiceMenu` will still be contributed. If an action should neither be contributed nor appear in service menu items, then simply annotate it as `@Hidden`.

Alternatively, this can be performed using a supporting method:

    public class LibraryImpl implements Library {
        public Loan borrow(Loanable l, Borrower b) { ... }
        public boolean notInServiceMenuBorrow() { ... }
    }

### (Suppressing) service menus

If none of the service menu items should appear, then the service itself should be annotated as `@Hidden`.

For example:

    @Hidden
    public interface EmailService {
        public void sendEmail(String to, String from, String subject, String body);
        public void forwardEmail(String to, String from, String subject, String body);
    }

### Initializing Services

Services can optionally declare lifecycle callbacks to initialize them (when the app is deployed) and to shut them down (when the app is undeployed).

An Isis session *is* available when initialization occurs (so services can interact with the object store, for example). [1.4.0-SNAPSHOT].

#### Initialization

The framework will call any `public` method annotated with `@javax.annotation.PostConstruct` and with either no arguments of an argument of type `Map<String,String>`:

<pre>
  @PostConstruct
  public void init() {
    ..
  }
</pre>

or

<pre>
  @PostConstruct
  public void init(Map<String,String> props) {
    ..
  }
</pre>

In the latter case, the framework passes in the configuration (`isis.properties` and any other component-specific configuration files).


#### Shutdown

Shutdown is similar; the framework will call any method annotated with `@javax.annotation.PreDestroy`:

<pre>
  @PreDestroy
  public void shutdown() {
    ..
  }
</pre>


### The getId() method

Optionally, a service may provide a `getId()` method:

    public String getId()

This method returns a logical identifier for a service, independent of its implementation. Currently it used only by perspectives, providing a label by which to record the services that are available for a current user's profile. <!--See ? for more about profiles and perspectives.-->

