title: Utility Classes

[//]: # (content copied to user-guide_reference_applib-utility-classes)

> Simple utility classes for domain objects.

The `org.apache.isis.applib.util` package has a number of simple utility
classes designed to simplify the coding of some common tasks.

## Title creation

The `TitleBuffer` utility class is intended to make it easy to construct
title strings (returned from the `title()` method). For example, it has
overloaded versions of methods called `append()` and `concat()`.

##Reason text creation (for disable and validate methods)

There are two different classes provided to help build reasons returned
by `disableXxX()` and `validateXxx()` methods:

-   the `org.apache.isis.applib.util.ReasonBuffer` helper class

-   the `org.apache.isis.applib.util.Reasons` helper class

For example:

    public class Customer {
        ...
        public String validatePlaceOrder(Product p, int quantity) {
            return Reasons.coalesce(
                whetherCustomerBlacklisted(this),
                whetherProductOutOfStock(p)
            );
        }
    }

Which you use (if any) is up to you.

##ObjectContracts

The `ObjectContracts` test provides a series of methods to make it easy for your domain objects to:

* implement `Comparable` (eg so can be stored in `java.util.SortedSet`s)
* implement `toString()`
* implement `equals()`
* implement `hashCode()`

For example:

    public class ToDoItem implements Comparable<ToDoItem> {

        public boolean isComplete() { ... }
        public LocalDate getDueBy() { ... }
        public String getDescription() { ... }
        public String getOwnedBy() { ... }

        public int compareTo(final ToDoItem other) {
            return ObjectContracts.compare(this, other, "complete,dueBy,description");
        }

        public String toString() {
            return ObjectContracts.toString(this, "description,complete,dueBy,ownedBy");
        }
    } 