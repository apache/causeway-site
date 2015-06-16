How to specify that none of an object's members can be modified/invoked
-----------------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Some objects have state which should not be modifiable only under
certain conditions; for example an invoice can not be modified after it
has been paid. The viewer is expected to interpret this by suppressing
any sort of "edit" button.

To indicate that an object cannot be modified, use the
`String disabled(Identifier.Type type)` method:

    public class FeeInvoice implements Invoice {
       public String disabled(Identifier.Type type){
        ...
       }
    }

where `Identifier.Type` is in `org.apache.isis.applib:

        /**
         * What type of feature this identifies.
         */
        public static enum Type {
            CLASS, PROPERTY_OR_COLLECTION, ACTION
        }

and provides fine grain control over disabling actions and properties.

The return String is null if the the object (action or property) is not
disabled, or the reason why it is disabled.

## Examples

To prevent a user from modifying an object not "owned" by them, use:

    public class SomeEntity {
    
        ...
        
        private String ownedBy;
        public String getOwnedBy() { return ownedBy; }
        public void setOwnedBy(String ownedBy) { this.ownedBy = ownedBy; }
        
        public String disabled(Identifier.Type type) {
            if(Objects.equal(getOwnedBy(), container.getUser().getName())) {
                return null;
            }
            return "Can't modify objects not owned by you.";
        }
        
        @javax.inject.Inject
        private DomainObjectContainer container;
    }

{note
This does not apply to any contributed actions; they must be disabled explicitly.
}
    
    
## See also

It is also possible to prevent the user from even viewing an object, that is 
to programmatically [hide the object](how-to-02-040-How-to-specify-that-none-of-an-object's-members-is-visible).

    
<!--
See also ?.
-->
