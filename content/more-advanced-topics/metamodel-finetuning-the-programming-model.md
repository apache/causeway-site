Title: Fine-tuning the Programming Model

## Core MetaModel

The core metamodel defines APIs and implementations for building the Isis metamodel: a description of the set of entities, domain services and values that make up the domain model.

The description of each domain class consists of a number of elements:

* [ObjectSpecification](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/spec/ObjectSpecification.java)

  Analogous to `java.lang.Class`; holds information about the class itself and holds collections of each of the three types of class' members (below);

* [OneToOneAssociation](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/spec/feature/OneToOneAssociation.java)

  Represents a class member that is a single-valued property of the class.  The property's type is either a reference to another entity, or is a value type.

* [OneToManyAssociation](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/spec/feature/OneToManyAssociation.java)

  Represents a class member that is a collection of references to other entities.  Note that Isis does not currently support collections of values.

* [ObjectAction](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/spec/feature/ObjectAction.java)

  Represents a class member that is an operation that can be performed on the action.  Returns either a single value, a collection of entities, or is `void`.

The metamodel is built up through the [ProgrammingModel](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/progmodel/ProgrammingModel.java), which defines an API for registering a set of [FacetFactory](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/facets/FacetFactory.java)s.  Two special `FacetFactory` implementations - [PropertyAccessorFacetFactory](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/progmodel/facets/properties/accessor/PropertyAccessorFacetFactory.java) and [CollectionAccessorFacetFactory](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/progmodel/facets/collections/accessor/CollectionAccessorFacetFactory.java) - are used to identify the class members.  Pretty much all the other `FacetFactory`s are responsible for installing [Facet](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/core/metamodel/facetapi/Facet.java)s onto the metamodel elements.  There are many many such `Facet`s, and are used to do such things get values from properties or collections, modify properties or collections, invoke action, hide or disable class members, provide UI hints for class members, and so on.  In short, the `FacetFactory`s registered defines the Isis programming conventions.

## Modifying the Programming Model

The default implementation of `ProgrammingModel` is [ProgrammingModelFacetsJava5](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/progmodels/dflt/ProgrammingModelFacetsJava5.java), which registers a large number of `FacetFactory`s.  

By editing `isis.properties` you can modify the programming conventions either by  (a) using the default programming model, but tweaking it to include new `FacetFactory`s or exclude existing, or (b) by specifying a completely different programming model implementation.

Let's see how this is done.

### Fine-tuning the existing programming model

Suppose that for some reason you wanted to disable support for the `@Aggregated` annotation.  This would be done using:

<pre>
isis.reflector.facets.exclude=org.apache.isis.core.progmodel.facets.object.aggregated.annotation.AggregatedAnnotationFacetFactory
</pre>

Or, suppose you wanted to use the example ["namefile"](https://github.com/apache/isis/blob/master/mothballed/misc/metamodel/namefile/src/main/java/org/apache/isis/example/metamodel/namefile/facets/NameFileFacetFactory.java) `FacetFactory` as part of your programming conventions, use:

<pre>
isis.reflector.facets.include=org.apache.isis.example.metamodel.namefile.facets.NameFileFacetFactory
</pre>

To include/exclude more than one `FacetFactory`, specify as a comma-separated list.  And if you want to dig into this in more detail, the code that implements this logic is [JavaReflectorInstallerNoDecorators](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/progmodels/dflt/JavaReflectorInstallerNoDecorators.java).

> This [thread](http://isis.markmail.org/thread/472c3mrvcgnripst) from the users mailing list (in Apr 2014) shows a typical customization.

### Specifying a new programming model

To specify a completely new programming model, you'll first need an  implementation of `ProgrammingModel`.  One option is to subclass from `ProgammingModelFacetsJava5`; in your subclass you could remove any `FacetFactory`s that you wanted to exclude, as well as registering your own implementations.

To tell Isis to use your new programming model, use (something like):

<pre>
isis.reflector.facets=com.mycompany.myapp.isis.IsisProgrammingModel
</pre>

Again, the code that implements this logic is [JavaReflectorInstallerNoDecorators](https://github.com/apache/isis/blob/master/core/metamodel/src/main/java/org/apache/isis/progmodels/dflt/JavaReflectorInstallerNoDecorators.java).