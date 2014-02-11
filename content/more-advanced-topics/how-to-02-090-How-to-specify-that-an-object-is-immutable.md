How to specify that an object is immutable (that none of its members can ever be modified)
------------------------------------------------------------------------------------------

Some objects have state which should not be modifiable; for example
those representing reference data. The viewer is expected to interpret
this by which suppressing any sort of "edit" button.

To indicate that an object cannot be modified, use the `@Immutable`
annotation.

For example:

    @Immutable
    public class ChasingLetter implements PaymentReclaimStrategy {
        ...
    }

<!--
See also ?.
-->
