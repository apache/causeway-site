Title: String interpolator domain service (for mail-merge/reporting) [1.4.0-snapshot]

The [String interpolator domain service](https://github.com/danhaywood/isis-domainservice-stringinterpolator)  will interpolate string templates with either Isis system properties or values obtained from a domain object (possibly walking relationships).  It uses [OGNL](http://commons.apache.org/proper/commons-ognl/) to evaluate the expressions withn the string template.

One use case for this service is in building URLs based on an object's state, parameterized by environment (prod/test/dev etc).  These URLs could be anything; in the original use case they were to a reporting service:

    ${property['reportServerBase']}/ReportServer/Pages/ReportViewer.aspx?/Estatio/Invoices&dueDate=${dueDate}&propertyId=${this.property.id}

where the context for the evaluation of the URL (`this`) is a domain object that has a `property` field, which in turn has an `id` field:

When initialized by Isis, the Isis system properties are exposed as the `properties` map, while the target object is exposed as the `this` object.

   
## Download

The service is hosted on [github](https://github.com/danhaywood/isis-domainservice-stringinterpolator).  
