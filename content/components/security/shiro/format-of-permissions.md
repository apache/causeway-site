Title: Format of Permissions

Shiro converts permission strings (as found in `WEB-INF/shiro.ini`) internally into `Permission` instances.

The default implementation converts these strings to `WildcardPermission` instances, which allows permissions to be organized hierarchical and with wildcarding.  

Shiro also allows the conversion to be mapped to alternative `Permission` instances; Isis provides its own `IsisPermission` which provides an extended and more flexible syntax.

## Using the Shiro Default Permission Syntax

The default syntax for permissions is:

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

## Using the Enhanced Isis Permission Syntax

Isis defines its own extended syntax for permissions, following the format:

<pre>
([!]?)([^/]+)[/](.+)
</pre>

where:

* the optional ! prefix indicates this permission is a vetoing permission
* the optional xxx/ prefix is a permission group that scopes the perm/veto perm
* the remainder of the string is the permission (possibly wildcarded, with :rw as optional suffix)

For example:

<pre>
user_role   = !reg/org.estatio.api,\
              !reg/org.estatio.webapp.services.admin,\
              reg/* ; \
api_role    = org.estatio.api ;\
admin_role = adm/*
</pre>

defines the user role as access to all permissions except those in `org.estatio.api` and `org.estatio.webapp.services.admin`.

To tell Shiro to use the Isis permission format, add the following to `shiro.ini`:

<pre>
permissionResolver = org.apache.isis.security.shiro.authorization.IsisPermissionResolver
ldapRealm.permissionResolver = $permissionResolver
</pre>
