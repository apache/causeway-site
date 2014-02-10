How to specify that none of an object's members is visible
----------------------------------------------------------

To when an object is visible, provide a `hidden()` method:

    public class TrackingAction implements Tracking {
       public boolean hidden(){
        ...
       }
    }

If the function returns `true`, all properties and actions will be hidden
from the user<!--, similar to ?-->.
