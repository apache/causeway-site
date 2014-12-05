Title: Static Layouts

Because Isis implements the [naked objects pattern](http://en.wikipedia.org/wiki/Naked_objects), the domain objects are rendered in the UI based only metadata gleaned from the domain classes themselves.  Traditionally this metadata has been specified using annotations.

> It's also possible to specify much UI metadata using a `.layout.json` file; see [dynamic layouts](./dynamic-layouts.html) for more details.  One benefit is that layout can be refreshed without recompiling/redeploying the app.  There's further discussion on this topic <a href="#pros-and-cons">below</a>.

## The @MemberOrder Annotation

To specify the relative order of domain class properties and classes, the `@MemberOrder` annotation is used.

For example:

    public class ToDoItem {

        @MemberOrder(sequence="1")
        public String getDescription() { ... }

        @MemberOrder(sequence="2")
        public String getCategory() { ... }

        @MemberOrder(sequence="3")
        public boolean isComplete() { ... }

        @MemberOrder(name="Detail", sequence="1")
        public LocalDate getDueBy() { ... }

        @MemberOrder(name="Detail", sequence="2")
        public BigDecimal getCost() { ... }

        @MemberOrder(name="Detail", sequence="4")
        public String getNotes() { ... }

        @MemberOrder(name="Misc", sequence="99")
        public Long getVersionSequence() { ... }

        ...
    } 

This defines three property (or member) groups, "General", "Detail" and "Misc"; "General" is the default if no `name` attribute is specified.  Properties in the same member group are rendered together, as a fieldset.  

In addition, actions can optionally be associated (rendered close to) either properties or actions.  This is done by overloading the `@MemberOrder`'s `name` attribute, holding the value of the property or collection.

For example:

    public class ToDoItem {

        @MemberOrder(sequence="3")
        public boolean isComplete() { ... }

        @MemberOrder(sequence="1")
        public SortedSet<ToDoItem> getDependencies() { ... }


        // actions ...
        @MemberOrder(name="complete", sequence="1")
        public ToDoItem completed() { ...}

        @MemberOrder(name="complete", sequence="2")
        public ToDoItem notYetCompleted() { ...}


        // more actions ...
        @MemberOrder(name="dependencies", sequence="1")
        public ToDoItem add(ToDoItem t) { ...}

        @MemberOrder(name="dependencies", sequence="2")
        public ToDoItem remove(ToDoItem t) { ...}

    }

will associate the `completed()` and `notYetCompleted()` actions with the `complete` property, and will associate the `add()` and `remove()` actions with the `dependencies` collection.

If the `name` attribute is omitted, then the action is rendered near the header.  Note also that the `@MemberOrder`'s `name` attribute has no meaning for collections.


## The @MemberGroupLayout Annotation

The `@MemberGroupLayout` annotation specifies the relative positioning of  property groups as being either in a left column, a middle column or in a right column.  It also specifies the relative width.

For example:

    @MemberGroupLayout(
         columnSpans={3,3,0,6}, left={"General", "Misc"}, middle="Detail")
    public class ToDoItem {
        ...
    }

Four values are given in the `columnSpans` attribute.  The first three are the relative widths of the three columns of property groups.  The fourth, meanwhile, indicates the width of a final column that holds all the collections of the object.

The values of these spans are taken as proportions of 12 virtual columns across the page (this taken from the [Bootstrap](http://twitter.github.io/bootstrap/) library).

For example:

* `{3,3,0,6}` indicates:
    * a left column of properties taking up 25% of the width
    * a middle column of properties taking up 25% of the width
    * a right column of collections taking up 50% of the width
* `{2,6,0,4}` indicates:
    * a left column of properties taking up ~16% of the width
    * a middle column of properties taking up 50% of the width
    * a right column of collections taking up ~33% of the width
* `{2,3,3,4}` indicates:
    * a left column of properties taking up ~16% of the width
    * a middle column of properties taking up 25% of the width
    * a right column of properties taking up 25% of the width
    * a far right column of collections taking up ~33% of the width

If the sum of all the columns exceeds 12, then the collections are placed underneath the properties, taking up the full span.  For example:

* {4,4,4,12} indicates:
    * a left column of properties taking up ~33% of the width
    * a middle column of properties taking up ~33% of the width
    * a right column of properties taking up ~33% of the width
    * the collections underneath the property columns, taking up the full width

## <a name="example-layouts">Example Layouts</a>

Below are sketches for the layout of the [ToDoItem](https://github.com/apache/isis/blob/f38fdb92941172eabb12e0943509f239e6d5925f/example/application/quickstart_wicket_restful_jdo/dom/src/main/java/dom/todo/ToDoItem.java) class of the [quickstart archetype](../../../intro/getting-started/quickstart-archetype.html).

#### &nbsp;
    
<img src="images/layouts/6-6-0-12.png"  width="720px"/>

#### &nbsp;
    
<img src="images/layouts/4-4-4-12.png"  width="720px"/>

#### &nbsp;
    
<img src="images/layouts/4-0-8-0.png"  width="720px"/>

## Other Annotations

The [@Named](../../../reference/recognized-annotations/Named-deprecated.html), [@DescribedAs](../../../reference/recognized-annotations/DescribedAs-deprecated.html), [@MultiLine](../../../reference/recognized-annotations/MultiLine-deprecated.html), [@TypicalLength](../../../reference/recognized-annotations/TypicalLength-deprecated.html), [@Render](../../../reference/recognized-annotations/Render-deprecated.html) and [@CssClass](../../../reference/recognized-annotations/CssClass-deprecated.html) annotations are also all hints that can affect the UI.

## <a name="pros-and-cons">Static vs Dynamic Layouts</a>

As mentioned earlier, it is also possible to [specify the layout semantics dynamically](./dynamic-layouts.html) using a `.layout.json` file.  Using JSON has the benefit that the layout can be updated without requiring a recompile of the code and redeploy of the app.  Many developers also find it easier to rationalize about layout when all the hints are collated together in a single place (rather than scattered across the class members as annotations).

Another benefit of dynamic layout is that UI hints can be provided for [contributed associations and actions](../../../more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html) that are synthesised at runtime.

The main downsides of using dynamic layouts are a lack of typesafety (a typo will result in the metadata not being picked up for the element) and syntactic fragility (an invalid JSON document will result in no metadata for the entire class.  Also, dynamic layouts have no notion of inheritance, whereas the dewey-decimal format `@MemberOrder` annotation allows the metadata of the subclass its superclasses to fit together relatively seamlessly.

#### Best of both worlds?

Using the (third-party) [JRebel plugin](../../../other/jrebel.html) comes close to getting the best of both words: metadata is specified in a type-safe way using annotations, but can be reloaded automatically.  The downsides are licensing cost, and also the fact that metadata for contributed actions in the contributee class cannot be specified.

