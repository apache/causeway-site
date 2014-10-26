Title: Configuration Files

Isis has one mandatory configuration file, `isis.properties`.  For the webapp viewers, this typically lives alongside the `web.xml` file in the `WEB-INF` directory.

In addition, Isis will also read from a number of supplementary configuration files (if present), for each of the configured components.  For example:

* if the JDO (DataNucleus) objectstore (aka persistor) is configured, then Isis will search for `persistor_datanucleus.properties`.  Isis will also read from `persistor.properties`
* if the Shiro authentication has been configured, it will search for `authentication_shiro.properties`.  Isis will also read from `authentication.properties`.

This approach allows configuration to be partitioned by component.  

> It is also possible to externalize all configuration files so that they reside outside of `WEB-INF` directory; this is discussed [here](./externalized-configuration.html).

## Specifying Components

A running Isis instance requires a persistor (aka objectstore), an authentication mechanism, and an authorization mechanism.  It also requires some sort of viewer or viewers.

The objectstore, authentication and authorization are specified in the `isis.properties` file.  For example, this is the configuration of the [simple](../intro/getting-started/simple-archetype.html) archetype:

    isis.persistor=datanucleus
    isis.authentication=shiro
    isis.authorization=shiro

The available values are registered in [installer-registry.properties](https://raw.githubusercontent.com/apache/isis/master/core/runtime/src/main/resources/org/apache/isis/core/runtime/installer-registry.properties); alternatively the fully qualified class name can be specified.  In either case the appropriate component must also (of course) be added as a dependency to the `pom.xml` files.  

The viewer is *not* specified in the `isis.properties` file; rather it is implied by the configuration of `WEB-INF/web.xml` file.  The archetypes are a good point of reference for the required servlet context listeners and servlets; every viewer has its own requirements.

## Componentized configuration Files by component

As noted in the introduction, the configuration can optionally be broken out by component and also component implementation.  

This is also supported for the configured viewer(s).  However, because the configured viewer(s) is/are not listed in `isis.properties`, an additional hint is required in the `web.xml` file to tell Isis which viewers are in use.

For example, to specify that the Wicket viewer and Restful Objects viewers are configured, specify:

    <context-param>
        <param-name>isis.viewers</param-name>
        <param-value>wicket,restfulobjects</param-value>
    </context-param>

The table below summarizes the additional configuration files that are searched for the most commonly configured components:
    
<table class="table table-striped table-bordered table-condensed">
<tr>
    <th>Component type</th>
    <th>Component implementation</th>
    <th>Additional configuration files</th>
</tr>
<tr>
    <td>Object Store</td>
    <td>JDO (DataNucleus)</td>
    <td>persistor_datanucleus.properties<br/>
persistor.properties</td>
</tr>
<tr>
    <td>Authentication</td>
    <td>Shiro</td>
    <td>authentication_shiro.properties<br/>
authentication.properties</td>
</tr>
<tr>
    <td>Authorization</td>
    <td>Shiro</td>
    <td>authorization_shiro.properties<br/>
authorization.properties</td>
</tr>
<tr>
    <td>Viewer</td>
    <td>Wicket</td>
    <td>viewer_wicket.properties<br/>
viewer.properties</td>
</tr>
<tr>
    <td>Viewer</td>
    <td>Restful Objects</td>
    <td>viewer_restfulobjects.properties<br/>
viewer.properties</td>
</tr>
</table>
