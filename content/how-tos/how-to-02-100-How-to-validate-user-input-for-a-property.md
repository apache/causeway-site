How to validate user input for a property
-----------------------------------------

[//]: # (content copied to _user-guide_xxx)

### Declarative validation

For properties that accept a text input string, such as `String` and
`Date`, there are convenient mechanisms to validate and/or normalise the
values typed in:

-   For `Date` and number values the `@Mask` annotation may be used.

-   For `String` properties the `@RegEx` annotation may be used.

More complex validation can also be performed imperatively (below).

### Imperative validation

A supporting `validateXxx()` method is used to check that a new value
for a property is valid.

If the proffered value is deemed to be invalid then the property will
not be changed. A non-null return `String` indicates the reason why the
member cannot be modified/action be invoked; the framework is
responsible for providing this feedback to the user.

The syntax is:

    public String validatePropertyName(PropertyType param)

where `PropertyType` is the same type as that of the property itself.

For example:

    public class Exam {
        public int getMark() { ... }
        public void setMark(int mark) { ... }
        public String validateMark(int mark) {
            return !withinRange(mark)? "Mark must be in range 0 to 30": null;
        }
        private boolean withinRange(int mark) { return mark >= 0 && mark <= 30; }
    }

