Title: Using JNDI Datasource (1.2.0-SNAPSHOT)

Isis' JDO objectstore can be configured either to connect to the database using its own connection pool, or by using a container-managed datasource.

#### Application managed connections

Using a connection pool managed directly by the application (that is, by Isis' JDO objectstore and ultimately by DataNucleus) requires a single set of configuration properties to be specified.

In the `WEB-INF\persistor_datanucleus.properties` file, specify the connection driver, url, username and password.

For example:

<pre>
isis.persistor.datanucleus.impl.javax.jdo.option.ConnectionDriverName=net.sf.log4jdbc.DriverSpy
isis.persistor.datanucleus.impl.javax.jdo.option.ConnectionURL=jdbc:log4jdbc:hsqldb:mem:test
isis.persistor.datanucleus.impl.javax.jdo.option.ConnectionUserName=sa
isis.persistor.datanucleus.impl.javax.jdo.option.ConnectionPassword=
</pre>

{note
Those configuration properties that start with the prefix `isis.persistor.datanucleus.impl.` are passed through directly to DataNucleus (with the prefix removed).
}

#### Container managed (JNDI) datasource

Using a datasource managed by the servlet container requires three separate bits of configuration.

Firstly, specify the name of the datasource in the `WEB-INF\persistor_datanucleus.properties` file.  For example:

<pre>
isis.persistor.datanucleus.impl.datanucleus.ConnectionFactoryName=java:comp/env/jdbc/quickstart
</pre>

{note
If connection pool settings are also present in this file, they will simply be ignored.  Any other configuration properties that start with the prefix `isis.persistor.datanucleus.impl.` are passed through directly to DataNucleus (with the prefix removed).
}

Secondly, in the `WEB-INF/web.xml`, declare the resource reference:

<pre>
&lt;resource-ref&gt;
    &lt;description&gt;db&lt;/description&gt;
    &lt;res-ref-name&gt;jdbc/quickstart&lt;/res-ref-name&gt;
    &lt;res-type&gt;javax.sql.DataSource&lt;/res-type&gt;
    &lt;res-auth&gt;Container&lt;/res-auth&gt;
&lt;/resource-ref&gt;
</pre>

Finally, declare the datasource as required by the servlet container.  For example, if using Tomcat 7, the datasource can be specified by adding the following to `$TOMCAT_HOME/conf/context.xml`:

<pre>
&lt;Resource name="jdbc/quickstart" 
  auth="Container" 
  type="javax.sql.DataSource" 
  maxActive="100" 
  maxIdle="30" 
  maxWait="10000" 
  username="sa"
  password="p4ssword" 
  driverClassName="com.microsoft.sqlserver.jdbc.SQLServerDriver"
  url="jdbc:sqlserver://127.0.0.1:1433;instance=.;databaseName=quickstart"/&gt;
</pre>

You will also need to make sure that the JDBC driver is on the servlet container's classpath.  For Tomcat, this means copying the driver to `$TOMCAT_HOME/lib`.

{note
According to Tomcat's documentation, it is supposedly possible to copy the `conf/context.xml` to the name of the webapp, eg `conf/mywebapp.xml`, and scope the connection to that webapp only.  I was unable to get this working, however.
}
