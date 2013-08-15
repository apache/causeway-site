Title: Shiro Realm Mappings

When configuring role based permission mapping, there can only be one of these entries per realm:

    realm.groupToRolesMappings = ...

and

    realm.roleToPermissionsMappings = ...

This forces you to put everything on one line for each of the above.

This is, unfortunately, a Shiro "feature".  The only solution to this is to use '\' to separate the mappings onto separate lines in the file so that it is at least maintainable. 

Use this technique for both group to roles mapping and role to permission mapping. If you use the '\' after the "," that separates the key:value pairs it is more readable.

If you repeat the entries above then it's "last one wins".



> **Note** you can't use a [roles] section because that triggers Shiro to use the simple "INI" realm and not your defined realm (in most cases you are going to use an LDAP realm in an enterprise environment and the "simple" realm in Shiro isn't much use beyond prototyping work).