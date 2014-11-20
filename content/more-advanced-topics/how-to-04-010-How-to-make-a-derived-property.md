How to make a derived property
------------------------------

### Read-only

Most derived properties are read-only, their value being derived from
other information available to the object.

Omitting the mutator (`setXxx()`) method for a property indicates both
that the field is derived, and is not be persisted.  It should however
be annotated with Isis' `@NotPersisted` annotation.

For example:

    public class Employee {
        public Department getDepartment() { ... }
        ...

        // this is the derived property
        @NotPersisted
        public Employee getManager() {
            if (getDepartment() == null) { return null; }
            return getDepartment().getManager();
        }
        ...
    }

### Read-write using a setter

A derived property can be made updateable (in that it takes the provided
value and does something sensible with it) simply providing a setter that
has been annotated using both Isis' `@NotPersisted` annotation and JDO's
`@javax.jdo.annotations.NotPersistent` annotation:

    public class Employee {
        public Department getDepartment() { ... }
        ...

        @javax.jdo.annotations.NotPersistent
        @NotPersisted
        public Employee getManager() { ... }
        public void setManager(Employee manager) {
            if (getDepartment() == null) { return; }
            getDepartment().modifyManager(manager);
        }
        ...
    }

### Read-write using a modify method (1.7.0 onwards)

Alternatively, a derived property can be made updateable by providing a 
`modifyXxx()` supporting method:

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

### Caveats

Beware of having two visible properties that update the same underlying data;
which value "wins" is not well-defined.

For example, consider this silly example:

    public class ToDoItem {
    
        private String description;
        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }

        public String getDerivedDescription() { return getDescription(); }
        public void modifyDerivedDescription(String derivedDescription) { setDescription(derivedDescription); }
        
    }
    
The value that is persisted back will be either from the 'description' field
or the 'derivedDescription' field, which is almost certainly not what was intended.

The fix is easy enough; make one of the fields invisible, eg:

    public class ToDoItem {
    
        private String description;
        @Hidden // problem resolved!
        public String getDescription() { return description; }
        public void setDescription(String description) { this.description = description; }
        
        public String getDerivedDescription() { return getDescription(); }
        public void modifyDerivedDescription(String derivedDescription) { setDescription(derivedDescription); }
        
    }


