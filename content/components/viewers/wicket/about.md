Title: Wicket viewer

The wicket module provides a customizable webapp viewer for an Isis domain model, implemented using the [Apache Wicket](http://wicket.apache.org) web framework.

Like the [HTML viewer](../html/about.html), the wicket viewer provides a generic webapp with a page displayed for each entity or collection of entities. Unlike that viewer, though, you can also customize the GUI.

### Customization

The wicket viewer allows you to customize the GUI in 3 ways:

* first and most straight-forwardly, you can change the styling using CSS

* second, you can write your own views using the Apache Wicket `Component` API.

  These views will typically be to render a specific entity, a particular property/parameter type, or a collection of entities. You can either write these views from scratch, or use existing `Component` implementations (for example the open source code available at Wicket's companion site, [wicketstuff.org](http://wicketstuff.org)).

* third, you can register your own pages for a particular object type
This allows you to render certain objects (eg a DashBoard object) using a completely customized web page if required.

- [Releases](release-notes/about.html).

