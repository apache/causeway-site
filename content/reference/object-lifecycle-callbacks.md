Object lifecycle callbacks
--------------------------

Isis supports a number of callback methods corresponding to the persistence lifecycle of the object.

They are:
 
<table>
<tr>
    <th>Method</th>
    <th>Called?</th>
    <th>Notes</th>
</tr>
<tr>
    <td><tt>created()</tt></td>
    <td>After the object has been instantiated with <tt>DomainObjectContainer#newTransientInstance()</tt></td>
    <td></td>
</tr>
<tr>
    <td><tt>persisting()</tt></td>
    <td>Before the object is persisted for the first time (INSERTed) into the object store</td>
    <td><tt>saving()</tt> is also supported, but is deprecated</td>
</tr>
<tr>
    <td><tt>persisted()</tt></td>
    <td>After the object has been persisted for the first time (INSERTed) into the object store</td>
    <td><tt>saved()</tt> is also supported, but is deprecated</td>
</tr>
<tr>
    <td><tt>loading()</tt></td>
    <td>Before the object is retrieved (resolved) from the object store</td>
    <td></td>
</tr>
<tr>
    <td><tt>loaded()</tt></td>
    <td>After the object is retrieved (resolved) from the object store</td>
    <td></td>
</tr>
<tr>
    <td><tt>updating()</tt></td>
    <td>Before the changed object is flushed (UPDATEd) to the object store</td>
    <td></td>
</tr>
<tr>
    <td><tt>updated()</tt></td>
    <td>After the changed object is flushed (UPDATEd) to the object store</td>
    <td></td>
</tr>
<tr>
    <td><tt>removing()</tt></td>
    <td>Before a removed object (through <tt>DomainObjectContainer#remove()</tt>) is removed (DELETEd) from the object store</td>
    <td><tt>deleting()</tt> is also supported, but is deprecated</td>
</tr>
<tr>
    <td><tt>removed()</tt></td>
    <td>After a removed object has been removed (DELETEd) from the object store</td>
    <td><tt>deleted()</tt> is also supported, but is deprecated</td>
</tr>
</table>

