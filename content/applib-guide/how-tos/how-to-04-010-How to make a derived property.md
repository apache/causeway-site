How to make a derived property
------------------------------

### Read-only

Most derived properties are read-only, their value being derived from
other information available to the object.

Omitting the mutator (`setXxx()`) method for a property indicates both
that the field is derived, and is not be persisted.

For example:

    public class Employee {
        public Department getDepartment() { ... }
        ...

        // this is the derived property
        public Employee getManager() {
            if (getDepartment() == null) { return null; }
            return getDepartment().getManager();
        }
        ...
    }

### Read-write

A derived property can be made updateable (in that it takes the provided
value and does something sensible with it) by providing a `modifyXxx()`
supporting method:

    public class Employee {
        public Department getDepartment() { ... }
        ...

        // this is the derived property
        public Employee getManager() { ... }

        // this makes the derived property modifiable
        public void modifyManager(Employee manager) {
            if (getDepartment() == null) { return; }
            getDepartment().modifyManager(manager);
        }

        ...
    }

Note how the implementation of such a `modifyXxx()` method typically
modifies the original source of the information (the Department object).

Alternatively, if you prefer to have a setter, then you can use Isis'
@NotPersisted attribute.

    public class Employee {
        public Department getDepartment() { ... }
        ...

        @NotPersisted
        public Employee getManager() { ... }
        public void setManager(Employee manager) {
            if (getDepartment() == null) { return; }
            getDepartment().modifyManager(manager);
        }
        ...
    }

> **Note**
>
> If you use this approach, then for some object stores you may also
> need to annotate the property to exclude it. For example the
> JDO/DataNucleus object store requires the property being annotated
> with @javax.jdo.annotations.NotPersistent.

