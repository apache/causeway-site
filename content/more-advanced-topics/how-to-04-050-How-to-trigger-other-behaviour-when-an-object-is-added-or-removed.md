How to trigger other behaviour when an object is added or removed
-----------------------------------------------------------------

[//]: # (content copied to _user-guide_xxx)

A collection may have a corresponding `addToXxx()` and/or
`removeFromXxx()` method. If present, and direct manipulation of the
contents of the connection has not been disabled (see ?), then they will
be called (instead of adding/removing an object directly to the
collection returned by the accessor).

The reason for this behaviour is to allow other behaviour to be
triggered when the contents of the collection is altered. That is, it is
directly equivalent to the supporting `modifyXxx()` and `clearXxx()`
methods for properties (see ?).

The syntax is:

    public void addTo<CollectionName>(EntityType param)

and

    public void removeFromCollectionName(EntityType param)

where `EntityType` is the same type as the generic collection type.

For example:

    public class Employee { ... }

    public class Department {
        private List<Employee> employees = new ArrayList<Employee>();
        public List <Employee> getEmployees() {
            return employees;
        }
        private void setEmployees(List<Employee> employees) { 
            this.employees = employees;
        }
        public void addToEmployees(Employee employee) {
            numMaleEmployees += countOneMale(employee);
            numFemaleEmployees += countOneFemale(employee);
            employees.add(employee);
        }
        public void removeFromEmployees(Employee employee) {
            numMaleEmployees -= countOneMale(employee);
            numFemaleEmployees -= countOneFemale(employee);
            employees.remove(employee);
        }
        private int countOneMale(Employee employee) { return employee.isMale()?1:0; }
        private int countOneFemale(Employee employee) { return employee.isFemale()?1:0; }

        ...
    }

