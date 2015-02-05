Title: @ActionSemantics

> Deprecated, use instead [@Action#semantics()](./Action.html).

This annotation, which applies only to actions, describes whether the
invocation is safe (as no side-effects), is idempotent (may have
side-effects but always has the same postconditions), or is neither safe
nor idempotent. If the annotation is missing then the framework assumes
non-idempotent.

For example:

    public class Customer {
        @ActionSemantics(Of.SAFE)
        public CreditRating checkCredit() { ... }

        @ActionSemantics(Of.IDEMPOTENT)
        public void changeOfAddress(Address address) { ... }

        @ActionSemantics(Of.NON_IDEMPOTENT)
        public Order placeNewOrder() { ... }
        ...
    }

The annotation was introduced for the restfulobjects viewer in order
that action invocations could be made available using either HTTP GET,
PUT or POST (respectively). It is now also used in core runtime's
in-built concurrency checking; the invocation of a safe action does not
perform a concurrency check, whereas non-safe actions do perform a
concurrency check.