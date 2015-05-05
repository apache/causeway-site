How to specify that none of an object's members is visible
----------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

To when an object is visible, provide a `hidden()` method:

    public class TrackingAction implements Tracking {
       public boolean hidden(){
        ...
       }
    }

If the function returns `true`, then the user will not be able to view the
object's details.  (In fact, for security purposes the Wicket viewer returns 
an error message that does not even indicate whether the object exists, in 
essence a "404 not found" message).


## Examples

To prevent a user from accessing an object not "owned" by them, use:

    public class SomeEntity {
    
        ...
        
        private String ownedBy;
        public String getOwnedBy() { return ownedBy; }
        public void setOwnedBy(String ownedBy) { this.ownedBy = ownedBy; }
        
        public boolean hidden() {
            return !Objects.equal(getOwnedBy(), container.getUser().getName());
        }
        
        @javax.inject.Inject
        private DomainObjectContainer container;
    }

    
## See also

It is also possible to allow view-only access by [disabling all members](how-to-02-080-How-to-specify-that-none-of-an-object's-members-can-be-modified-or-invoked.html).
