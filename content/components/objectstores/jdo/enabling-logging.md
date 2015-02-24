Title: Enabling Logging

Sometimes you just need to see what is going on.  There are various ways in which logging can be enabled, here are some ideas.

### In Apache Isis

Modify `WEB-INF/logging.properties` (a log4j config file)

### In DataNucleus

As per the [DN logging page](http://www.datanucleus.org/products/accessplatform/logging.html)

### In the JDBC Driver

Configure log4jdbc JDBC rather than the vanilla driver (see `WEB-INF/persistor_datanucleus.properties`) and configure log4j logging (see `WEB-INF/logging.properties`).

There are examples of both in the [simpleapp archetype](../../../intro/getting-started/simpleapp-archetype.html).

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