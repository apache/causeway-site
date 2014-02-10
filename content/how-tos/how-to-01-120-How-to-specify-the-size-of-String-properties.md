How to specify the size of String properties
--------------------------------------------

Use:

-   the `@MaxLength` to specify the maximum number of characters that
    may be stored within a String property.

-   the `@TypicalLength` to specify the typical number of characters
    that are likely to be stored within a String property. Viewers are
    expected to use this as a hint as to the size of the field to render
    for the property.

-   the `@MultiLine` annotation as a hint to indicate that the property
    should be displayed over multiple lines (eg as a text area rather
    than a text field).

For example:

    public class Ticket {
        @TypicalLength(50)
        @MaxLength(255)
        public String getDescription() { ... }
        ...

        @MaxLength(2048)
        @MultiLine
        public String getNotes() { ... }
        ...
    }

