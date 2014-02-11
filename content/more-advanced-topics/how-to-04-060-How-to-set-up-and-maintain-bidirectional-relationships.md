How to set up and maintain bidirectional relationships
------------------------------------------------------

> **Note**: 
> 
> If using the [JDO Objectstore](../../components/objectstores/jdo/about.html) then there is generally no need to explicitly maintain bidirectional relationships.  Indeed, doing so may cause subtle errors.  See [here](../../components/objectstores/jdo/managed-1-to-m-relationships.html) for more details.

The modifyXxx() and clearXxx() methods (see ?) can be used to setup
bidirectional relationships. This is typically done with 1:m
relationships, eg between Order and OrderLine, or Department and
Employee.

The recommended way of maintaining a bidirectional relationship is to
use the 'mutual registration pattern', a write-up of which can be found
[here](http://www.two-sdg.demon.co.uk/curbralan/papers/MutualRegistration.pdf).
The general idea is that one side of the relationship is responsible for
maintaining the associations, while the other side simply delegates.

To implement this in *Isis* for a 1:m relationship, use the `addToXxx()` /
`removeFromXxx()` and the `modifyXxx()` / `clearXxx()` methods.

For example:

    public class Department {
        private SortedSet<Employee> employees = new TreeSet<Employee>();
        public SortedSet<Employee> getEmployees() { ... }
        private void setEmployees(SortedSet<Employee> employees) { ... }
        public void addToEmployees(Employee e) {
            if(e == null || employees.contains(e)) return;
            e.setDepartment(this);
            employees.add(e);
        }
        public void removeFromEmployees(Employee e) {
            if(e == null || !employees.contains(e)) return;
            e.setDepartment(null);
            employees.remove(e);
        }
        ...
    }

and

    public class Employee {
        private Department department;
        public Department getDepartment() { ... }
        private void setDepartment(Department department) { ... }
        public void modifyDepartment(Department d) {
            if(d==null || department==d) return;
            if(department != null) {
                department.removeFromEmployees(this);
            }
            d.addToEmployees(this);
        }
        public void clearDepartment() {
            if(department==null) return;
            department.removeFromEmployees(this);
        }
        ...
    }

