How to specify that an object should not be persisted
-----------------------------------------------------

Non-persisted objects are intended to be used as view models; they aggregate some state with respect to a certain process. This may be read-only (eg a projection of certain informaiton) or read-write (eg a wizard-like process object). Either way, the viewer is expected to interpret this by not providing any sort of automatic "save" menu item if such an object is returned to the GUI.

Non-persisted objects that are read-only are typically also marked as immutable <!--(see ?)-->.

To indicate that an object cannot be persisted, use the
`@NotPersistable` annotation.

