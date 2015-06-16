How to add a collection to a domain entity
------------------------------------------

[//]: # (content copied to _user-guide_xxx)

A collection is a multi-valued attribute/field of a entity, in other
words a `List` or a `Set`, containing references to other domain
entities. `Map`s are not supported. Collections of value types are not
supported.

A collection is recognized via an accessor/mutator method pair (`get`
and set) for any type of collection provided by the programming
language.

The syntax is either:

    public Collection<EntityType> getCollectionName()
    private void setCollectionName(Collection<EntityType> param)

or:

    public List<EntityType> getCollectionName()
    private void setCollectionName(List<EntityType> param)

or:

    public Set<EntityType> getCollectionName()
    private void setCollectionName(Set<EntityType> param)

A mutator is required, but it need only have `private` visibility.

Note:

> **Note**
>
> Maps cannot be used for collections.

It is recommended that the collections be specified using generics (for
example: `List<Customer>` ). That way the framework will be able to
display the collection based on that type definition. If a raw type is
used then the framework will attempt to infer the type from the
addToXxx() / removeFromXxx() supporting methods, if specified <!--(see ?)-->.
If the framework is unable to determine the type of the collection, it
will mean that some viewers will represent the collection is a less
sophisticated manner (eg a simple list of titles rather than a table).

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
        ...
    }
