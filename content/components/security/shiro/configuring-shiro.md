Title: Configuring Isis to use Shiro

### Example Configuration

The [simpleapp archetype](../../../intro/getting-started/simpleapp-archetype.html) is configured with Shiro; you should see all the configuration explained below in these.


## Bootstrapping Shiro

The Shiro environment (in essence, thread-locals holding the security credentials) is bootstrapped using the following settings to be added near the top of the `WEB-INF/web.xml` file:

    <listener>
        <listener-class>org.apache.shiro.web.env.EnvironmentLoaderListener</listener-class>
    </listener>
    
    <filter>
        <filter-name>ShiroFilter</filter-name>
        <filter-class>org.apache.shiro.web.servlet.ShiroFilter</filter-class>
    </filter>
    
    <filter-mapping>
        <filter-name>ShiroFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

Shiro will then read `WEB-INF/shiro.ini` file to configure its Realm definitions for authentication and authorization.


## Telling Isis to use Shiro for authentication and authorization
w
Isis itself supports multiple authentication/authorization mechanisms.  To tell it to use shiro, update the `WEB-INF/isis.properties` file:

    isis.authentication=shiro
    isis.authorization=shiro


This then installs Isis components (specifically, the `ShiroAuthenticatorOrAuthorizor` class) that use Shiro's APIs to perform authentication and authorization.


## Knowing your way around the Shiro config files

The `shiro.ini` file as configured in the [simple archetype](../../../intro/getting-started/simple-archetype.html) is configured to simple use the built-in `$iniRealm`, by way of the line:

    securityManager.realms = $iniRealm

The file also (by way of example) include entries to setup an ldapRealm, but this is not wired in.  For more information on LDAP, see [here](./using-ldap.html).

Specifying `$iniRealm` means that the usernames/passwords, roles and permissions are read from the `shiro.ini` file itself.

* the users/passwords and their roles from the `[users]` sections;  
* the roles are mapped to permissions in the `[roles]` section.

#### Users section

The `[users]` section lists users, passwords and their roles.  For example:

<pre>
sven = pass, admin_role
dick = pass, user_role, analysis_role, self-install_role
bob  = pass, user_role, self-install_role
</pre>

#### Roles section

The `roles` section lists roles and their corresponding permissions.  For example:

<pre>
user_role = *:ToDoItems:*:*,\
            *:ToDoItem:*:*,\
            *:ToDoAppDashboard:*:*
analysis_role = *:ToDoItemAnalysis:*:*,\
            *:ToDoItemsByCategoryViewModel:*:*,\
            *:ToDoItemsByDateRangeViewModel:*:*
self-install_role = *:ToDoItemsFixturesService:install:*
admin_role = *
</pre>

#### Permissions format

The permission format is configurable.  The default format is:

    packageName:className:memberName:r,w

where each of the parts of the permission string can be wildcarded using `*`.

See [here](./format-of-permissions.html) for further discussion.

## Multiple Realms

A more sophisticated approach is to use external realms.  For example, to configure two text-based realms defined, `realm1` and `realm2`, we would define a `resourcePath` for each, in the form:

    realm1.resourcePath=classpath:webapp/realm1.ini

that is, the `src/main/resources/webapp/realm1.ini` file in the webapp project.

The security manager for the app would then be told to use these two realms:

    securityManager.realms = $realm1,$realm2

The the `[users]` and `[roles]` sections of `shiro.ini` would then be unused.  Instead, you'll find these sections in both `realm1.ini` and `realm2.ini` (because both are coincidentally implementations of the same `org.apache.shiro.realm.text.IniRealm` class).

## What the user/roles translate to

In your domain objects you can find the users/roles for the current user using:

    final UserMemento user = container.getUser();
    final List<RoleMemento> roles = user.getRoles();
    for (RoleMemento role : roles) {
        String roleName = role.getName();
        ...
    }

The role `name` property encodes both the realm that provided the role, and the role identity itself.

For example, in the simpleapp, if logging in as `dick` with the following entries for `realm1`:

    dick = pass, user_role, analysis_role, self-install_role

then this corresponds to the roles *realm1:user_role*, *realm1:self-install_role* and *realm1:analysis_role*.  If using the Wicket viewer, then there will also be another role which is used internally (namely *org.apache.isis.viewer.wicket.roles.USER*).

## Configuring Shiro for JDBC

Something like the following should do:

    builtInCacheManager = org.apache.shiro.cache.MemoryConstrainedCacheManager
    securityManager.cacheManager = $builtInCacheManager

    ps = org.apache.shiro.authc.credential.DefaultPasswordService
    pm = org.apache.shiro.authc.credential.PasswordMatcher
    pm.passwordService = $ps

    aa = org.apache.shiro.authc.credential.AllowAllCredentialsMatcher
    sm = org.apache.shiro.authc.credential.SimpleCredentialsMatcher

    jdbcRealm=org.apache.shiro.realm.jdbc.JdbcRealm
    jdbcRealm.authenticationQuery = SELECT password from users where username = ?
    jdbcRealm.userRolesQuery = select r.label from users_roles ur inner join roles r on ur.role_id = r.id where user_id = (select id from users where username = ?);
    jdbcRealm.permissionsQuery=select p.permission from roles_permissions rp inner join permissions p on rp.permission_id = p.id where rp.role_id = (select id from roles where label = ?);
    jdbcRealm.permissionsLookupEnabled=true

    ds = com.mysql.jdbc.jdbc2.optional.MysqlDataSource
    ds ...etc
    securityManager.realms = $jdbcRealm

## Configuring Shiro to use the Security Isis Addons

The Isisaddons [security module](https://github.com/isisaddons/isis-module-security) (not ASF) provides a complete
security subdomain for users, roles, permissions; all persisted as JDO domain objects.  It also includes a Shiro realm
integration.

See the module's README for details of how to configure an existing app to use this module.  Or, look at the the
Isisaddons [todoapp example](https://github.com/isisaddons/isis-app-todoapp) (not ASF), which is preconfigured to use
the security module.
