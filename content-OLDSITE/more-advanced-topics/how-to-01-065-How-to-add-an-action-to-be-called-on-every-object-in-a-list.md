How to add an action to be called on every entity within a list
---------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Usually an action is performed on a single instance of an entity (or domain service).  To indicate that a given action should be called for every instance of a list (eg as returned by a domain service finder), add the `@Bulk` annotation:

    public class SomeDomainService {

        @Bulk
        public void actionName() { ... }

    }

Note however that bulk actions have a couple of important restrictions.

-   such actions on an entity cannot take any arguments

    This restriction might be lifted in the future;

-   any business rules for hiding, disabling or validating the action
    are ignored.


Contributed actions (as described [here](./how-to-01-062-How-to-decouple-dependencies-using-contributions.html) can also be annotated as `@Bulk` actions, however they must accept a single argument (the contributee).  For example:

    public class SomeDomainService {

        @Bulk
        public void actionName(SomeEntity someEntity) { ... }

    }


At the time of writing, only the Wicket viewer recognizes bulk actions;
other viewers treat the action as a regular action.

