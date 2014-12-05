Title: Developer Utilities Service

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-devutils-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-devutils) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-devutils) implementation is released.**
}

The `DeveloperUtilitiesService` service provides a number of development-time utilities, mostly related to accessing/interacting with the Isis metamodel.  These are visible in the UI, either as menu actions or as contributed actions.  All actions are annotated with [@Prototype](../recognized-annotations/Prototype-deprecated.html), so are suppressed in [production mode](../deployment-type.html).


###API

The API defined by `DeveloperUtilitiesService` (some annotations omitted) is:

    public interface DeveloperUtilitiesService {

        public Clob downloadMetaModel();

        public Blob downloadLayouts();

        public void refreshServices();

        @NotInServiceMenu
        public Clob downloadLayout(Object domainObject);

        @Deprecated // as of 1.4.0
        @Hidden     // as of 1.4.0
        @NotInServiceMenu
        public Object refreshLayout(Object domainObject);
    }

where:

* `downloadMetaModel()` allows the developer to download a CSV spreadsheet of the Isis metamodel.  
 
    The developer can then review the metadata that has Isis has captured about each domain type: for example whether a business rule (hide/disable/validate) has been implemented for each member (also indicating the implementation) 

* `downloadLayouts()` allows the developer can download a ZIP file of `Xxx.layout.json` files for each domain type in the Isis metamodel.  
 
    This is useful if converting a domain model to use [dynamic layouts](../../components/viewers/wicket/dynamic-layouts.html).

*  `downloadLayout()` (contributed action) allows the developer can download the `Xxx.layout.json` for an individual object

*  `refreshServices()` allows the developer to rebuild the Isis metamodel of all domain services.  This is particularly useful for picking up changes to [contributed actions](../../more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html)

The `refreshLayout()` (which rebuild the Isis metamodel of the current object so that the UI refreshes) has been deprecated and hidden; the [Wicket viewer](../../components/viewers/wicket/about.html)) (when running in prototype mode) now automatically does this does this.


###Implementations

The core framework provides a default implementation of this API:

* `org.apache.isis.core.metamodel.services.devutils.DeveloperUtilitiesServiceDefault`
   
### Register the Service

The service is registered, like any other, in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.core.metamodel.services.devutils.DeveloperUtilitiesServiceDefault,\
                  ...


