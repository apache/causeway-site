Title: Stop scaffolding, start coding

{note
A half-day tutorial on developing domain-driven apps using Apache Isis.
}

## Run the archetype

    mvn archetype:generate  \
        -D archetypeGroupId=org.apache.isis.archetype \
        -D archetypeArtifactId=simpleapp-archetype \
        -D archetypeVersion=1.8.0-SNAPSHOT \
        -D groupId=com.mycompany \
        -D artifactId=myapp \
        -D version=1.0-SNAPSHOT \
        -D archetypeRepository=http://repository-estatio.forge.cloudbees.com/snapshot/ \
        -B
    
## Build and run

    cd myapp
    mvn clean install

then

    mvn antrun:run -P self-host

or alternatively

    mvn jetty:run    
    

## Using the app

* install fixtures
* list all
* create new
* list all    

        
##Dev environment

Set up an IDE and import the project to be able to run and debug the app

#### Configure

* IDE:
  * configure [IntelliJ](http://isis.apache.org/intro/getting-started/ide/intellij.html), import app
  * configure [Eclipse](http://isis.apache.org/intro/getting-started/ide/eclipse.html), import app
* Set up IDE [editor templates](http://isis.apache.org/intro/resources/editor-templates.html)


#### Run

* Run the app from within the IDE
* Run with different deploymentTypes, note whether `@Prototype` actions are available or not:
  - `--type SERVER_PROTOTYPE`
  - `--type SERVER`

  
## Explore codebase

* `myapp` : parent module
* `myapp-dom`: domain objects module
   - entity: `dom.simple.SimpleObject`
   - repository: `dom.simple.SimpleObjects`
* `myapp-fixture`: fixtures module
   - fixture script:`fixture.simple.SimpleObjectsFixture`
* `myapp-integtests`: integration tests module
* `myapp-webapp`: webapp module
  * (builds the WAR file)


## Testing

* `myapp-dom` unit tests
   - run 
   - inspect, eg
        - `SimpleObjectTest`
* `myapp-integtests` integration tests
   - run
   - inspect, eg: 
       - `integration.tests.smoke.SimpleObjectsTest`
       - `integration.specs.simple.SimpleObjectSpec_listAllAndCreate.feature`
   -  generated report, eg
        - `myapp/integtests/target/cucumber-html-report/index.html`
    - change test in IDE, re-run (in Maven)   

    
## Prototyping

Exclude the `integtests` module.

In the parent `pom.xml`:

    <modules>
        <module>dom</module>
        <module>fixture</module>
        <module>integtests</module>
        <module>webapp</module>
    </modules>

change to:

    <modules>
        <module>dom</module>
        <module>fixture</module>
        <!--
        <module>integtests</module>
        -->
        <module>webapp</module>
    </modules>


# Build a domain app

The remainder of the tutorial provides guidance on building a domain application.  We'd rather you build your own app, but if you're not feeling inspired, you could have a go at building our petclinic app.  Here's the design:

![](http://yuml.me/a070d071)

which in yuml.me's DSL is:
<pre>
[Visit|-checkIn:DateTime;-checkout:DateTime;-diagnosis:String|+checkin();+checkout();+addNote()]->[Pet|-name:String;-species:PetSpecies]
[Owner|-firstName:String;-lastName:String]<0..1-0..*>[Pet]
</pre>


## Domain class

* rename the `SimpleObject` class
* rename the `SimpleObject` class' `name` property
* specify a [title](http://isis.apache.org/how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)
* specify an [icon](http://isis.apache.org/how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)


## Domain service

* rename the `SimpleObjects` class
* review `create` action (acting as a factory)
  - as per our [docs](http://isis.apache.org/how-tos/how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)
* review `listAll` action (acting as a repository)
  - as per our [docs](http://isis.apache.org/how-tos/how-to-09-040-How-to-write-a-custom-repository.html)
  - note the annotations on the corresponding domain class (`SimpleObject` above, probably renamed by now)

  
## Fixture scripts

* rename the `SimpleObjectsTearDownFixture` class
  - and update
* create for domain classes
  - inject in the corresponding domain service

 
## Actions

* update the domain action (`SimpleObject#name` above, renamed by now)
* use the [@Named](http://isis.apache.org/reference/recognized-annotations/Named.html) annotation to specify the name of action parameters
* use [@ActionSemantics](http://isis.apache.org/reference/recognized-annotations/ActionSemantics.html) annotation to indicate the semantics of the action (safe/query-only, idempotent or non-idempotent)
* annotate safe action as [@Bookmarkable](http://isis.apache.org/reference/recognized-annotations/Bookmarkable.html) 
  * confirm is available from bookmark panel (top-left of Wicket UI)
  
  
## REST API

* add Chrome extensions
  * install [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en)
  * install [JSON-View](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en)
* browse to Wicket viewer, install fixtures
* browse to the http://localhost:8080/restful API
* invoke the service to list all objects


## Specify Action semantics

* experiment changing [@ActionSemantics] on actions
  * note the HTTP methods exposed in the REST API change


## Value properties

* add some [value properties](http://isis.apache.org/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html); also:
  - for string properties
    - use the [@Multiline](http://isis.apache.org/reference/recognized-annotations/MultiLine.html) annotation to render a text area instead of a text box
    - use the [@MaxLength](http://isis.apache.org/reference/recognized-annotations/MaxLength.html) annotation to specify the maximum number of characters allowable
    - use [joda date/time](http://isis.apache.org/components/objectstores/jdo/mapping-joda-dates.html) properties
  - use [bigdecimals](http://isis.apache.org/components/objectstores/jdo/mapping-bigdecimals.html) properties
  - use [blob/clobs](http://isis.apache.org/components/objectstores/jdo/mapping-blobs.html) properties
  - specify whether [optional or mandatory](http://isis.apache.org/components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
* TODO: enums
* update the corresponding domain service for creating new instances
  - for all non-optional properties will either need to prompt for a value, or calculate some suitable default
* change the implementation of title, if need be
  - might prefer to use [@Title](http://isis.apache.org/reference/recognized-annotations/Title.html) annotation rather than the `title()` method
* [order the properties](http://isis.apache.org/how-tos/how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html) using the [@MemberOrder](http://isis.apache.org/reference/recognized-annotations/MemberOrder.html) annotation and [@MemberGroupLayout](http://isis.apache.org/reference/recognized-annotations/MemberGroupLayout.html) annotation
  * see also this [static layouts](http://isis.apache.org/components/viewers/wicket/static-layouts.html) documentation


## Reference properties

* add some [reference properties](http://isis.apache.org/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)
* update the corresponding domain service
* use different techniques to obtain references (shown in drop-down list box)
  * use [@Bounded](http://isis.apache.org/reference/recognized-annotations/Bounded.html) annotation
  * use the [@AutoComplete](http://isis.apache.org/reference/recognized-annotations/AutoComplete.html) annotation
  * use a `choicesXxx()` supporting method on [property](http://isis.apache.org/how-tos/how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html) or [action param](http://isis.apache.org/how-tos/how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)
  * use an `autoCompleteXxx()` supporting method on [property](http://isis.apache.org/how-tos/how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html) or [action param](http://isis.apache.org/how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html)

  
## Usability: Defaults

* Add [defaults](http://isis.apache.org/how-tos/how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html) for action parameters
 

## Collections  

* Ensure that all domain classes implement `java.lang.Comparable`
  * use the [ObjectContracts](http://isis.apache.org/reference/Utility.html) utility class to help implement `Comparable` (also `equals()`, `hashCode()`, `toString()`)
* Add a [one-to-many-collection](http://isis.apache.org/components/objectstores/jdo/managed-1-to-m-relationships.html) to one of the entities
  * Use `SortedSet` as the class
* Use the @Render (http://isis.apache.org/reference/recognized-annotations/Render.html) annotation to indicate if the collection should be visible or hidden by default
* optional: Use the [@SortedBy](http://isis.apache.org/reference/recognized-annotations/SortedBy.html) annotation to specify a different comparator than the natural ordering


## Actions (ctd)

* Add domain actions to add/remove from the collection


## Layout

* Use the [@MemberOrder](http://isis.apache.org/reference/recognized-annotations/MemberOrder.html) annotation to associate an action with a property or with a collection
  * set the `name` attribute
* Delete the `@MemberOrder` annotations and use the associated [.layout.json](http://isis.apache.org/components/viewers/wicket/dynamic-layouts.html) file to specify layout hints instead


## Business rules

### See it!

* Use the [@Hidden](http://isis.apache.org/reference/recognized-annotations/Hidden.html) annotation to make properties/collections/actions invisible
  * the [@Programmatic](http://isis.apache.org/reference/recognized-annotations/Programmatic.html) annotation can also be used and in many cases is to be preferred; the difference is that the latter means the member is not part of the Isis metamodel.
* Use the `hideXxx()` supporting method on [properties](http://isis.apache.org/how-tos/how-to-02-010-How-to-hide-a-property.html), [collections](http://isis.apache.org/how-tos/how-to-02-020-How-to-hide-a-collection.html) and [actions](http://isis.apache.org/how-tos/how-to-02-030-How-to-hide-an-action.html) to make a property/collection/action invisible according to some imperative rule

  
### Use it!

* Use the [@Disabled](http://isis.apache.org/reference/recognized-annotations/Disabled.html) annotation to make properties read-only/actions non-invokable ('greyed out')
* Use the `disabledXxx()` supporting method on [properties](http://isis.apache.org/how-tos/how-to-02-050-How-to-prevent-a-property-from-being-modified.html) and [actions](http://isis.apache.org/how-tos/how-to-02-070-How-to-prevent-an-action-from-being-invoked.html) to make a property/action disabled according to some imperative rule


### Do it!

* Validate string properties or action paramters:
  - use the [@Regex](http://isis.apache.org/reference/recognized-annotations/RegEx.html) annotation to specify a pattern
  - use the [@MinLength](http://isis.apache.org/reference/recognized-annotations/MinLength.html) annotation to indicate a minimum number of characters
* For any data type:
  - use the [@MustSatisfy](http://isis.apache.org/reference/recognized-annotations/MustSatisfy.html) annotation to specify an arbitrary constraint

Use the `validateXxx()` supporting method on [properties](


- disable
- hide
- vaidate


Bookmarkable  
  
  
dashboards (home page)






contributed properties/collections


contributed actions


creating objects:
- domainobjectcontainer


clockservice


.layout.json

CSS

@HomePage


view models



Customising the REST API




wicket extensions
- excel download
- fullcalendar
- gmap3


add-ons
- security
- command
- auditing
- publishing


event bus


RESTful API





composite fixture scripts (a la Estatio)





integration tests

