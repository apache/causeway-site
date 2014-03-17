Title: Externalized Configuration

As described [here](./configuration-files.html), Isis itself bootstraps from the (mandatory) `isis.properties` configuration files and also (optional) component-specific configuration files (such as `persistor_datanucleus.properties` or `viewer_wicket.properties`).

By default these are read from the `WEB-INF` directory.  Having this configuration "baked into" the application is okay in a development environment, but when the app needs to be deployed to a test or production environment, this configuration should be read from an external location.

There are in fact three frameworks involved here, all of which need to be pointed to this external location:

* Apache Isis itself

  which as already discussed reads `isis.properties` and optional component-specific config files.

* [Apache Shiro](http://shiro.apache.org) (if using the Isis' [Shiro integration](../components/security/shiro/about.html) for authentication and/or authorization
  
  which reads the `shiro.ini` file (and may read other files referenced from that file)  

* [Apache log4j 1.2](http://logging.apache.org/log4j/1.2), for logging

  which reads `logging.properties` file
  
Each of these frameworks has its own way of externalizing its configuration.

## <a name="isis">Externalizing Isis' Configuration</a>

To tell Isis to load configuration from an external directory, specify the `isis.config.dir` context parameter.  

If the external configuration directory is fixed for all environments (systest, UAT, prod etc), then you can specify within the `web.xml` itself:

    <context-param>
        <param-name>isis.config.dir</param-name>
        <param-value>location of external config directory</param-value>
    </context-param>

If however the configuration directory varies by environment, then the context parameter will be specified to each installation of your servlet container.  Most (if not all) servlet containers will provide a means to define context parameters through proprietary config files.

For example, if using Tomcat 7.0, you would typically copy the empty `$TOMCAT_HOME/webapps/conf/context.xml` to a file specific to the webapp, for example `$TOMCAT_HOME/webapps/conf/todo.xml`.  The context parameter would then be specified by adding the following:

    <Parameter name="isis.config.dir"
               value="/usr/local/tomcat/myapp/conf/"
               override="true"/>

For more detail, see the Tomcat documentation on [defining a context](http://tomcat.apache.org/tomcat-7.0-doc/config/context.html#Defining_a_context) and on [context parameters](http://tomcat.apache.org/tomcat-7.0-doc/config/context.html#Context_Parameters).
     
## <a name="shiro">Externalizing Shiro's Configuration</a>

If using Isis' [Shiro integration](../components/security/shiro/about.html) for authentication and/or authorization, note that it reads from the `shiro.ini` configuration file.  By default this also resides in `WEB-INF`.

Similar to Isis, Shiro lets this configuration directory be altered, by specifying the `shiroConfigLocations` context parameter.

You can therefore override the default location using the same technique as described above for Isis' `isis.config.dir` context parameter.  For example:

    <Parameter name="shiroConfigLocations" 
               value="file:/usr/local/myapp/conf/shiro.ini" 
               override="true" />

> Note that Shiro is more flexible than Isis; it will accepts any URL, not only a filesystem directory. 


## <a name="log4j">Externalizing Log4j's Configuration</a>

By default Isis configures log4j to read the `logging.properties` file in the `WEB-INF` directory.  This can be overridden by setting the `log4j.properties` system property to the URL of the log4j properties file.

For example, if deploying to Tomcat7, this amounts to adding the following to the `CATALINA_OPTS` flags:

    export CATALINA_OPTS="-Dlog4j.configuration=-Dlog4j.configuration=/usr/local/tomcat/myapp/conf/logging.properties"

Further details an be found in the [log4j documentation](https://logging.apache.org/log4j/1.2/manual.html#Example_Configurations).

> `CATALINA_OPTS` was called `TOMCAT_OPTS` in earlier versions of Tomcat.

## See also

See [JVM args](./suggested-jvm-args.html) for other JVM args and system properties that you might want to consider setting.
