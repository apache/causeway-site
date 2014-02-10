How to specify that none of an object's members can be modified/invoked
-----------------------------------------------------------------------

Some objects have state which should not be modifiable only under
certain conditions; for example an invoice can not be modified after it
has been paid. The viewer is expected to interpret this by suppressing
any sort of "edit" button.

To indicate that an object cannot be modified, use the
`String disabled(Type type)` method.

For example:

    public class FeeInvoice implements Invoice {
       public String disabled(Type type){
        ...
       }
    }

The `Type` is from org.apache.isis.applib.Identifier:

        /**
         * What type of feature this identifies.
         */
        public static enum Type {
            CLASS, PROPERTY_OR_COLLECTION, ACTION
        }

and provides fine grain control over disabling actions and properties.

The return String is null if the the object (action or property) is not
disabled, or the reason why it is disabled<!--, similar to ?-->.

<!--
See also ?.
-->
