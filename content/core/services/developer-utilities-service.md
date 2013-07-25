Title: Developer Utilities Service

The `DeveloperUtilitiesService` service is intended to make the developer's job easier in a number of aspects:

* using the `downloadMetaModel()` action, the developer can download a CSV spreadsheet of the Isis metamodel.
 
    This allows the developer to review the metadata that has Isis has captured about each domain type: for example whether a business rule (hide/disable/validate) has been implemented for each member (also indicating the implementation) 

* using the `downloadLayouts()` action, the developer can download a ZIP file of `Xxx.layout.json` files for each domain type in the Isis metamodel.  
 
    This is useful if converting a domain model to use [dynamic layouts](../dynamic-layouts.html).

*  using the `downloadLayout()` contributed action, the developer can download the `Xxx.layout.json` for an individual object

*  using the `refreshLayout()` contributed action, the developer can reload the current object.  The metamodel will be rebuilt and the object's layout may change accordingly.
 
    > (If using the [Wicket viewer](../../components/viewers/wicket/about.html)) it is necessary to invoke `refreshLayout()` *twice*.  This is to do with the relationship between the point at which the metamodel being invalidated, and the point the Wicket viewer builds up its UI.
  
All of the above actions are annotated as `@Prototype`; they will therefore not appear in a running production application.

### Register the Service

The service is registered, like any other, in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.core.metamodel.services.devutils.DeveloperUtilitiesServiceDefault,\
              ...
</pre>


