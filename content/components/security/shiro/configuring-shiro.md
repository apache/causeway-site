Title: Configuring Isis to use Shiro

### Example Configuration

The [simple archetype](../../../getting-started/quickstart-archetype.html) and the [quickstart archetype](../../../getting-started/simple-archetype.html) are both configured with Shiro; you should see all the configuration explained below in these.


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

Isis itself supports multiple authentication/authorization mechanisms.  To tell it to use shiro, update the `WEB-INF/isis.properties` file:

    isis.authentication=shiro
    isis.authorization=shiro


This then installs Isis components (specifically, the `ShiroAuthenticatorOrAuthorizor` class) that use Shiro's APIs to perform authentication and authorization.


## Knowing your way around the Shiro config files

The `shiro.ini` file as configured in the [simple archetype](../../../getting-started/simple-archetype.html) is configured to simple use the built-in `$iniRealm`, by way of the line:

    securityManager.realms = $iniRealm

The file also (by way of example) include entries to setup an ldapRealm, but this is not wired in.  For more information on LDAP, see [here](./using-ldap.html).

Specifying `$iniRealm` means that the usernames/passwords, roles and permissions are read from the `shiro.ini` file itself.

* the users/passwords and their roles from the `[users]` sections;  
* the roles are mapped to permissions in the `[roles]` section.

The permission format is:

    packageName:className:memberName:r,w

and is discussed in more detail [here](./format-of-permissions.html)

The `shiro.ini` file as configured in the [quickstart archetype](../../../getting-started/quickstart-archetype.html) is a little more complex.  Here there are two text-based realms defined, `realm1` and `realm2`.  The `resourcePath` for these realms is in the form:

    realm1.resourcePath=classpath:webapp/realm1.ini

that is, the `src/main/resources/webapp/realm1.ini` file in the webapp project.

The security manager for the app only references these two realms:

    securityManager.realms = $realm1,$realm2

meaning that the `[users]` and `[roles]` sections of `shiro.ini` are unused.  Instead, you'll find these sections in both `realm1.ini` and `realm2.ini` (because both are coincidentally implementations of the same `org.apache.shiro.realm.text.IniRealm` class

## What the user/roles translate to

> as of 1.4.0-SNAPSHOT; see [ISIS-656](https://issues.apache.org/jira/browse/ISIS-656).

In your domain objects you can find the users/roles for the current user using:

    final UserMemento user = container.getUser();
    final List<RoleMemento> roles = user.getRoles();
    for (RoleMemento role : roles) {
        String roleName = role.getName();
        ...
    }

The role `name` property encodes both the realm that provided the role, and the role identity itself.

For example, in the quickstart/todo app, if logging in as `dick` with the following entries for `realm1`:

    dick = pass, user_role, analysis_role, self-install_role

then this corresponds to the roles *realm1:user_role*, *realm1:self-install_role* and *realm1:analysis_role*.  If using the Wicket viewer, then there will also be another role which is used internally (namely *org.apache.isis.viewer.wicket.roles.USER*).
