Title: Configuration Files

Isis has one mandatory configuration file, `isis.properties`.  For the webapp viewers, this typically lives alongside the `web.xml` file in the `WEB-INF` directory.  If necessary, though, it can be configured to live outside this directory; this is discussed later on in this article.

In addition to the `isis.properties` file, Isis will also read from a number of supplementary configuration files.  For example:

* if the JDO (DataNucleus) objectstore is configured, then Isis will search for `persistor_datanucleus.proeprties`.

* Or, if the Shiro authentication has been configured, it will search for `authentication_shiro.properties`.

This approach allows configuration to be partitioned by component.  To restate though, this is not mandatory: you can just use `isis.properties` for all configuration if you wish.

### Specifying Components

A running Isis instance requires a persistor (aka objectstore), the authentication mechanism, the authorization mechanism, and a user profile store.  It also requires some sort of viewer or viewers.

The persistor, authentication, authorization and profilestore are specified in the `isis.properties` file.  For example, this is the configuration of the [Wicket/Restful/JDO archetype](../getting-started/quickstart-archetype.html):

<pre>
isis.persistor=datanucleus
isis.authentication=shiro
isis.authorization=shiro
isis.user-profile-store=in-memory
</pre>

The available values are registered in [installer-registry.properties](https://raw.github.com/apache/isis/master/core/runtime/src/main/resources/org/apache/isis/core/runtime/installer-registry.properties); alternatively the fully qualified class name can be specified.  In either case the appropriate component must also (of course) be added as a dependency to the `pom.xml` files.  

The viewer is *not* specified in the `isis.properties` file; rather it is implied by the configuration of `WEB-INF/web.xml` file.  The archetypes are a good point of reference for the required servlet context listeners and servlets; every viewer has its own requirements.

Some of the viewers have their own configuration properties.  These can also be moved out into their supplementary config files, provided that an additional entry is made in the `web.xml` file.  For example, to specify that the Wicket viewer and Restful Objects viewer config files should be read, add the following:

<pre>
&lt;context-param&gt;
    &lt;param-name&gt;isis.viewers&lt;/param-name&gt;
    &lt;param-value&gt;wicket,restfulobjects&lt;/param-value&gt;
&lt;/context-param&gt;
</pre>

This will cause Isis to search and read for `viewer_wicket.properties` and `viewer_restfulobjects.properties`.

(Note: this is only supported for the Wicket viewer for 1.2.0 on, see [ISIS-342](https://issues.apache.org/jira/browse/ISIS-342))

### Specifying an external configuration directory

As noted above, by default Isis will look for configuration files in the `WEB-INF` directory.  If you wish to vary the configuration by environment (eg systest vs production), then this can be altered by specifying the `isis.config.dir` context parameter.

If the external configuration directory will change from one environment to another, then specify the context parameter according to the documentation of your chosen servlet container.  For example, if using Tomcat 7.0, the context parameter can be specified by adding the following to the parameter:

<pre>
&lt;Parameter name="isis.config.dir" value="/usr/local/tomcat/conf/"
         override="true"/&gt;
</pre>

For more detail see the [Tomcat documentation](http://tomcat.apache.org/tomcat-7.0-doc/config/context.html#Context_Parameters).
     
If the external configuration directory is fixed for all environments, then you can specify within the `web.xml` itself:

<pre>
&lt;context-param&gt;
    &lt;param-name&gt;isis.config.dir&lt;/param-name&gt;
    &lt;param-value&gt;location of external config directory&lt;/param-value&gt;
&lt;/context-param&gt;
</pre>



###Shiro

If using Shiro authentication and/or authorization, note that it reads from the `shiro.ini` configuration file.  By default this also resides in `WEB-INF`.

Similar to Isis, Shiro lets this configuration directory be altered, by specifying the `shiroConfigLocations` context parameter.

You can therefore override the default location using the same technique as described above for Isis' `isis.config.dir` context parameter.




