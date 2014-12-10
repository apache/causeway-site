Title: @CssClassFa (1.8.0-SNAPSHOT)

> Deprecated in 1.8.0-SNAPSHOT, see instead [@DomainObjectLayout](./DomainObjectLayout.html), [@PropertyLayout](./PropertyLayout.html),  [@CollectionLayout](./CollectionLayout.html),  [@ActionLayout](./ActionLayout.html) and [@ParameterLayout](./ParameterLayout.html).

The `CssClassFa` annotation applies to objects and also to object actions,
and is used by the Wicket viewer as a UI hint.

For object actions, the viewer will render the specified
[Font Awesome icon](http://fortawesome.github.io/Font-Awesome/icons/)
on the action's button (or menu item).

For objects, it will be used as an icon.  Note that this is only used if
the object does not have a `getIconName()` method.

For example:

    @CssClassFa("fa-check-circle")
    public class ToDoItem { ... }

or

    public class ToDoItem { 
    
        @CssClass("fa-step-backward")
        public ToDoItem previous() { ... }
        
        @CssClass("fa-step-forward")
        public ToDoItem next() { ... }
        
    }

There can be multiple "fa-" classes, eg to mirror or rotate the icon.  There 
is no need to include the "fa" class; it will be automatically appended.
    
## Alternatives (`.layout.json`)

As an alternative to using the `@CssClass` annotation, the `.layout.json` 
[dynamic layout file](../../components/viewers/wicket/dynamic-layouts.html) 
can be specified, eg:

    {
        "span": 6,
        "memberGroups": {
            "Priority": {
                "members": {
                    ...
                     "relativePriority": {
                        "actions": {
                            "previous": {
                                "cssClassFa": { "value": "fa-step-backward" }
                            },
                            "next": {
                                "cssClassFa": { "value": "fa-step-forward" }
                            }
                        }
                    },
                    ....
                }
            },
            ...
        }
    }


Note that this (currently) only supports class members, not classes.

## See also

The similar [CssClass](./CssClass-deprecated.html) annotation is also used as a hint
to apply CSS, but for wrapping the representation of an object or object
member so that it can be styled in an application-specific way.

