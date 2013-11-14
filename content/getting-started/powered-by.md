Title: Powered by

Here are some freely accessible (and sometimes open source) applications that are powered by Isis.

>If you have written an app in Isis that you'd like to share, please mention it on the [mailing list](../support.html).

## Estatio

Estatio is an open source estate management application, available on [github](https://github.com/estatio/estatio).

<img src="https://raw.github.com/estatio/estatio/master/docs/20130715/2.png" width="530"></img>


Much of Isis' recent development has been driven out by the requirements of this application, so you can see for yourself how many of the features in Isis are used in real life.

Estatio is being deployed by [Eurocommercial Properties](http://www.eurocommercialproperties.com/), who sponsored the development of the framework in order to make Estatio a reality.  Our heart-felt thanks to them for their investment.  


## TransportPlanner

TransportPlanner is a demo done by [Marintek AS](http://www.sintef.no/home/MARINTEK/) to show a possible 'solution' to a multimodal transport planning problem. It's a small part of a bigger European funded project.

The domain is that:

-  some cargo should be transported from a pickup destination to a delivery destination.
-  A 'client' creates a transport demand
-  A 'logistics service provider' plans a route from pickup to delivery using a shortest path algorithm.
-  The route's waypoints (where cargo is loaded from one providere to another) may be shown on a map.
-  The costs associated with each leg may be shown as a pie chart
- The resource usage, i.e. costs and time for each leg, may be shown as a bar chart.
-  An event may be generated (e.g. some customs papers are missing, therefore transport execution stops and a replan
is necessary).

The author, Christian Steinebach, wrote this demo part-time over the course of a few weeks.  He commented:

> I did not have too much time to get 'something done' ... But although I had a hard time in the beginning with Isis I don't think I would have made it
in time using 'conventional' development with database, GUI etc...

He went on:
> Because this is a demo, everything is a "bit shaky" and there is a lot of room for improvement, but it does show how a relatively simple domain model can be brought 'alive' using Isis.

If you want to try out the application, grab the [source code](https://www.assembla.com/code/transportplanner/git/nodes) and use this [script](TransportPlanner/about.html).  Note that the app was written against a snapshot version of Isis; ask on the [mailing list](../support.html) for help.

<table>
  <tr>
    <td>TransportPlanner allows schedules of journeys to be planned.  It uses Isis' integration with <a href="https://github.com/danhaywood/isis-wicket-gmap3">Google Maps</a> to provide the map.</td>
    <td>
      <a href="https://www.assembla.com/code/transportplanner/git/nodes/master/screenshots/TransportDemand.png"><img src="https://www.assembla.com/code/transportplanner/git/node/blob/screenshots/TransportDemand.png?raw=1&rev=a9d5184ecb05c3d95dafec587c84cfcbc7a25b8b" width="530"></img></a>
    </td>
  </tr>
  <tr>
    <td>TransportPlanner uses Isis' <a href="https://github.com/danhaywood/isis-wicket-wickedcharts">Wicked Charts</a> integration to provide custom graphs</td>
    <td>
      <a href="https://www.assembla.com/code/transportplanner/git/nodes/master/screenshots/TPM_CostPie.png"><img src="https://www.assembla.com/code/transportplanner/git/node/blob/screenshots/TPM_CostPie.png?raw=1&rev=a9d5184ecb05c3d95dafec587c84cfcbc7a25b8b" width="530"></img></a>
    </td>
  </tr>
  <tr>
    <td>Another example of TransportPlanner's use of <i>Wicked Charts</i></td>
    <td>
      <a href="https://www.assembla.com/code/transportplanner/git/nodes/master/screenshots/Tpm_ResourceUsage.png"><img src="https://www.assembla.com/code/transportplanner/git/node/blob/screenshots/Tpm_ResourceUsage.png?raw=1&rev=a9d5184ecb05c3d95dafec587c84cfcbc7a25b8b" width="530"></img></a>
    </td>
  </tr>
<table>

