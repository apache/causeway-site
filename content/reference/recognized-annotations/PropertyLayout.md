Title: @PropertyLayout (1.8.0-SNAPSHOT)

The `@PropertyLayout` annotation applies to properties collecting together all UI hints within a single annotation:

* `cssClass` - the css class that a property should have, to allow more targetted styling in `application.css`
* `describedAs` - description of this property, eg to be rendered in a tooltip.
* `labelPosition` - in forms, the positioning of the label (LEFT, TOP or NONE) relative to the property value.  For boolean properties it is also possible to specify RIGHT.  Defaults to LEFT unless `multiLine` also specified (see below)
* `hidden` - indicates where in the UI the property should *not* be visible in the UI
* `named` -the name of this property (overriding the name derived from its name in code)
* `namedEscaped` - whether to HTML escape the name of this property.  Defaults to true.
* `multiLine` - for string properties, render as a text area over multiple lines.  If set >1, then `labelPosition` defaults to TOP unless otherwise specified.
* `renderedAsDayBefore` - for date properties only, render the date as one day prior to the actually stored date (eg the end date of an open interval into a closed interval)
* `typicalLength` -the typical entry length of a field, use to determine the optimum width for display

For example:

    public class ToDoItem {
       
        @PropertyLayout(
            cssClass="x-key",
            named="Description of this <i>item</i>",
            namedEscaped=false,
            describedAs="What needs to be done",
            labelPosition=LabelPosition.LEFT,
            typicalLength=80)
        public String getDescription() { ... }
       
        @PropertyLayout(
            describedAs="Additional notes",
            labelPosition=LabelPosition.TOP,
            multiLine=8)
        public String getNotes() { ... }
       
        ...
    }

It is also possible to apply the annotation to actions of domain services that are acting as [contributed properties](../../more-advanced-topics/how-to-01-062-How-to-decouple-dependencies-using-contributions.html).

## Alternatives (`.layout.json`)

As an alternative to using the `@PropertyLayout` annotation, the `.layout.json`
[dynamic layout file](../../components/viewers/wicket/dynamic-layouts.html) 
can be specified, eg:

    {
        "span": 6,
        "memberGroups": {
            "Other": {
                "members": {
                    ...
                    "description": {
                        "propertyLayout": {
                            "cssClass": "x-key",
                            "describedAs": "What needs to be done",
                            "labelPosition": "LEFT",
                            "typicalLength": 80
                        }
                    },
                    "notes": {
                        "propertyLayout": {
                            "describedAs": "Additional notes"
                            "labelPosition": "TOP",
                            multiLine=8
                        }
                    },
                    ....
                }
            },
            ...
        }
    }


## Specifying a default setting for label positions

If you want a consistent look-n-feel throughout the app, eg all property labels to the top, then it'd be rather
frustrating to have to annotate every property.

Instead, a default can be specified in `isis.properties`:

    isis.viewers.propertyLayout.labelPosition=TOP
    
or

    isis.viewers.propertyLayout.labelPosition=LEFT

If these are not present then Isis will render according to internal defaults.  At the time of writing, this means labels are to the left for all datatypes except multiline strings.

## See also

Similar layout annotations exist for other elements of the metamodel:

* [@CollectionLayout](./CollectionLayout.html) for collections
* [@ActionLayout](./ActionLayout.html) for actions
* [@ParameterLayout](./ParameterLayout.html) for action parameters
* [@DomainObjectLayout](./DomainObjectLayout.html)
* [@DomainServiceLayout](./DomainServiceLayout.html)
* [@ViewModelLayout](./ViewModelLayout.html)

Corresponding domain semantics:

* [@Property](./Property.html)
