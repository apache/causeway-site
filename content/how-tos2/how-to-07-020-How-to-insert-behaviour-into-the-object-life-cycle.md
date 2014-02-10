How to insert behaviour into the object life cycle
--------------------------------------------------

*Apache Isis* is responsible for managing the object lifecycle,
persisting, updating or removing objects from the persistent object
store as required. For many applications the domain objects are unaware
of this. If required, though, an object can provide callback methods
(all optional) so that the framework can notify it of its persistence
state.

For example, the `persisted()` method is called after an object has been
persisted. This could be used to setup a reverse association that should
only be created once the new object has been persisted.

The full list of callbacks is shown below.

* `created()`

   * following the logical creation of the object 
   (that is, after `newTransientInstance()` has been called)

* `loading()`
 
   * when a persistent object is about to be loaded into memory

*  `loaded()`
   * once the persistent object has just been loaded into memory

* `persisting()` or `saving()`

   * just before a transient object is first persisted.

* `persisted()` or `saved()`

   * just after a transient object is first persisted.

* `updating()`

   * after any property on a persistent object has been changed and just before this change is persisted

* `updated()`

   * after a changed property on a persistent object has been persisted

* `removing()` or `deleting()`

   * when a persistent object is just about to be deleted from the persistent object store.

* `removed()` or `deleted()`

   * when a persistent object has just been deleted from the persistent object store.


