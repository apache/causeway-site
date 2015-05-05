How to decouple dependencies using contributions
------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

In a small application (a dozen or less entities, say) there is little risk in having cyclic
dependencies between entities, but as your application gets larger this coupling will cause problems - the inevitable [big ball of mud](http://en.wikipedia.org/wiki/Big_ball_of_mud).

You should, therefore, use packages to group related entities together, and then make sure that the package dependencies are acyclic.  There are tools available that can help you visualize this and detect violations.  Some tools can even plug into your build so that your build can fail if the architectural layering defined between your packages is violated.  In DDD terms we are grouping our entities into [module](http://domainlanguage.com/ddd/patterns)s.

On the other hand, although the dependencies between your modules should be well-defined and acyclic, you might want the UI to show the relationship as if it were bidirectional.

For example, suppose we have an `communicationChannels` module that defines various subtypes of `CommunicationChannel` entity: `PostalAddress`, `PhoneNumber`, `EmailAddress` and so on.  Each such `CommunicationChannel` is associated with (owned by) a `CommunicationChannelOwner`, defined as an interface.

In the `customers` module, we have the `Customer` entity that implements `CommunicationChannel`, while in the `assets` module we have `FixedAsset` that also implements this entity.  Thus, a given `Customer` and a given `FixedAsset` could both - logically, at least - have a collection of `CommunicationChannel`s.

For both `Customer` and `FixedAsset` (and any other future implementation) we would want to have some means to add and remove `CommunicationChannel`s).  Rather than having very similar collections and actions in each, we can implement the requirement by defining the behaviour in the `communicationChannels` module, through a domain service.  It would look something like:

    @DomainService(
        nature=NatureOfService.VIEW_CONTRIBUTIONS_ONLY
    )
    public class CommunicationChannelContributions {

        public CommunicationChannelOwner addPostalAddress(
                        final CommunicationChannelOwner owner,
                        final @Named("Address line 1") String addressLine1,
                        ... 
                        final @Named("Zipcode") String zipCode) {
            ...
        }

        @Action(
            semantics=SemanticsOf.SAFE
        )
        @ActionLayout(
            contributed=Contributed.AS_ASSOCIATION)
        }
        @CollectionLayout(
            render=RenderType.EAGERLY
        )
        public Collection<CommunicationChannel> communicationChannels(
                        final CommunicationChannelOwner owner) {
            ...
        }

        @Action(
            semantics=SemanticsOf.SAFE
        )
        @ActionLayout(
            contributed=Contributed.AS_ASSOCIATION)
        }
        public CommunicationChannel preferredCommunicationChannels(
                        final CommunicationChannelOwner owner) {
            ...
        }

    }

The first action, `addPostalAddress` will be rendered seemingly as a regular action for all implementations of `CommunicationChannelOwner`, but with that parameter omitted.  This is a contributed action.

The second action - whose implementation will be some repository query to search for all `CommunicationChannel`s for the given owner - will be rendered as a collection of the owner; this is a contributed collection.  The `@ActionLayout(contributed=Contributed.AS_ASSOCIATION)` suppresses the action from being contributed as an action also.  Note that the action must have safe semantics, specified using `@Action(semantics=SemanticsOf.SAFE)`; otherwise the rendering of the collection could cause unwanted side-effects.  Note also that it is valid to apply a `@CollectionLayout` annotation; or this could be specified using a `Xxx.layout.json` file for each contributee (implementing `CommunicationChannelOwner`).

Finally, the third action - that again will be some sort of repository query - will be rendered as a property of hte owner; this is a contributed property.  Again, the action must have safe semantics, specified using `@Action(semantics=SemanticsOf.SAFE)`.  And, again, , the `@ActionLayout(contributed=Contributed.AS_ASSOCIATION)` suppresses the action from being contributed as an action also.  Analogously to the contributed collection, a `@PropertyLayout` annotation could be also be specified.

## See also

See also: how to [suppress contributions for one action parameter](./how-to-suppress-contributions-to-action-parameter.html) but not another.

