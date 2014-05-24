Title: `IsisConfigurationForJdoIntegTests` (1.5.0-snapshot)

When running integration tests with the JDO Objectstore, there are certain standard configuration properties that are usually set.  For example, integration tests are usually run against an in-memory HSQLDB database.

To remove a little bit of boilerplate, the `IsisConfigurationForJdoIntegTests` class (in the `org.apache.isis.objectstore.jdo.datanucleus` package) can be used to bootstrap the application.

The (example applications that we reverse engineer into our) [two](../../../intro/getting-started/simple-archetype.html) [archetypes](../../../intro/getting-started/quickstart-archetype.html) show this; see for example the [`ToDoSystemInitializer`](https://github.com/apache/isis/blob/3dcfb2fcd61636ff2fac66a3c7c54a500fdf2c6a/example/application/quickstart_wicket_restful_jdo/integtests/src/test/java/integration/ToDoSystemInitializer.java#L70) class.