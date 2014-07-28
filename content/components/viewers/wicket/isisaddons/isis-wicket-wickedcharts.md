Title: Wickedcharts extension for Wicket viewer

A [Wicket extension](https://github.com/isisaddons/isis-wicket-wickedcharts) integrating Isis with [Wicked Charts](https://code.google.com/p/wicked-charts/).  *Wicked Charts* is in turn an integration between [Apache Wicket](http://wicket.apache.org) and the [Highcharts](http://www.highcharts.com/) JS charting library).

The library provides two separate components/extensions for the Wicket viewer:

* `summarycharts`: render a standalone collection with `BigDecimal` properties as a chart.  (This component can be thought of as an enhancement of the base `summary` view provided by Wicket UI viewer).

* `scalarchart`: renders a standalone scalar value (from an action invocation) as a chart

**Please note that while this project and *Wicked Charts* are licensed under Apache 2.0 License, *Highcharts* itself is only free for non-commercial use.  See [here](http://shop.highsoft.com/highcharts.html) for further details.**


## Screenshots

The following screenshots are taken from the [demo app](https://github.com/isisaddons/isis-wicket-wickedcharts/tree/master/zzzdemo) (adapted from Isis' quickstart archetype).

#### Summary Charts

A collection with `BigDecimal` properties:

<img src="https://raw.githubusercontent.com/isisaddons/isis-wicket-wickedcharts/master/images/summarychart-tab.png" style="width: 900px;"/>

renders the returned chart with associated summary data:

<img src="https://raw.githubusercontent.com/isisaddons/isis-wicket-wickedcharts/master/images/summarychart.png" style="width: 900px;"/>


#### Scalar Chart

Result of an action to analyze `ToDoItem`s by their category:

<img src="https://raw.githubusercontent.com/isisaddons/isis-wicket-wickedcharts/master/images/piechart.png" style="width: 900px;"/>

   
## Download

The extension is hosted on [github](https://github.com/isisaddons/isis-wicket-wickedcharts).
