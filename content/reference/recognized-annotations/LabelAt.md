Title: @LabelAt (1.8.0-SNAPSHOT)

The `@LabelAt` annotation is a UI hint to indicate the positioning of a 
property or action parameter label either to the top or the left.

For example:

    public class ToDoItem {
       
        @LabelAt(Position.LEFT)
        public String getDescription() { ... }
       
        @LabelAt(Position.TOP)
        public String getNotes() { ... }
       
        ...
    }

## Alternatives (`.layout.json`)

As an alternative to using the `@LabelAt` annotation, the `.layout.json` 
[dynamic layout file](../../components/viewers/wicket/dynamic-layouts.html) 
can be specified, eg:

    {
        "span": 6,
        "memberGroups": {
            "Other": {
                "members": {
                    ...
                    "notes": {
                        "labelAt": {
                            "value": "TOP"
                        }
                    },
                    ....
                }
            },
            ...
        }
    }

Note that it (currently) isn't possible to specify layout hints for action parameters.


## Specifying a default setting

If you want a consistent look-n-feel throughout the app (eg all property labels to the top,
or all action action parameters to the left) then it'd be rather frustrating to have to 
annotate every  property and action parameter.

Instead, two configuration settings can be specified (in `isis.properties`):

    isis.viewers.labelAt.property=TOP
    
or

    isis.viewers.labelAt.parameter=LEFT

If these are not present then Isis will render according to internal defaults.  At the time of writing, this means labels are to the left for all datatypes except multiline strings.