Title: @Title

[//]: # (content copied to _user-guide_xxx)

The `@Title` annotation is used to indicate which property or properties
make up the object title. If more than one property is used, the order
can be specified (using the same Dewey-decimal notation as used by
`@MemberOrder`) and the string to use between the components can also be
specified.

For example:

    public void Customer {
        @Title(sequence="1.0")
        public String lastName() { ... }
        ...
        @Title(sequence="1.5", prepend=", ")
        public String firstName() { ... }
        ...
        @Title(sequence="1.7", append=".")
        public String midInitial() { ... }
        ...
    }

could be used to create names of the style "Bloggs, Joe K."

It is also possible to annotate reference properties; in this case the
title will return the title of the referenced object (rather than, say,
its string representation).

An additional convention for `@Title` properties is that they are hidden
in tables (in other words, it implies `@Hidden(where=Where.ALL_TABLES)`.
For viewers that support this annotation (for example, the Wicket
viewer), this convention excludes any properties whose value is already
present in the title column. This convention can be overridden using
`@Hidden(where=Where.NOWHERE)`.
