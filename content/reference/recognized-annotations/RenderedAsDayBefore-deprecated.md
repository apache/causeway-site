Title: @RenderedAsDayBefore

> Deprecated, use instead [@PropertyLayout#renderedAsDayBefore()](./PropertyLayout.html) and [@ParameterLayout#renderedAsDayBefore()](./ParameterLayout.html) or [dynamic layouts](../../components/viewers/wicket/dynamic-layouts.html).

A rendering hint, instructing the viewer that the date should as one day prior to the actually stored date. 

This is intended to be used so that an exclusive end date of an interval can be rendered as 1 day before the actual value stored. 

For example: 

    public LocalDate getStartDate() { ... }
 
    @RenderedAsDayBefore
    public LocalDate getEndDate() { ... }
 
Here, the interval of the [1-may-2013,1-jun-2013) would be rendered as the dates 1-may-2013 for the start date but using 31-may-2013 (the day before) for the end date. 

What is stored in the domain object, itself, however, the value stored is 1-jun-2013.
