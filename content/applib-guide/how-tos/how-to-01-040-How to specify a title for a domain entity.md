How to specify a title for a domain entity
------------------------------------------

A title is used to identify an object to the user in the user interface.
For example, a Customer's title might be the organization's customer
reference, or perhaps (more informally) their first and last names.

By default, the framework will use the object's `toString()` method as
the title. Most titles tend to be made up of the same set of elements:
for example a Customer's name might be the concatenation of their
customer first name and their ;ast name. For these the @Title annotation
can be used:

    public class Customer {
      @Title
      public String getFirstName() { ... }
      @Title
      public String getLastName() { ... }
      ...
    }

For more control, the order of the title components can be specified
using a sequence number (specified in Dewey decimal format):

    public class Customer {
      @Title("1.0")
      public String getFirstName() { ... }
      @Title("1.1")
      public String getLastName() { ... }
      ...
    }

For more control the title can be declared imperately using the
`title()` method (returning a `String`). This leaves the programmer
needs to make use of the `toString()` method for other purposes, such as
for debugging. For example, to return the title for a customer which is
their last name and then first initial of their first name, we could
use:

    public class Customer {
      public String title() {
        return getLastName() + ", " + getFirstName().substring(0,1);
      } 
      ...
    }

The applib contains a class, `org.apache.isis.applib.util.TitleBuffer`,
which you can use to help create title strings if you so wish. <!-- See ? for
more details.-->
