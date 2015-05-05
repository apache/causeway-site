Title: Mapping Optional Properties

[//]: # (content copied to _user-guide_how-tos_class-structure_properties)

### Isis vs JDO Annotations

In the standard Isis programming model, optional properties are specified with the `@Optional` annotation.  However, this annotation is not recognized by the JDO Objectstore, optionality is specified using the `javax.jdo.annotations.Column(allowNulls="true")` annotation.

Since these are different annotations, incompatibilities can arise.  A property might be annotated as optional to Isis, but mandatory to JDO; or vice versa.

The two frameworks also have different defaults if their respective annotations are missing; this might also lead to incompatibilities.  For Isis, if the `@Optional` annotation is missing then the property is assumed to be mandatory.  For JDO, if the `@Column` annotation is missing then the property is assumed to mandatory if a primitive type, but optional if a reference type (eg `String`, `BigDecimal` etc).

Isis will flag any incompatibilities between the two frameworks, and refuse to boot (fail fast).  To make such conflicts easier to avoid, though, Isis also understands the `@Column` annotation instead of the `@Optional` annotation.

For example, rather than:

    @javax.jdo.annotations.Column(allowNulls="true")
    private LocalDate date;

    @Optional
    public LocalDate getDate() { }
    public void setDate(LocalDate d) { } 

you can write:

    private LocalDate date;

    @javax.jdo.annotations.Column(allowNulls="true")
    public LocalDate getDate() { }
    public void setDate(LocalDate d) { } 

Do note though that the `@Column` annotation must be applied to the getter method, not to the field.  

### Handling Mandatory Properties in Subtypes

If you have a hierarchy of classes then you need to decide which inheritance strategy to use.  

* "table per hierarchy", or "rollup" (`InheritanceStrategy.SUPERCLASS_TABLE`)
   * whereby a single table corresponds to the superclass, and also holds the properties of the subtype (or subtypes) being rolled up
* "table per class" (`InheritanceStrategy.NEW_TABLE`)
   * whereby is a table for both superclass and subclass, in 1:1 correspondence
* "rolldown" (`InheritanceStrategy.SUBCLASS_TABLE`)
   * whereby a single table holds the properties of the subtype, and also holds the properties of its supertype 

In the first "rollup" case, we can have a situation where - logically speaking - the property is mandatory in the subtype - but it must be mapped as nullable in the database because it is n/a for any other subtypes that are rolled up.

In this situation we must tell JDO that the column is optional, but to Isis we want to enforce it being mandatory.  This can be done using the `@Mandatory` annotation.

For example:


    @javax.jdo.annotations.Inheritance(strategy = InheritanceStrategy.SUPER_TABLE)   
    public class SomeSubtype extends SomeSuperType {

        private LocalDate date;

        @javax.jdo.annotations.Column(allowNulls="true")
        @Mandatory
        public LocalDate getDate() { }
        public void setDate(LocalDate d) { }

    } 

  
An alternative way to achieve this is to leave the JDO annotation on the field (where it is invisible to Isis), and rely on Isis' default, eg:

    @javax.jdo.annotations.Inheritance(strategy = InheritanceStrategy.SUPER_TABLE)   
    public class SomeSubtype extends SomeSuperType {

        @javax.jdo.annotations.Column(allowNulls="true")
        private LocalDate date;

        // mandatory in Isis by default
        public LocalDate getDate() { }
        public void setDate(LocalDate d) { }

    } 

We recommend the former mapping, though, using `@Mandatory`.