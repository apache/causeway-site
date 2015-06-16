How to specify the size of String action parameters
---------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

As for properties (see ?), use:

-   the `@MaxLength` to specify the maximum number of characters that
    may be stored within a String parameter.

-   the `@TypicalLength` to specify the typical number of characters
    that are likely to be stored within a String parameter. Viewers are
    expected to use this as a hint as to the size of the field to render
    for the parameter.

-   the `@MultiLine` annotation as a hint to indicate that the parameter
    should be displayed over multiple lines (eg as a text area rather
    than a text field).

For example:

    public class TicketRaiser {

        public void raiseTicket(
                @TypicalLength(50) @MaxLength(255) @Named("Description")
                String getDescription,
                @MaxLength(2048) @MultiLine @Named("Notes")
                String notes) {
            ...
        }
        ...
    }

