@MultiLine
----------

> **Support**
>
> Supported, though the Wicket viewer does not support the `preventWrapping` attribute.

The `@MultiLine` annotation provides information about the carriage
returns in a `String` property or action parameter, or for a
string-based value type. It also implies a hint to the viewer that the
widget to be used should be over multiple lines (eg a text area rather
than a text field), with appropriate wrapping and/or scrollbars.

More formally, the annotation indicates that:

-   the `String` property or parameter may contain carriage returns, and

-   (optionally) the typical number of such carriage returns (meaning
    the number of rows in the text area), and

-   (optionally) that the text should be wrapped (the default is that
    text is not wrapped).

The syntax is:

`@MultiLine([numberOfLines=<typicalNumberOfCRs>]
        [,preventWrapping=<false|true>])`

For example:

    public class BugReport {
        @MultiLine(numberOfLines=10)
        public String getStepsToReproduce() { ... }
        public void setStepsToReproduce(String stepsToReproduce) { ... }
        ...
    }

Here the `stepsToReproduce` may be displayed in a text area of 10 rows,
with no wrapping. A horizontal scrollbar may appear if the number of
characters on any given row exceeds the width.

Another example:

    public class Email {
        @MultiLine(numberOfLines=20, preventWrapping=false)
        public String getBody() { ... }
        public void setBody(String body) { ... }
        ...
    }

Here the body should be displayed in a text area of 20 rows, with
wrapping.

If the annotation is combined with the `@TypicalLength`, then the
expected width of the text area in the user interface will be determined
by the value of the typical length divided by the number of specified
lines. For example:

    public class Email {
        @MultiLine(numberOfLines=20, preventWrapping=false)
        @TypicalLength(800)
        public String getBody() { ... }
        public void setBody(String body) { ... }
        ...
    }

Here the body will (likely be) displayed in a text area of 20 rows, with
40 columns.
