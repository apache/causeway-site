Title: Common Use Cases

## <a name="screencast"></a>Screencast

How Apache Isis builds a webapp from the underlying domain object model...

<iframe width="420" height="315" src="http://www.youtube.com/embed/ludOLyi6VyY" frameborder="0" allowfullscreen></iframe>

## Prototyping

Isis is great for rapid prototyping, because all you need to write in order to get an application up-and-running is the domain model objects.

By focussing just on the domain, you'll also find that you start to develop a ubiquitous language - a set of terms and concepts that the entire team (business and technologists alike) have a shared understanding.

Once you've sketched out your domain model, you can then either start-over using your preferred framework, or you might choose to take the domain model forward into more formal specification and testing.

## Deploy on your own App

The programming model defined by Isis deliberately minimizes the dependencies on the rest of the framework. In fact, the only hard dependency that the domain model classes have on Isis is through the `org.apache.isis.applib` classes, mostly to pick up annotations such as `@Disabled`. The idea is to make it easy to be able to write take a domain object prototyped and/or tested using Isis, but to deploy on some other framework's runtime.

If you are interested in taking this approach, note that there is one important interface that must be implemented by your own framework, namely `DomainObjectContainer`. This interface represents the one-and-only "touchpoint" between the domain objects and the runtime. If you inspect the methods then you'll see it covers such concerns as persistence, and of raising warnings or errors.

Isis' own runtime injects an (implementation of this) interface into each and every domain object. You will likely need to do something similar within your own framework, (or come up with an equivalent mechanism, eg Service Locator pattern).

## Deploy on Isis as an auto-generated Webapp

One of the original motivations for Isis itself was to be able automatically generate a user interface for a domain object model.

Isis' has a pluggable architecture allowing different user interface technologies.  The principal implementation (as configured by the [simple](../getting-started/simple-archetype.html) or [quickstart](../getting-started/quickstart-archetype.html) archetypes) is the [Wicket viewer](../../components/viewers/wicket/about.html).  This provides an appealing default user interface, with the ability to customize the user interface by writing new [Apache Wicket](http://wicket.apache.org) components.  Some third-party components can be found on github, integrating the Wicket viewer with [google maps](https://github.com/isisaddons/isis-wicket-gmap3), [a full calendar](https://github.com/isisaddons/isis-wicket-fullcalendar2), [a charting library](https://github.com/isisaddons/isis-wicket-wickedcharts) and a [export to Excel](https://github.com/isisaddons/isis-wicket-excel) component.

It is also possible to write your own viewers:

* One of Isis' committers has developed a viewer based on [DHTMLX](), also available on [github](https://github.com/madytyoo/dhtmlx-isis-viewer).
* Another of Isis' committers has a (closed source) viewer based on [Wavemaker](http://www.wavemaker.com/).

Deploying on Isis means that the framework also manages object persistence.  Again this is pluggable, but the principal implementation is the [JDO objectstore](../../components/objectstores/jdo/about.html).  Because JDO supports both SQL and NoSQL databases, you can then deploy on a variety of platforms, including the [Google App Engine (GAE)](https://developers.google.com/appengine/).

## Deploy on Isis as a RESTful web service

REST (Representation State Transfer) is an architectural style for building highly scalable distributed systems, using the same principles as the World Wide Web. Many commercial web APIs (twitter, facebook, Amazon) are implemented as either pure REST APIs or some approximation therein.

The [Restful Objects specification](http://restfulobjects.org) defines a means by a domain object model can be exposed as RESTful resources using JSON representations over HTTP.  Isis' [RestfulObjects viewer](../../components/viewers/restfulobjects/about.html) is an implementation of that spec, making any Isis domain object automatically available via REST.

There are two main use cases for deploying Isis as a RESTful web service are:

- to allow a custom UI to be built against the RESTful API

  For example, using Javascript/JQuery, or an RIA technology such as Flex, JavaFX, Silverlight

- to enable integration between systems

  REST is designed to be machine-readable, and so is an excellent choice for synchronous data interchange scenarios.

As for the auto-generated webapps, the framework manages object persistence, for example using the [JDO objectstore](../../components/objectstores/jdo/about.html) objectstore.  It is perfectly possible to deploy the RESTful API alongside an auto-generated webapp; both work from the same domain object model.
