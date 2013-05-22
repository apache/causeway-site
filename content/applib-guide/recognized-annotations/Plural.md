@Plural
-------

> **Support**
> 
> * Not supported by: Wicket viewer

When the framework displays a collection of several objects it may use
the plural form of the object type in the title. By default the plural
name will be created by adding an 's' to the end of the singular name
(whether that is the class name or another name specified using
`@Named`). Where the single name ends in 'y' then the default plural
name will end in 'ies' - for example a collection of `Country` objects
will be titled 'Countries'. Where these conventions do not work, the
programmer may specify the plural form of the name using `@Plural`.

For example:

    @Plural("Children")
    public class Child {
        // members and actions here
    }