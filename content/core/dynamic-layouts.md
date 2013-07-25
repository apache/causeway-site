Title: Dynamic Layouts

Because Isis implements the [naked objects pattern](http://en.wikipedia.org/wiki/Naked_objects), the domain objects are rendered in the UI based only metadata gleaned from the domain classes themselves.

## Specifying layout using Annotations

### `@MemberOrder`

To specify the relative order of domain class properties and classes, the `@MemberOrder` annotation is used.  For example:

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

defines three property (or member) groups, "General", "Detail" and "Misc"; "General" is the default if no `name` attribute is specified.  Properties in the same member group are rendered together, as a fieldset.  

In addition, actions can optionally be associated (rendered close to) either properties or actions.  This is done by overloading the `@MemberOrder`'s `name` attribute, holding the value of the property or collection.

For example:

    public class ToDoItem {

        @MemberOrder(sequence="3")
        public boolean isComplete() { ... }

        @MemberOrder(sequence="1")
        public SortedSet<ToDoItem> getDependencies() { ... }


        @MemberOrder(name="complete", sequence="1")
        public ToDoItem completed() { ...}

        @MemberOrder(name="complete", sequence="2")
        public ToDoItem notYetCompleted() { ...}


        @MemberOrder(name="dependencies", sequence="1")
        public ToDoItem add(ToDoItem t) { ...}

        @MemberOrder(name="dependencies", sequence="2")
        public ToDoItem remove(ToDoItem t) { ...}

    }

will associate the `completed()` and `notYetCompleted()` actions with the `complete` property, and will associate the `add()` and `remove()` actions with the `dependencies` collection.

If the `name` attribute is omitted, then the action is rendered near the header.

Finally, note that the `@MemberOrder`'s `name` attribute has no meaning for collections.


### `@MemberGroupLayout`

The `@MemberGroupLayout` annotation specifies the relative positioning of  property groups as being either in a left column, a middle column or in a right column.  It also specifies the relative width: 

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
 


## Dynamic Layouts

While the use of annotations to specify layout metadata is typesafe, it does have the disadvantage that changing the layout means recompiling the code and redeploying.

So, instead, the layout metadata can be specified using a JSON layout file.  The [`DeveloperUtilitiesService`](services/developer-utilities-service.html) can then be used to refresh the layout (rebuilding the metamodel for the domain class in question).

The JSON layout file takes the name `Xxx.layout.json`, where `Xxx` is the class name, and resides in the same package as the class.  For example, the layout for the [`ToDoItem`](https://github.com/apache/isis/blob/f38fdb92941172eabb12e0943509f239e6d5925f/example/application/quickstart_wicket_restful_jdo/dom/src/main/java/dom/todo/ToDoItem.java) class is [`ToDoItem.layout.json`](https://github.com/apache/isis/blob/f38fdb92941172eabb12e0943509f239e6d5925f/example/application/quickstart_wicket_restful_jdo/dom/src/main/java/dom/todo/ToDoItem.layout.json)  

The format of the `.layout.json` file is:

    {
        columns: [                                  // list of columns
            {
                span: 6,                                // span of the left-hand property column
                memberGroups: {                         // ordered map of member (property) groups
                    General: {                          // member group name
                        members: {           
                            description: {},            // property, no associated actions
                            category: {},               
                            complete: {                 // property, with associated actions
                                actions: {              
                                    completed: {},      // associated actions 
                                    notYetCompleted: {}
                                }
                            }
                        }
                    },
                    Misc: {
                        members: {
                            versionSequence: {}
                        }
                    }
                }
            },
            {
                span: 6,                                // span of the middle property column
                memberGroups: { ... }
            },
            {
                span: 0                                 // span of the right property column (if any)
            },
            {
                span: 6,
                collections: {                          // ordered map of collections
                    dependencies: {                     // collection, with associated actions
                        actions: {                      
                            add:{},
                            delete: {}
                        }
                    },
                    similarItems: {}                    // collection, no associated actions
                }
            }
        ],
        actions: {                                      // actions not associated with any member
            delete: {},
            duplicate: {}
        }
    }
 

Although advisable, it is not necessary to list all class members in this file.  Any members not listed with be ordered according either to annotations (if present) or fallback/default values.