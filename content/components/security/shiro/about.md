Title: Shiro Security

Security implementations provide authentication and authorization services. They do not providing services such as auditing, encryption, non-repudiation or confidentiality.

The shiro implementation provides integration with [Apache Shiro](http://shiro.apache.org).

### Releases

- See [release notes](release-notes/about.html).

### Default Configuration

The [quickstart archetype](../../../getting-started/quickstart-archetype.html) is configured with Shiro using the users, roles and permissions defined in the `WEB-INF/shiro.ini` file.

Shiro itself reads this file and is bootstrapped using the following settings to be added near the top of the `WEB-INF/web.xml` file:

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


<!--
### Configuring 

- [Using Apache DS for authentication](using-apache-ds-for-authentication.html)
-->
