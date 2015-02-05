Title: @Programmatic

The `@Programmatic` annotation causes the method to be excluded completely from the Apache Isis metamodel.  This means it won't appear in any UI, and it won't appear in any mementos/snapshots.

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

