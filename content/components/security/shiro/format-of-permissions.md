Title: Format of Permissions

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

