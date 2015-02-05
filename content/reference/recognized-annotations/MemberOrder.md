Title: @MemberOrder

> See also [dynamic layouts](../../components/viewers/wicket/dynamic-layouts.html).

`@MemberOrder` is the recommended mechanism for specifying the order in
which fields and/or actions are presented to the user. (`@ActionOrder`
and `@FieldOrder` provide alternative, deprecated mechanisms).

`@MemberOrder` is specified at the individual member level, relative to
other members, as a string. The simplest convention is to use numbers -
1, 2, 3 - though it is a better idea to leave gaps in the numbers - 10,
20, 30 perhaps - such that a new member may be added without having to
edit existing numbers. A useful alternative is to adopt the
'dewey-decimal' notation - 1, 1.1, 1.2, 2, 3, 5.1.1, 5.2.2, 5.2, 5.3 -
which allows for an indefinite amount of future insertion, and allows
subclasses to insert their class members as required.

For example:

    public Class Customer {
        @MemberOrder(sequence="2.1")
        public String getAddress() {...}
        public void setAddress(value as String) {...}

        @MemberOrder(sequence="1.1")
        public String getFirstName() {...}
        public void setFirstName(value as String) {...}

        @MemberOrder(sequence="1.2")
        public String getLastName() {...}
        public void setLastName(value as String) {...}

        @MemberOrder(sequence="3")
        public Date getDateOfBirth() {...}
        public void setDateOfBirth(value as Date) {...}
        ...
    }   

If a member does not have a specified order then it will be placed after
those that are specified. Two members may have the same sequence
specifier, but in such a case the relative ordering of those members
will be indeterminate.

> **Note**
>
> Certain styles of user interface may lay out an object's properties
> and its collections separately, in which case the relative member
> order of properties and collections will be evaluated separately. In
> general, though, consider the layout of all properties and collections
> together, and of all actions together.

As a refinement to this, some viewers support the notion of grouping
members together. In this case the `name` attribute can be specified.

For example, the following can be used to group properties:

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

In this case the `sequence` is ordered with respect to the `name`. If
using group names in this way, typically the `@MemberGroups` annotation
<!--(see ?)--> should also be specified, allowing the order of the groups
themselves to be sorted.

Grouping can also be performed on actions. Some viewers (for example the
Wicket viewer) support the idea that the group name can be the name of a
collection. In this case, the action is rendered "near to" the
collection (for example, to support add or remove of elements).

For example:

    public Class Customer {

        public List<CommunicationChannel> getCommunicationChannels() { ... }

        ...
        @MemberOrder(name="communicationChannels", sequence="1.1")
        public void addCommunicationChannel(...) { ... }

        @MemberOrder(name="communicationChannels", sequence="1.2")
        public void removeCommunicationChannel(...) { ... }

        ...
    }   
