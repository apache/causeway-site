Title: @CssClass

The `CssClass` annotation applies to object and also to any object member 
(property, collection or action).  It is used by the Wicket viewer as a UI hint 
to render specified CSS classes around the representation of the element.

Application-specific CSS can then be used to target and adjust the UI representation
of that particular element.

For example:

    @CssClass("x-main")
    public class ToDoItem { ... }

or

    public class ToDoItem { 
    
        @CssClass("x-key")
        public LocalDate getDueBy() { ... }
        
    }


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
                    "dueBy": {
                        "cssClass": { "value": "x-key" }
                    }
                    ....
                }
            },
            ...
        }
    }


Note that this (currently) only supports class members, not classes


## See also (1.8.0-SNAPSHOT)

The similar [CssClassFa](./CssClassFa.html) annotation is also used as a hint 
to apply CSS, but in particular to allow [Font Awesome icons](http://fortawesome.github.io/Font-Awesome/icons/)
to be rendered on action butotns or as the icon for classes.
