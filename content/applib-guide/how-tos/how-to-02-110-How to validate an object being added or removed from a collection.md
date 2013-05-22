How to validate an object being added or removed from a collection
------------------------------------------------------------------

A `validateAddToXxx()` method can be used to check that an object is
valid to be added to a collection. Conversely, the
validateRemoveFromXxx() method can be used to check that it is valid to
remove an object from a collection is valid.

The syntax is:

    public String validateAddToCollectionName(EntityType param)

and

    public String validateRemoveFromCollectionName(EntityType param)

A non-`null` return `String` indicates the reason why the object cannot
be added/removed, and the viewing mechanism will display this to the
user.

For example:

    public class Department {
        public List<Employee> getEmployees() { ... }
        private void setEmployees(List<Employee> employees) { ... }
        public String validateAddToEmployee(Employee employee) {
            return employee.isRetired()?
                "Cannot add retired employees to department"
                :null;
        ...
    }

