How to hide part of a title
--------------------------------

Normally the visibility of doamin object properties is solely the framework viewers' concern; the domain objects do not
need to know which class members are visible or not.
 
However, one exception is when the title is built programmatically through the 
[title()](../how-tos/how-to-01-040-How-to-specify-a-title-for-a-domain-entity.html) method.  In order to ensure that
potentially sensitive information (that nevertheless is meant to be part of the title) does not "leak out", it may be 
necessary for the domain object to programmatically determine whether the current user can view the information.

One way to accomplish this is to use the [WrapperFactory](../reference/services/wrapper-factory.html), wrapping the
domain object (`this`) and catching any exceptions:

    String foo = "";
    try {
        foo = wrapperFactory.wrap(this).getFoo();
    } catch(HiddenException ex) {
        //ignore
    }

For example, in the todoapp example the `dueBy` date of a `ToDoItem` is part of the title:

    public String title() {
        final TitleBuffer buf = new TitleBuffer();
        buf.append(getDescription());
        if (isComplete()) {
            buf.append("- Completed!");
        } else {
            if (getDueBy() != null) {
                buf.append(" due by", getDueBy());
            }
        }
        return buf.toString();
    }

However, this can be rewritten easily enough to suppress this portion if need be:

    public String title() {
        final TitleBuffer buf = new TitleBuffer();
        buf.append(getDescription());
        if (isComplete()) {
            buf.append("- Completed!");
        } else {
            try {
                final LocalDate dueBy = wrapperFactory.wrap(this).getDueBy();
                if (dueBy != null) {
                    buf.append(" due by", dueBy);
                }
            } catch(HiddenException ex) {
                // ignore
            }
        }
        return buf.toString();
    }
    
We did debate whether to add an additional API in the `WrapperFactory` for this use case; for now we have decided against.