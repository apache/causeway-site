Title: TransportPlanner Script

###Log in
- log in with chris/pass
- a user with less priviliges is arne/pass (Arne is not allowed to plan. He represents a customer who only is able to create a transport demand)

###Fixtures
- System/Install to have some predefined objects. Give it some time to complete...

###Browse existing `TransportDemand`s
- Select 'Transport Demands/All Transport Demands' to show a list of predefined transport demands, i.e. requests to transport a cargo from pickup to delivery.
    -   The [calendar view](https://github.com/danhaywood/isis-wicket-fullcalendar) gets somewhat confused by the dates.
- Select 'Fiskarstrand-Rotterdam' with the Dried Fish cargo
- On the left side of the screen some details show up, on the right side an empty schedule and no waypoints.

###Schedule a new `TransportDemand`
- Select the 'Plan transport' at the top right corner of the screen
- You may now enter you criteria for finding a transport. Max price, max time and/or 'fastest', 'cheapest', 'cheap and fast' and, as a bonus 'expensive and slow' ;-)
  The software uses a shortest-paths-algorithm to look for the best solutions according to your criterium
- When done, click and a list with possible schedules is presented
- Select one, click the corresponding check box on the left and click 'plan and book'
- The image of the selected schedule changes (a tick mark is placed on top of the globe)

###View the `TransportDemand`
- Select the transport demand again, either from the top menu or click on the corresponding bread crumb
- The schedule is now filled, waypoints may be shown on a google map in the widget below
- Click on 'Cost Pie' and 'Resource Usage' to see some graphs

###Send an `Event`
- You may now send an Event to the system. Events should in principle come from an outside system, but this is a demo...
- Send a 'Failure event' and select a leg (probably not the last leg)
- The status in the schedule changes to CANCELD and a red cross icon is shown.
- Selecting replan-transport will give you the possibility to replan the transport, starting at the canceled destination.
- Be sure to select 'REPLAN and book' (plan and book is still shown. It should have been hidden...)

###Other Features
- Have a look at all the logistic service providers, all logistic services, all destinations etc.
- See the file TpmFixture.java for how the main domain objects link.

###Caveats
> The software is not as streamlined as it should be and it contains bugs. ;-)  But, remember, it was a quickly written demo.