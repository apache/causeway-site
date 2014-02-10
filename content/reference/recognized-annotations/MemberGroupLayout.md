Title: @MemberGroupLayout

> **Support**
> 
> * Supported by: Wicket viewer; not yet supported by other viewers.

`@MemberGroupLayout` defines how groups of properties and how collections are laid out into multiple columns.

The [@MemberOrder] annotation, when applies to properties, identifies the member group that each such property belongs to.

For example:

    public Class Customer {
        @MemberOrder(name="Identifier", sequence="1")
        public String getFirstName() {...}
        public void setFirstName(String value) {...}

        @MemberOrder(name="Identifier", sequence="2")
        public String getLastName() {...}
        public void setLastName(String value) {...}

        @MemberOrder(name="Contact", sequence="1")
        public String getAddress() {...}
        public void setAddress(String value) {...}

        @MemberOrder(name="Contact", sequence="2")
        public String getEmailAddres() {...}
        public void setEmailAddres(String value) {...}

        @MemberOrder(name="Dates", sequence="1")
        public Date getDateOfBirth() {...}
        public void setDateOfBirth(Date value) {...}

        @MemberOrder(name="Other", sequence="1")
        public Timestamp getLastUpdatedOn() {...}
        public void setLastUpdatedOn(Timestamp value) {...}

        @MemberOrder(name="Other", sequence="2")
        public String getLastUpdatedBy() {...}
        public void setLastUpdatedBy(String value) {...}
        ...
    }   

defines 4 member groups by way of the `name` attribute of `@MemberOrder`: 'Identifier', 'Contact', 'Dates' and 'Other'.  The order of the properties within each group is defined by the `sequence` attribute.

The `@MemberGroupLayout` annotation, then, defines the positioning of these member groups into columns.  It is applied to the class itself:


    @MemberGroupLayout(
        columnSpans={4,4,4},
        left={"General", "Other"},
        middle={"Contact"},
        right={"Dates"})
    public Class Customer {
         // as above
    }

This annotation defines 3 columns, all the same width.  In the left column is the 'General' group followed by the 'Other' group.  In the middle column is the 'Contact' group.  In the right-most column is the 'Dates' group.

The widths of the columns can be adjusted using the `columnSpans` attribute.  These should add up to 12, for example:

    * `columnSpans={4,4,4}` - three equal width columns
    * `columnSpans={6,3,3}` - left column twice as wide as the other two 
    * `columnSpans={6,0,6}` - two columns only 

### Layout of Collections

If no property groups are defined in the right-most column, then the objects' collections will be rendered in that column.    Normally the right-most column will be wider than the others, to accommodate the width of the collection's table view.

For example:

    @MemberGroupLayout(
        columnSpans={3,3,6},
        left={"General", "Other"},
        middle={"Contact","Dates"})
    public Class Customer {
         // as above
    }

will render the Customer's collections (if it has any) in the right-most column.

On the other hand, if any property groups are defined in the right-most column, then the objects' collections will be rendered as full-width tables, under each of the property groups.

### Default layout (if no annotation)

If no `@MemberGroupLayout` is present, then the rendering is equivalent to a column span of {4,0,8}, with all property groups in the left-most column.

### Related annotations

This annotation replaces the now-deprecated [@MemberGroups](./MemberGroups.html)
