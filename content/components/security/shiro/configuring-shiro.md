Title: Configuring Shiro

### Quickstart

The [quickstart archetype](../../../getting-started/quickstart-archetype.html) is configured with Shiro using the users, roles and permissions defined in the `WEB-INF/shiro.ini` file.

### Bootstrapping Shiro

Shiro is bootstrapped using the following settings to be added near the top of the `WEB-INF/web.xml` file:

<pre>
&lt;listener&gt;
    &lt;listener-class&gt;org.apache.shiro.web.env.EnvironmentLoaderListener&lt;/listener-class&gt;
&lt;/listener&gt;

&lt;filter&gt;
    &lt;filter-name&gt;ShiroFilter&lt;/filter-name&gt;
    &lt;filter-class&gt;org.apache.shiro.web.servlet.ShiroFilter&lt;/filter-class&gt;
&lt;/filter&gt;

&lt;filter-mapping&gt;
    &lt;filter-name&gt;ShiroFilter&lt;/filter-name&gt;
    &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
&lt;/filter-mapping&gt;
</pre>

Shiro will then read `WEB-INF/shiro.ini` file to configure its Realm definitions for authentication and authorization.
