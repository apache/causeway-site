How to trigger other behaviour when a property is changed
---------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

If you want to invoke functionality whenever a property is changed by
the user, then you should create a supporting `modifyXxx()` method and
include the functionality within that. The syntax is:

    public void modifyPropertyName(PropertyType param)

Why not just put this functionality in the setter? Well, the setter is
used by the object store to recreate the state of an already persisted
object. Putting additional behaviour in the setter would cause it to be
triggered incorrectly.

For example:

    public class Order() {
        public Integer getAmount() { ... }
        public void setAmount(Integer amount) { ... }
        public void modifyAmount(Integer amount) {
            setAmount(amount);
            addToTotal(amount);
        }
        ...
    }

Here the `modifyAmount()` method also calls the `addToTotal()` call as
well as the `setAmount()` method. We don't want this addToCall() method
to be called when pulling the object back from the object store, so we
put it into the modify, not the setter.

You may optionally also specify a `clearXxx()` which works the same way
as modify `modify` `Xxx()` but is called when the property is cleared by
the user (i.e. the current value replaced by nothing). The syntax is:

    public void clearPropertyName()

To extend the above example:

    public class Order() {
        public Integer getAmount() { ... }
        public void setAmount(Integer amount) { ... }
        public void modifyAmount(Integer amount) { ... }
        public void clearAmount() {
            removeFromTotal(this.amount);
            setAmount(null);
        }
        ...
    }

