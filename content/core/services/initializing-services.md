Title: Initializing Services

All services registered in `isis.properties` can optionally declare lifecycle callbacks to initialize them (when the app is deployed) and to shut them down (when the app is undeployed).

### Initialization

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


### Shutdown

Shutdown is similar; the framework will call any method annotated with `@javax.annotation.PreDestroy`:

<pre>
  @PreDestroy
  public void shutdown() {
    ..
  }
</pre>


### Notes

> The initialization is called while Isis is still bootstrapping (specifically, just prior to the completion of the metamodel).  Thus, any services expecting Isis to be started should take this into account (eg be written defensively and/or add a delay of 10 seconds or so).

> An example where this might be applicable is a service that bootstraps a background scheduler.