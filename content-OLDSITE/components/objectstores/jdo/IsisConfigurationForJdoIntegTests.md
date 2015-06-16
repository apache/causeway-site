Title: `IsisConfigurationForJdoIntegTests`

[//]: # (content copied to _user-guide_testing_integ-test-support)


When running integration tests with the JDO Objectstore, there are certain standard configuration properties that are usually set.  For example, integration tests are usually run against an in-memory HSQLDB database.

To remove a little bit of boilerplate, the `IsisConfigurationForJdoIntegTests` class (in the `org.apache.isis.objectstore.jdo.datanucleus` package) can be used to bootstrap the application.

The simpleapp example application (that we reverse engineer into our) [simpleapp archetype](../../../intro/getting-started/simple-archetype.html) shows this; see for example the [`SystemAppSystemInitializer`](https://github.com/apache/isis/blob/07fe61ef3fb029ae36427f60da2afeeb931e4f88/example/application/simpleapp/integtests/src/test/java/domainapp/integtests/bootstrap/SimpleAppSystemInitializer.java#L49) class.