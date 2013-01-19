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

### Format of Permissions

Shiro converts permission strings (as found in `WEB-INF/shiro.ini`) internally into `WildcardPermission` instances, with allow a permissions to be organized hierarchical and with wildcarding.  

This meets Isis' requirements well; we define the permission strings as follows:

<pre>
packageName:ClassName:memberName:r,w
</pre>

where:

* `memberName` is the property, collection or action name.
* `r` indicates that the member is visible
* `w` indicates that the member is usable (editable or invokable)

Because these are wildcards, a '*' can be used at any level.  Additionally, missing levels assume wildcards.

Thus:

<pre>
com.mycompany.myapp:Customer:firstName:r,w   # view or edit customer's firstName
com.mycompany.myapp:Customer:lastName:r      # view customer's lastName only
com.mycompany.myapp:Customer:placeOrder:*    # view and invoke placeOrder action
com.mycompany.myapp:Customer:placeOrder      # ditto
com.mycompany.myapp:Customer:*:r             # view all customer class members
com.mycompany.myapp:*:*:r                    # view-only access for all classes in myapp package
com.mycompany.myapp:*:*:*                    # view/edit for all classes in myapp package
com.mycompany.myapp:*:*                      # ditto
com.mycompany.myapp:*                        # ditto
com.mycompany.myapp                          # ditto
*                                            # view/edit access to everything
</pre>

