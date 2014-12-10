Title: @ParameterLayout (1.8.0-SNAPSHOT)

The `@ParameterLayout` annotation applies to action parameters, collecting together all UI hints within a single
annotation.

* `cssClass` - the css class that a parameter should have, to allow more targetted styling in `application.css`
* `describedAs` - description of this parameter, eg to be rendered in a tooltip.
* `labelPosition` - in forms, the positioning of the label (left, top or none) relative to the parameter value.  Defaults to LEFT unless `multiLine` also specified (see below)
* `named` -the name of this parameter.  For Java 7 this is generally required.  For Java 8, the name can be inferred from the code so this attribute allows the name to be overridden.
* `multiLine` - for string parameters, render as a text area over multiple lines.  If set >1, then `labelPosition` defaults to TOP unless otherwise specified.
* `renderedAsDayBefore` - for date parameters only, render the date as one day prior to the actually stored date (eg the end date of an open interval into a closed interval)
* `typicalLength` -the typical entry length of a field, use to determine the optimum width for display

For example:

    public class ToDoItem {

        public ToDoItem updateDescription(
                                @ParameterLayout(
                                    cssClass="x-key",
                                    describedAs="What needs to be done",
                                    labelPosition=LabelPosition.LEFT,
                                    named="Description",
                                    typicalLength=80)
                                final String description) {
            setDescription(description);
            return this;
        }

        public ToDoItem updateNotes(
                            @ParameterLayout(
                                describedAs="Additional notes",
                                labelPosition=LabelPosition.TOP,
                                named="Notes",
                                multiLine=8)
                            final String notes) {
            setNotes(notes);
            return this;
        }

        ...
    }



## Alternatives (`.layout.json`)

Unlike [properties](./PropertyLayout.html), it (currently) isn't possible to specify layout hints for action parameters using the `.layout.json` file.


## Specifying a default setting

If you want a consistent look-n-feel throughout the app, eg all action parameter labels to the top, then it'd be rather frustrating to have to  annotate every property.

Instead, a default can be specified in `isis.properties`:

    isis.viewers.parameterLayout.labelPosition=TOP
    
or

    isis.viewers.parameterLayout.labelPosition=LEFT

If these are not present then Isis will render according to internal defaults.  At the time of writing, this means labels are to the left for all datatypes except multiline strings.


## See also

Similar layout annotations exist for other elements of the metamodel:

* [@ActionLayout](./ActionLayout.html) for actions
* [@DomainObjectLayout](./DomainObjectLayout.html) for domain classes
* [@CollectionLayout](./CollectionLayout.html) for collections
* [@PropertyLayout](./PropertyLayout.html) for properties


