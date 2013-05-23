How to make a derived collection
--------------------------------

Collections can be derived by omitting the mutator (the same way as
properties<!--, see ?-->).

For example:

    public class Department {
        // Standard collection
        private List<Employee> employees = new ArrayList<Employee>();
        public List<Employee> getEmployees() { ... }
        private void setEmployees(List<Employee>) { ... }

        // Derived collection
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

