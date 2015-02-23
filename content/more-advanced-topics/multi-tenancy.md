Title: Multi-Tenancy support (1.8.0)

## Theory

Sometimes data belonging to one population of users should not be visible to another population
of users.   This is often the case when a single application is accessed by geography: the data belonging to the
Italian users should not be accessible by French users, and vice versa.

While this could be accomplished by running multiple instances of the application, in some situations it
may be considered preferable to run a single instance of the app, and have the application itself manage the partitioned
access to data.  This is what we mean by multi-tenancy support.

Furthermore, sometimes some data should be accessible by all users; it is global data.  This is often (though not always)
read-only reference data (sometimes also called "golden data" or "standing data").  Running multiple instances of
an app would require maintaining and synchronizing multiple copies of this data, whereas running just a single instance 
eliminates such complexity.

We can consider global/local data as a (very simple) hierarchy, which then leads onto the next idea that multi-tenancy
may be hierarchical.  Thus, we could have global data, then Italian data, and then Milan (vs Rome vs Naples) data.  We
could envisage this as a graph:

<pre>
/           # ie, root === global
    italy
        milan
        rome
        naples
    france
        paris
        lyon
        nice
    sweden
        stockholm
        malmo
</pre>
        
Not only does all data belong to a particular node ("tenancy") within this graph, so is each user associated.

## Support within Isis (1.8.0)

The Isis core framework provides the infrastructure to implement multi-tenancy, while the [Isis addons security module](https://github.com/isisaddons/isis-module-security) provides a full implementation for you to use out-of-the-box or to fork and adapt as you require.

The key concept within Isis core is that, whenever rendering a domain object, the framework will check if that object
is visible to the current user.  If visibility is vetoed (for whatever reason) then the object will not be displayed.

* if the viewer was attempting to render the object on a page, an authorization exception (404 page) will be thrown.
* if the viewer was attempting to render the object within a table, that row will simply be excluded.

The Isis addons security module provides an implementation (of a [FacetFactory](../config/metamodel-finetuning-the-programming-model.html)) that
vetoes access where required.  This vetoing is based on the relationship between data and the current user.  The security module:

* defines the `ApplicationTenancy` that enumerates the available tenancies, placing them into a hierarchy.
* maps each current user to the `ApplicationUser` entity; each application user can optionally be associated with an application tenancy
* the `WithApplicationTenancy` interface can be implemented by any domain object.  If the domain object to be viewed
  implements this interface, then the security module('s FacetFactory) performs the check.
  
The following table illustrates the visibility rules:

<table class="table table-striped table-bordered table-condensed">
    <tr>
        <th>object's tenancy</th><th>user's tenancy</th><th>access</th>
    </tr>
    <tr>
        <td>null</td><td>null</td><td>editable</td>
    </tr>
    <tr>
        <td>null</td><td>non-null</td><td>editable</td>
    </tr>
    <tr>
        <td>/</td><td>/</td><td>editable</td>
    </tr>
    <tr>
        <td>/</td><td>/it</td><td>visible</td>
    </tr>
    <tr>
        <td>/</td><td>/it/car</td><td>visible</td>
    </tr>
    <tr>
        <td>/</td><td>/it/igl</td><td>visible</td>
    </tr>
    <tr>
        <td>/</td><td>/fr</td><td>visible</td>
    </tr>
    <tr>
        <td>/</td><td>null</td><td>not visible</td>
    </tr>
    <tr>
        <td>/it</td><td>/</td><td>editable</td>
    </tr>
    <tr>
        <td>/it</td><td>/it</td><td>editable</td>
    </tr>
    <tr>
        <td>/it</td><td>/it/car</td><td>visible</td>
    </tr>
    <tr>
        <td>/it</td><td>/it/igl</td><td>visible</td>
    </tr>
    <tr>
        <td>/it</td><td>/fr</td><td>not visible</td>
    </tr>
    <tr>
        <td>/it</td><td>null</td><td>not visible</td>
    </tr>
    <tr>
        <td>/it/car</td><td>/</td><td>editable</td>
    </tr>
    <tr>
        <td>/it/car</td><td>/it</td><td>editable</td>
    </tr>
    <tr>
        <td>/it/car</td><td>/it/car</td><td>editable</td>
    </tr>
    <tr>
        <td>/it/car</td><td>/it/igl</td><td>not visible</td>
    </tr>
    <tr>
        <td>/it/car</td><td>/fr</td><td>not visible</td>
    </tr>
    <tr>
        <td>/it/car</td><td>null</td><td>not visible</td>
    </tr>
</table>

To enable this requires a single configuration property to be set:

    isis.reflector.facets.include=org.isisaddons.module.security.facets.TenantedAuthorizationFacetFactory

If you have different rules, you could still leverage `ApplicationUser` and `ApplicationTenancy` but implement your rules
in your own facet factory.

