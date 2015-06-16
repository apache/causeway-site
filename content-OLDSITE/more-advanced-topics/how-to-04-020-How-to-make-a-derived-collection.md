How to make a derived collection
--------------------------------

[//]: # (content copied to _user-guide_xxx)

Collections can be derived by omitting the mutator (the same way as
[properties](./how-to-04-010-How-to-make-a-derived-property.html).  It should however be annotated with Isis' `@NotPersisted` annotation.

For example:

    public class Department {

        // Standard collection
        private SortedSet<Employee> employees = new TreeSet<Employee>();
        public SortedSet<Employee> getEmployees() { ... }
        private void setEmployees(SortedSet<Employee>) { ... }

        // Derived collection
        @NotPersisted
        public List<Employee> getTerminatedEmployees() {
            List<Employee> terminatedEmployees = new ArrayList<Employee>();
            for(Employee e: employees) {
                if (e.isTerminated()) {
                    addTo(terminatedEmployees, e);
                }
            }
            return terminatedEmployees;
        }
        ...
    }

Derived collections are not persisted, though may be modified if there
is an `addToXxx()` or `removeFromXxx()` supporting method. As for
derived properties, the implementations of these mutators change the
underlying data. For example:

    public class Department {
        ...

        public void addToTerminatedEmployees(Employee employee) {
            employee.setTerminated(true);
        }
        public void removeFromTerminatedEmployees(Employee employee) {
            employee.setTerminated(false);
        }
    }

