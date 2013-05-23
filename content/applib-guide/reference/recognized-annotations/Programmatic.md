@Programmatic
-------------

The `@Programmatic` annotation can be used to cause Apache Isis to
complete ignore a class member. This means it won't appear in any
viewer, its value will not be persisted, and it won't appear in any XML
snapshots <!--(see ?)-->.

A common use-case is to ignore implementation-level artifacts. For
example:

    public class Customer implements Comparable<Customer> {
        ...
        @Programmatic
        public int compareTo(Customer c) { 
            return getSalary() - c.getSalary();
        }
        ...
    }

Note that `@Programmatic` does not simply imply `@Hidden` and `@NotPersisted`;
it actually means that the class member will not be part of the Isis
metamodel.

