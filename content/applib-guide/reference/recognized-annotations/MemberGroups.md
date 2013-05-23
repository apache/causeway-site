@MemberGroups
-------------

> **Support**
> 
> * Supported by: Wicket viewer; not yet supported by other viewers.

`@MemberGroups` is designed to work in conjunction with `@MemberOrder`
<!--(see ?)-->, and specifies the order in which groups of members should be
rendered.

For example:

    @MemberGroups({"General", "Dates", "Other"})
    public Class Customer {
        @MemberOrder(name="General", sequence="1.1")
        public String getFirstName() {...}
        public void setFirstName(value as String) {...}

        @MemberOrder(name="General", sequence="1.2")
        public String getLastName() {...}
        public void setLastName(value as String) {...}

        @MemberOrder(name="Other", sequence="1")
        public String getAddress() {...}
        public void setAddress(value as String) {...}

        @MemberOrder(name="Dates", sequence="1")
        public Date getDateOfBirth() {...}
        public void setDateOfBirth(value as Date) {...}
        ...
    }   

If the `@MemberOrder`'s name is not specified, then its group is assumed
to be "`General`".
