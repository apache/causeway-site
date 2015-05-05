How to ensure object is in valid state
--------------------------------------

[//]: # (content copied to _user-guide_xxx)

A `validate()` method may be added to provided validation at object level, prior to making an object persistent.

The syntax is:

    public String validate()

A non-`null` value is the taken to be the reason why the object cannot be saved.

This is particularly useful for validating fields in relation to each other.

For example:

    public class Booking {
        private Date fromDate;
        public Date getFromDate() {...}
        public void setFromDate(Date d) {...}
        
        private Date toDate;
        public Date getToDate() {...}
        public void setToDate(Date d) {...}

        public String validate() {
            if (fromDate.getTicks() > toDate.getTicks()) {
                return "From Date cannot be after To Date";
            }
            return null;
        }
        ...
    }

This will prevent the user from saving a transient `Booking` where the *From Date* falls after the *To Date*. Note that in this example, the two date properties could also have their own individual `validateXxx()` methods - for example in order to test that each date was after today.

> **Warning**
>
> At the time of writing, the `validate()` method is called only when
> the object is first saved, not when it is subsequently updated. For
> validation of subsequent updates, the workaround is necessary to build
> the validation logic into the individual property validation methods
> (though these could delegate to a common `validate()` method).
>
> See [ISIS-18](https://issues.apache.org/jira/browse/ISIS-18) for the
> status of this issue.
