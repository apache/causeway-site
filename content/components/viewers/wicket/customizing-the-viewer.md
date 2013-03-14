Title: Customizing the Viewer

{note
This is a stub article; for more information ask on the mailing list.
}

The Wicket viewer allows you to customize the GUI in 3 ways:

* first and most straight-forwardly, you can change the styling using CSS

* second, you can write your own views using the Apache Wicket `Component` API.

  These views will typically be to render a specific entity, a particular property/parameter type, or a collection of entities. Examples include:

  * [google maps v3 integration](https://github.com/danhaywood/isis-wicket-gmap3)
  * [wicked charts integration](https://github.com/danhaywood/isis-wicket-wickedcharts)
  * [full calendar integration](https://github.com/danhaywood/isis-wicket-fullcalendar)
  
  Wicket itself has lots of components available at its [wicketstuff.org](http://wicketstuff.org) companion website.  These could also be used as the basis for customizations.

* third, you can register your own pages for a particular object type.
This allows you to render certain objects (eg a Dashboard object) using a completely customized web page if required.
