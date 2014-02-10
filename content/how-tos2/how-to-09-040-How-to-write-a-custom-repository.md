How to write a custom repository
--------------------------------

Repositories are defined as interfaces within the domain, and their implementation will vary by object store. During prototyping and for much of development, you will probably find it easiest to use an in-memory object store or perhaps the XML object store, with only a small number of instances. The `DomainObjectContainer` provides a set of methods that make it easy to pull back all instances from the object store which can then be filtered as required. Later on, you can replace
the implementation depending upon the specifics of the object store that you'll be using for production.

If you inherit from the 
`org.apache.isis.applib.AbstractFactoryAndRepository` adapter class then this will automatically have the `DomainObjectContainer` injected, and
provides convenience methods that delegate to the container. Using this is not mandatory, however.

The methods provided by the `DomainObjectContainer` to support
repositories are:

-   `allInstances(Class<T> ofType)`

    Returns all instances of the specified type. Note that this includes
    all instances of any subtypes.

-   `allMatches(...)`

    Returns all instances matching the provided arguments.

-   `firstMatch(...)`

    Returns the first instance matching the provided arguments.

-   `uniqueMatch(...)`

    Returns the one-and-only instance matching the provided arguments (else is an exception).

The last three methods, `*Match(...)` are all overloaded in order to return a subset of object instances. Some of these are "naive"; all instances are returned from the object store, and the filtering is performed within the repository. Others are designed to pass the query predicate back to the object store so that only the matching rows are returned.

Each of these options are discussed in more detail below.

### Finding by Title

The first version of finding instances is to specify the required title for the matching objects:

-   `allMatches(Class<T> ofType, String title)`

-   `firstMatch(Class<T> ofType, String title)`

-   `uniqueMatch(Class<T> ofType, String title)`

Although easy and intuitive, this isn't generally recommended for production use because (a) the matching is performed within the repository rather than the object store, and (b) the title string can often change as business requirements are refined.

That said, it is possible to eliminate the first disadvantage by using the Query API, discussed below; this provides an implementation that is equivalent to find by title.

### Finding by Pattern

The next technique of finding instances is to specify pattern object to match against (sometimes called "query-by-example", or QBE):

-   `allMatches(Class<T> ofType, Object pattern)`

-   `firstMatch(Class<T> ofType, Object pattern)`

-   `uniqueMatch(Class<T> ofType, Object pattern)`

Any non-null value of the pattern object is used as the predicate.

Although more robust that searching by title, this technique is also not likely to be valid for production code because the matching is still performed within the repository rather than within the object store.

That said, it is possible to eliminate the first disadvantage by using the `Query` API, discussed below; this provides an implementation that is equivalent to find by pattern.

> **Note**
>
> If the pattern object is created using `newTransientInstance(...)`, then
> any default values for properties will automatically be set <!--(see ?)-->.
> If this isn't required, they will need to be manually cleared.

### Finding using the Filter API

The third overloaded version of the matching methods to find instances
`all take an org.apache.isis.applib.Filter<T>` instance:

-   `allMatches(Class<T> ofType, Filter<T> filter)`

-   `firstMatch(Class<T> ofType, Filter<T> filter)`

-   `uniqueMatch(Class<T> ofType, Filter<T> filter)`

The `Filter<T>` interface is very straightforward:

    public interface Filter<T> {
        public boolean accept(T obj);
    }

Every object of the given type (and subclasses) is passed into the Filter instance; only those `accept()`'ed are returned from the `*Match()` method.

Although flexible, with this technique the matching is also performed within the repository rather than the object store, and so is also likely not to be suitable for production use where there are many instances of the given type.

### Finding using the Query API

The final overloaded version of the matching methods take an instance
of `org.apache.isis.applib.query.Query<T>` interface:

-   `allMatches(Query<T> query)`

-   `firstMatch(Query<T> query)`

-   `uniqueMatch(Query<T> query)`

Unlike all the other matching mechanisms, the point of the `Query` interface is for it to be passed back to the object store and evaluated there.

The applib provides several implementations that implement the
`Query<T>` interface. Probably the most important of these is
`QueryDefault<T>`, which provides a set of factory methods for
constructing `Query` instances that represent a named query with a map of parameter/argument pairs.

For example:

    public class CustomerRepositoryImpl implements CustomerRepository {
        public List<Customer> findCustomers(
                @Named("Last Name") String lastName,
                @Named("Postcode")  String postCode
            ) {
            QueryDefault<Customer> query = 
                QueryDefault.create(
                    Customer.class, 
                    "findCustomers", 
                    "lastName", lastName, 
                    "postCode", postCode);

            return getContainer().allMatches(query);
        }
        ...
    }

Above it was noted that the other overloaded versions of the matching API have the disadvantage that the matching is performed within the repository. As an alternative to using "find by title" or "find by pattern", you may wish to use `QueryFindByTitle` and `QueryFindByPattern`:

-   `QueryFindByTitle<T>`, which corresponds to the `allMatches(...)` for searching by title

-   `QueryFindByPattern<T>, which corresponds to the `allMatches(...)` for searching by pattern

There is also a `QueryFindAllInstances<T>`, which corresponds to the
`allInstances()` method.

The interpretation of a `Query` instance ultimately depends on the object store. All object stores will support `QueryFindAllInstances`, and most will provide a mechanism to support `QueryDefault`. Check the object store documentation to determine whether they support other `Query` implementations (ie, `QueryFindByTitle` and `QueryFindByPattern`).

