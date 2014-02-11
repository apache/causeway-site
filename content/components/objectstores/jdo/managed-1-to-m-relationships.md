Title: Managed 1:m bidirectional relationships

When an object is added to a 1:m bidirectional relationship, the child object must refer to the parent and the child must be added to the parent's children collection.

In general, *Isis* recommends that the mutual registration pattern is ensure that both the parent and child are updated correctly; the framework supports the `modifyXxx()` and `clearXxx()` methods to accomplish this, and this [how-to](../../../more-advanced-topics/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html) describes the boilerplate necessary.  

However, in a relational database, these two operations in the domain object model correspond simply to updating the foreign key of the child table to reference the parent's primary key.

So long as the parent's children collection is a `java.util.Set` (rather than a `Collection` or a `List`), the JDO Objectstore will automatically maintain both sides of the relationship.  All that is necessary is to set the child to refer to the parent.
  
For example

    public class Department {

        @javax.jdo.annotations.Persistent(mappedBy="department")
        private SortedSet<Employee> employees = new TreeSet<Employee>();

        public SortedSet<Employee> getEmployees() { ... }
        public void setEmployees(SortedSet<Employee> employees) { ... }
        ...
    }

and

    public class Employee {
        private Department department;
        public Department getDepartment() { ... }
        public void setDepartment(Department department) { ... }
        ...
    }

Contrast the above with the programmatic maintenance described in the [how-to](../../../more-advanced-topics/how-to-04-060-How-to-set-up-and-maintain-bidirectional-relationships.html).

> **Note**
> 
In fact, not only do you not need to manually maintain the relationship, we have noted on at least [one occasion](http://markmail.org/message/agnwmzocvdfht32f) a subtle error if the code is programmatically added.
>
The error in that case was that the same object was contained in the parents collection.  This of course should not happen for a `TreeSet`.  However, JDO/DataNucleus replaces the `TreeSet` with its own implementation, and (either by design or otherwise) this does not enforce `Set` semantics.
>
The upshot is that you should NEVER programmatically add the child object to the parent's collection if using JDO Objectstore.

