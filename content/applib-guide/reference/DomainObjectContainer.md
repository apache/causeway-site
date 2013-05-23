DomainObjectContainer interface
===============================

> Provides a single point of contact from domain objects into the
> *Apache Isis* framework.

The `DomainObjectContainer` interface provides a single point of contact
from domain objects into the *Isis* framework. It can also be used as a
lightweight general purpose repository during prototyping.

<table>
<tr>
    <th>Category</th>
    <th>Method</th>
    <th>Description</th>
</tr>
<tr>
    <td>Object creation</td>
    <td>newTransientInstance(Class\<T\>)</td>
    <td>Creates new non-persisted object</td>
</tr>
<tr>
    <td></td>
    <td>newPersistentInstance(Class\<T\>)</td>
    <td>Creates new object, will be persisted at end of action</td>
</tr>
<tr>
    <td></td>
    <td>newInstance(Class\<T\>, Object)</td>
    <td>Creates object in state persistence state as that provided</td>
</tr>
<tr>
    <td>Validation</td>
    <td>isValid(Object)</td>
    <td>whether object is valid</td>
</tr>
<tr>
    <td></td>
    <td>validate(Object)</td>
    <td>reason why object is invalid (if any)</td>
</tr>
<tr>
    <td>Generic Repository</td>
    <td>allInstances(Class\<T\>)</td>
    <td>All persisted instances of specified type</td>
</tr>
<tr>
    <td></td>
    <td>allMatches(Class\<T\>, Filter\<T\>)</td>
    <td>All persistenced instances of specified type matching filter</td>
</tr>
<tr>
    <td></td>
    <td>allMatches(Class\<T\>, String)</td>
    <td>All persisted instances with the specified string as their title</td>
</tr>
<tr>
    <td></td>
    <td>allMatches(Class\<T\>, Object)</td>
    <td>All persisted instances matching object (query-by-example)</td>
</tr>
<tr>
    <td></td>
    <td>allMatches(Query\<T\>)</td>
    <td>All instances satisfying the provided query</td>
</tr>
<tr>
    <td></td>
    <td>firstMatch(...)</td>
    <td>As for allMatches(...), but returning first instance</td>
</tr>
<tr>
    <td></td>
    <td>uniqueMatch(...)</td>
    <td>As for firstMatch(...), but requiring there to be only one match</td>
</tr>
<tr>
    <td>Object persistence</td>
    <td>isPersistent(Object)</td>
    <td>whether object is persistent</td>
</tr>
<tr>
    <td></td>
    <td>persist(Object)</td>
    <td>persist the transient object</td>
</tr>
<tr>
    <td></td>
    <td>persistIfNotAlready(Object)</td>
    <td>persist the object (provided is not already persisted)</td>
</tr>
<tr>
    <td></td>
    <td>remove(Object)</td>
    <td>remove the persisted object</td>
</tr>
<tr>
    <td></td>
    <td>removeIfNotAlready(Object)</td>
    <td>remove the object (provided is not already transient)</td>
</tr>
<tr>
    <td>Presentation</td>
    <td>titleOf(Object)</td>
    <td>Returns the title of the object.</td>
</tr>
<tr>
    <td>Messages and warnings</td>
    <td>informUser(String)</td>
    <td>Inform the user</td>
</tr>
<tr>
    <td></td>
    <td>warnUser(String)</td>
    <td>Warn the user about a situation, requiring acknowledgement.</td>
</tr>
<tr>
    <td></td>
    <td>raiseError(String)</td>
    <td>Notify user of a serious application error, typically requiring further action on behalf of the user</td>
</tr>
<tr>
    <td>Security</td>
    <td>getUser()</td>
    <td>The currently-logged on user</td>
</tr>
<tr>
    <td>Properties</td>
    <td>getProperty(String)</td>
    <td>Value of configuration property</td>
</tr>
<tr>
    <td></td>
    <td>getPropertyNames()</td>
    <td>All configuration properties available</td>
</tr>
<tr>
    <td>Lazy loading, dirty object tracking (\*)</td>
    <td>resolve(Object)</td>
    <td>Lazy load object (overloaded to optionally load a property of object)</td>
</tr>
<tr>
    <td></td>
    <td>objectChanged(Object)</td>
    <td>Mark object as dirty</td>
</tr>
<tr>
    <td>Object store control (\*\*)</td>
    <td>flush()</td>
    <td>Flush all pending changes to object store</td>
</tr>
<tr>
    <td></td>
    <td>commit()</td>
    <td>Commit all pending changes to object store</td>
</tr>
</table>


> **Note**
>
> (\*) generally not necessary to call - performed by bytecode proxies
> (\*\*) the use of these methods is discouraged - they are typically used only for tests
