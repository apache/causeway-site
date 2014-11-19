Title: Stop scaffolding, start coding

{note
A half-day tutorial (at least!) on developing domain-driven apps using Apache Isis.
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


<hr/>

# Build a domain app

The remainder of the tutorial provides guidance on building a domain application.  We'd rather you build your own app, but if you're not feeling inspired, you could have a go at building our "petclinic" app.  Here's the design:

![](http://yuml.me/a070d071)

which in yuml.me's DSL is:
<pre>
[Visit|-checkIn:DateTime;-checkout:DateTime;-diagnosis:String|+checkin();+checkout();+addNote()]->[Pet|-name:String;-species:PetSpecies]
[Owner|-firstName:String;-lastName:String]<0..1-0..*>[Pet]
</pre>


## Domain entity

Most domain objects in Apache Isis applications are persistent entities.

* rename the `SimpleObject` class
  * eg rename to `Pet`
* if required, rename the `SimpleObject` class' `name` property
  * for `Pet`, can leave `name` property as is
* specify a [title](http://isis.apache.org/how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html)
* specify an [icon](http://isis.apache.org/how-tos/how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html)
* add the [@Bookmarkable](http://isis.apache.org/reference/recognized-annotations/Bookmarkable.html) annotation
  * confirm is available from bookmark panel (top-left of Wicket UI)
  

## Domain service

Domain services either act as factories or repositories to entities, or (more generally) can be used to "bridge across" to other domains/bounded contexts.  Most are application-scoped, but they can also be request-scoped if required.

* rename the `SimpleObjects` class
  * eg rename to `Pets`
* review `create` action (acting as a factory)
  - as per our [docs](http://isis.apache.org/how-tos/how-to-01-160-How-to-create-or-delete-objects-within-your-code.html)
  - rename if you wish
    - eg `newPet(...)` or `addPet(...)`
* review `listAll` action (acting as a repository)
  - as per our [docs](http://isis.apache.org/how-tos/how-to-09-040-How-to-write-a-custom-repository.html)
  - note the annotations on the corresponding domain class (originally called `SimpleObject`, though renamed by now, eg to `Pet`)
  - rename if you wish
    - eg `listPets()`
* note the `@DomainService` annotation
* optional: add an action to a return subset of objects
  - use `@Query` annotation
  - see for example the todo app, see [here](https://github.com/apache/isis/blob/b3e936c9aae28754fb46c2df52b1cb9b023f9ab8/example/application/todoapp/dom/src/main/java/dom/todo/ToDoItem.java#L93) and [here](https://github.com/apache/isis/blob/b3e936c9aae28754fb46c2df52b1cb9b023f9ab8/example/application/todoapp/dom/src/main/java/dom/todo/ToDoItems.java#L63)

  
## Fixture scripts

Fixture scripts are used to setup the app into a known state.  They are great for demo's and as a time-saver when implementing a feature, and they can also be reused in automated integration tests.  We usually also have a fixture script to zap all the (non-reference) data (or some logical subset of the data)

* rename the `SimpleObjectsTearDownFixture` class
  - and update to delete from the appropriate underlying database table(s)
  - use the injected [IsisJdoSupport](http://isis.apache.org/components/objectstores/jdo/services/isisjdosupport-service.html) domain service.
* update to create new instances of domain entity
  - inject in the corresponding domain service

 
## Actions

Most business functionality is implemented using actions... basically a `public` method accepting domain classes and primitives as its parameter types.  The action can return a domain entity, or a collection of entities, or a primitive/String/value, or void.  If a domain entity is returned then that object is rendered immediately; if a collection is returned then the Wicket viewer renders a table.  Such collections are sometimes called "standalone" collections.

* write an action to update the domain property (originally called `SimpleObject#name`, though renamed by now)
* use the [@Named](http://isis.apache.org/reference/recognized-annotations/Named.html) annotation to specify the name of action parameters
* use [@ActionSemantics](http://isis.apache.org/reference/recognized-annotations/ActionSemantics.html) annotation to indicate the semantics of the action (safe/query-only, idempotent or non-idempotent)
* annotate safe action as [@Bookmarkable](http://isis.apache.org/reference/recognized-annotations/Bookmarkable.html) 
  * confirm is available from bookmark panel (top-left of Wicket UI)
* optional: add an action to clone an object  
  
  
## REST API

As well as exposing the Wicket viewer, Isis also exposes a REST API (an implementation of the [Restful Objects spec](http://restfulobjects.org)).  All of the functionality of the domain object model is available through this REST API.

* add Chrome extensions
  * install [Postman](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm?hl=en)
  * install [JSON-View](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en)
* browse to Wicket viewer, install fixtures
* browse to the http://localhost:8080/restful API
* invoke the service to list all objects
  * services
  * actions
  * invoke (invoking 0-arg actions is easy; the Restful Objects spec defines how to invoke N-arg actions)

  
## Specify Action semantics

The semantics of an action (whether it is safe/query only, whether it is idempotent, whether it is neither) can be specified for each action; if not specified then Isis assumes non-idempotent.  In the Wicket viewer this matters in that only query-only actions can be bookmarked or used as contributed properties/collections.  In the RESTful viewer this matters in that it determines the HTTP verb (GET, PUT or POST) that is used to invoke the action.

* experiment changing [@ActionSemantics] on actions
  * note the HTTP methods exposed in the REST API change
  * note whether the action is bookmarkable (assuming that it has been annotated with `@Bookmarkable`, that is).
  

## Value properties

Domain entities have state: either values (primitives, strings) or references to other entities.  In this section we explore adding some value properties

* add some [value properties](http://isis.apache.org/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html); also:
  - for string properties
    - use the [@Multiline](http://isis.apache.org/reference/recognized-annotations/MultiLine.html) annotation to render a text area instead of a text box
    - use the [@MaxLength](http://isis.apache.org/reference/recognized-annotations/MaxLength.html) annotation to specify the maximum number of characters allowable
    - use [joda date/time](http://isis.apache.org/components/objectstores/jdo/mapping-joda-dates.html) properties
  - use [bigdecimals](http://isis.apache.org/components/objectstores/jdo/mapping-bigdecimals.html) properties
  - use [blob/clobs](http://isis.apache.org/components/objectstores/jdo/mapping-blobs.html) properties
  - specify whether [optional or mandatory](http://isis.apache.org/components/objectstores/jdo/mapping-mandatory-and-optional-properties.html)
  - enums (eg as used in the example Todo app, see [here](https://github.com/apache/isis/blob/b3e936c9aae28754fb46c2df52b1cb9b023f9ab8/example/application/todoapp/dom/src/main/java/dom/todo/ToDoItem.java#L207) and [here](https://github.com/apache/isis/blob/b3e936c9aae28754fb46c2df52b1cb9b023f9ab8/example/application/todoapp/dom/src/main/java/dom/todo/ToDoItem.java#L266)
* update the corresponding domain service for creating new instances
  - for all non-optional properties will either need to prompt for a value, or calculate some suitable default
* change the implementation of title, if need be
  - might prefer to use [@Title](http://isis.apache.org/reference/recognized-annotations/Title.html) annotation rather than the `title()` method
* [order the properties](http://isis.apache.org/how-tos/how-to-01-080-How-to-specify-the-order-in-which-properties-or-collections-are-displayed.html) using the [@MemberOrder](http://isis.apache.org/reference/recognized-annotations/MemberOrder.html) annotation and [@MemberGroupLayout](http://isis.apache.org/reference/recognized-annotations/MemberGroupLayout.html) annotation
  * see also this [static layouts](http://isis.apache.org/components/viewers/wicket/static-layouts.html) documentation


## Reference properties

Domain entities can also reference other domain entities.  These references may be either scalar (single-valued) or vector (multi-valued).  In this section we focus on scalar reference properties.

* add some [reference properties](http://isis.apache.org/how-tos/how-to-01-030-How-to-add-a-property-to-a-domain-entity.html)
* update the corresponding domain service
* use different techniques to obtain references (shown in drop-down list box)
  * use [@Bounded](http://isis.apache.org/reference/recognized-annotations/Bounded.html) annotation
  * use the [@AutoComplete](http://isis.apache.org/reference/recognized-annotations/AutoComplete.html) annotation
  * use a `choicesXxx()` supporting method on [property](http://isis.apache.org/how-tos/how-to-03-010-How-to-specify-a-set-of-choices-for-a-property.html) or [action param](http://isis.apache.org/how-tos/how-to-03-020-How-to-specify-a-set-of-choices-for-an-action-parameter.html)
  * use an `autoCompleteXxx()` supporting method on [property](http://isis.apache.org/how-tos/how-to-03-015-How-to-specify-an-autocomplete-for-a-property.html) or [action param](http://isis.apache.org/how-tos/how-to-03-025-How-to-specify-an-autocomplete-for-an-action-parameter.html)

  
## Usability: Defaults

Quick detour: often we want to set up defaults to go with choices.  A sensible default can really improve the usability of the app.

* Add [defaults](http://isis.apache.org/how-tos/how-to-03-050-How-to-specify-default-values-for-an-action-parameter.html) for action parameters
 

## Collections  

Returning back to references, Isis also supports vector (multi-valued) references to another object instances... in other words collections.  We sometimes called these "parented" collections (to distinguish from a "standalone" collection as returned from an action)

* Ensure that all domain classes implement `java.lang.Comparable`
  * use the [ObjectContracts](http://isis.apache.org/reference/Utility.html) utility class to help implement `Comparable` (also `equals()`, `hashCode()`, `toString()`)
* Add a [one-to-many-collection](http://isis.apache.org/components/objectstores/jdo/managed-1-to-m-relationships.html) to one of the entities
  * Use `SortedSet` as the class
* Use the @Render (http://isis.apache.org/reference/recognized-annotations/Render.html) annotation to indicate if the collection should be visible or hidden by default
* optional: Use the [@SortedBy](http://isis.apache.org/reference/recognized-annotations/SortedBy.html) annotation to specify a different comparator than the natural ordering


## Actions and Collections

The Wicket UI doesn't allow collections to be modified (added to/removed from).  However, we can easily write actions to accomplish the same.  Moreover, these actions can provide some additional business logic.  For example: it probably shouldn't be possible to add an object twice into a collection, so it should not be presented in the list of choices/autoComplete; conversely, only those objects in the collection should be offered as choices to be removed.

* Add domain actions to add/remove from the collection
  * to create objects, [inject](http://isis.apache.org/how-tos/how-to-01-150-How-to-inject-services-into-a-domain-entity-or-other-service.html) associated domain service
    * generally we recommend using the `@Inject` annotation with either private or default visibility
  * the service itself should use [DomainObjectContainer](http://isis.apache.org/reference/DomainObjectContainer.html)
* Use the [@MemberOrder](http://isis.apache.org/reference/recognized-annotations/MemberOrder.html) annotation to associate an action with a property or with a collection
  * set the `name` attribute


## Clock Service

To ensure testability, there should be no dependencies on system time, for example usage of `LocalDate.now()`.  Instead the domain objects should delegate to the provided `ClockService`.

* remove any dependencies on system time (eg defaults for date/time action parameters)
  * inject [ClockService](http://isis.apache.org/reference/services/ClockService.html)
  * call `ClockService.now()` etc where required.
  

## Dynamic Layout

Up to this point we've been using annotations (`@MemberOrder`, `@MemberGroupLayout`, `@Named` and so on) for UI hints.  However, the feedback loop is not good: it requires us stopping the app, editing the code, recompiling and running again.  So instead, all these UI hints (and more) can be specified dynamically, using a corresponding `.layout.json` file.  If edited while the app is running, it will be reloaded automatically (in IntelliJ, use Run>Reload Changed Classes):

* Delete the `@MemberOrder` and `@MemberGroupLayout` annotations and instead specify layout hints using a [.layout.json](http://isis.apache.org/components/viewers/wicket/dynamic-layouts.html) file.


## Business rules

Apache Isis excels for domains where there are complex business rules to enforce.  The UI tries not to constrain the user from navigating around freely, however the domain objects nevertheless ensure that they cannot change into an invalid state.  Such rules can be enforced either declaratively (using annotations) or imperatively (using code).  The objects can do this in one of three ways:

- visibility: preventing the user from even seeing a property/collection/action
- usability: allowing the user to view a property/collection/action but not allowing the user to change it
- validity: allowing the user to modify the property/invoke the action, but validating that the new value/action arguments are correct before hand.

Or, more pithily: "see it, use it, do it"

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
* Use the `validateXxx()` supporting method on [properties](http://isis.staging.apache.org/how-tos/how-to-02-100-How-to-validate-user-input-for-a-property.html) or [action parameter](http://isis.staging.apache.org/how-tos/how-to-02-120-How-to-validate-an-action-parameter-argument.html)
* optional: for any data type:
  - use the [@MustSatisfy](http://isis.apache.org/reference/recognized-annotations/MustSatisfy.html) annotation to specify an arbitrary constraint
  

## Dashboard (home page)

* Add the [@HomePage](http://isis.apache.org/reference/recognized-annotations/HomePage.html) annotation to one (no more) of the domain services' no-arg actions


## Decoupling using Contributions

### Contributed Actions

* Write a new domain service
  - by convention, called "XxxContributions"
  - annotate with `@DomainService`
* Write an action accepting >1 args:
  - one being a domain entity
  - other being a primitive or String
* For this action, add the [@NotInServiceMenu](http://isis.apache.org/reference/recognized-annotations/NotInServiceMenu.html) annotation
  * indicates service's actions should *not* be included in the main application menu bar
* should be rendered "as if" an action of the entity

  
### Contributed Collections

* Write a new domain service (or update the one previously)
* Write a query-only action accepting exactly 1 arg (a domain entity)
  - returning a collection, list or set
* For this action:
  * add the [@NotInServiceMenu](http://isis.apache.org/reference/recognized-annotations/NotInServiceMenu.html) annotation
  * add the [@NotContributed(As.ACTION)](http://isis.apache.org/reference/recognized-annotations/NotContributed.html) annotation
* should be rendered in the UI "as if" a collection of the entity
* use `.layout.json` to position as required


### Contributed Properties

* As for contributed collections, write a new domain service with a query-only action accepting exactly 1 arg (a domain entity); except:
  - returning a scalar value rather than a collection
* For this action, annotate as [@NotInServiceMenu](http://isis.apache.org/reference/recognized-annotations/NotInServiceMenu.html) and [@NotContributed(As.ACTION)](http://isis.apache.org/reference/recognized-annotations/NotContributed.html)
* should be rendered in the UI "as if" a property of the entity
* use `.layout.json` to position as required


## Decoupling using the Event Bus



TODO



* Bulk actions

TODO


## Performance tuning

TODO

* QueryResultsCache
* Scratchpad Services



## Extending the Wicket UI


### Excel download

TODO

### Fullcalendar2

TODO

### gmap3

TODO


## Add-ons

### Security

TODO

### Command

TODO


### Auditing

TODO

### Publishing

TODO



## CSS

TODO


## View models

TODO



## Integration tests

TODO


## Composite fixture scripts (a la Estatio)

TODO


## Customising the REST API

TODO
