How to specify a title for a domain entity
------------------------------------------

[//]: # (content copied to _user-guide_xxx)

Apache Isis viewers identify objects through both an [icon](./how-to-01-070-How-to-specify-the-icon-for-a-domain-entity.html) 
and a title.  For example, a `Customer`'s title might be the organization's customer reference, or perhaps (more 
informally) their first and last names.

The framework has a number of ways to determine the title.  

## Declarative

Most titles tend to be made up of the same set of elements.  For example a `Customer`'s name might be the concatenation 
of their first name and their last name.  For these the `@Title` annotation can be used:

    public class Customer {
      @Title(sequence="2")
      public String getFirstName() { ... }
      @Title(sequence="1", append=",")
      public String getLastName() { ... }
      ...
    }

For each property that is part of the title joining strings can be specified to `prepend` or `append` the property value.

## Imperative

For more control the title can be declared imperately using the `title()` method (returning a `String`).   For example, 
to return the title for a customer which is their last name and then first initial of their first name, we could write:

    public class Customer {
      public String title() {
        return getLastName() + ", " + getFirstName().substring(0,1);
      } 
      ...
    }

The `org.apache.isis.applib.util.TitleBuffer` utility class can be used to create title strings if you so wish.

## Fallback

If there is no `title()` method and no properties annotated with `@Title`, then the object's `toString()` method is
used instead.

In general though we recommend that you do provide either a title explicitly.  You can then use `toString()` method for 
other purposes, such as debugging. 
