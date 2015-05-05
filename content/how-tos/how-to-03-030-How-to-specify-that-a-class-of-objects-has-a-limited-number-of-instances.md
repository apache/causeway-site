How to specify that a class of objects has a limited number of instances
------------------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Sometimes an entity may only have a relatively small number of
instances, for example the types of credit cards accepted (Visa,
Mastercard, Amex). Viewers will typically expected to render the
complete set of instances as a drop down list whenever the object type
is used (ie as a property or action parameter).

To indicate that a class has a limited number of instances, use the
@Bounded annotation. Note that there is an implied expectation is that
the list of objects is small, and relatively cheap to obtain from the
object store.

An alternative way to specify a selection of objects is using the
choicesXxx() supporting methods.

For example:

    @Bounded
    public class PaymentMethod {
        ...
    }

Alternatively, you might want to use a (Java) `enum`, because these are
implicitly bounded.

