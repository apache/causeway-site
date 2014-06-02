Title: Disabling Persistence by Reachability

JDO/DataNucleus supports the concept of [persistence-by-reachability](http://www.datanucleus.org/products/datanucleus/jdo/orm/cascading.html).  That is, if
a non-persistent entity is associated with an already-persistent entity, then DataNucleus will detect this and will automatically persist the associated object.

Put another way: there is no need to call Isis' `DomainObjectContainer#persist(.)` or `DomainObjectContainer#persistIfNotAlready(.)` methods.

However, convenient though this feature is, you may find that it causes performance issues.

One scenario in particular where this performance issues can arise is if your entities implement the `java.lang.Comparable` interface, and you have used Isis' [ObjectContracts](../../../reference/Utility.html) utility.  The issue here is that `ObjectContracts` implementation can cause DataNucleus to recursively rehydrate a larger number of associated entities.  (More detail below).

To disable persistence-by-reachability, add the following to `persistor_datanucleus.properties`:

    #
    # Require explicit persistence (since entities are Comparable and using ObjectContracts#compareTo).
    #
    isis.persistor.datanucleus.impl.datanucleus.persistenceByReachabilityAtCommit=false

This change has been made to the [simple](../../../intro/getting-started/simple-archetype.html) and [quickstart](../../../intro/getting-started/quickstart-archetype.html) archetypes (1.5.0-snapshot).


#### Explanation of the issue in more detail

Consider the entities:

    Party <->* AgreementRole <*-> Agreement

In the course of a transaction, the `Agreement` entity is loaded into memory (not necessarily modified), and then new `AgreementRole`s are associated to it.

All these entities implement `Comparable` using `ObjectContracts`, and the implementation of AgreementRole's (simplified) is:

    public class AgreementRole {
        ...
        public int compareTo(AgreementRole other) {
            return ObjectContracts.compareTo(this, other, "agreement, startDate, party");
        }
        ...
    }

while Agreement's is implemented as:

    public class Agreement {
        ...
        public int compareTo(Agreement other) {
            return ObjectContracts.compareTo(this, other, "reference");
        }
        ...
    }

and Party's is similarly implemented as: 

    public class Party {
        ...
        public int compareTo(Party other) {
            return ObjectContracts.compareTo(this, other, "reference");
        }
        ...
    }

    
DataNucleus's persistence-by-reachability algorithm adds the `AgreementRole`s into a `SortedSet`, which causes `AgreementRole#compareTo()` to fire:
* the evaluation of the "agreement" property delegates back to the `Agreement`, whose own `Agreement#compareTo()` uses the scalar `reference` property.  As the `Agreement` is already in-memory, this does not trigger any further database queries
* the evaluation of the "startDate" property is just a scalar
* the evaluation of the "party" property delegates back to the `Party`, whose own `Party#compareTo()` requires the uses the scalar `reference` property.  However, since the `Party` is not yet in-memory, using the `reference` property triggers a database query to "rehydrate" the `Party` instance.

In other words, in figuring out whether `AgreementRole` requires the persistence-by-reachability algorithm to run, it causes the adjacent associated entity `Party` to also be retrieved.





, in order to compare  evaluating a property that references another entity, causes any rehydration of that associate entity.  
, which 



Sometimes you just need to see what is going on.  There are various ways in which logging can be enabled, here are some ideas.

### In Apache Isis

Modify `WEB-INF/logging.properties` (a log4j config file)

### In DataNucleus

As per the [DN logging page](http://www.datanucleus.org/products/accessplatform/logging.html)

### In the JDBC Driver

Configure log4jdbc JDBC rather than the vanilla driver (see `WEB-INF/persistor_datanucleus.properties`) and configure log4j logging (see `WEB-INF/logging.properties`).

There are examples of both in the quickstart archetype.

### In the Database

#### HSQLDB Logging

Add `;sqllog=3` to the end of the JDBC URL.

#### PostgreSQL Logging

In `postgresql\9.2\data\postgresql.conf`:

<pre>
log_statement = 'all'
</pre>

Will then log to `postgresql\9.2\data\pg_log` directory.

Note that you must restart the service for this to be picked up.

#### MS SQL Server Logging

Use the excellent SQL Profiler tool.