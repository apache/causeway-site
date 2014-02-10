Title: @Aggregated

> **Support**
> 
> * Used by the NoSQL Object Store; currently ignored by other object stores.
> 
> * Ignored by: Wicket viewer (and indeed all other viewers).

This annotation indicates that the object is aggregated, or wholly
owned, by a root object. This information is of use by some object
stores implementations (to store the aggregated objects "inline"). At
the time of writing none of the viewers exploit this information, though
this may change in the future. (For example, the DnD viewer could be
enhanced to prevent aggregated objects from being "dragged out" from
their root object).

> **Warning**
>
> The `@Aggregated` semantics are not completely well-defined and so its use is currently discouraged.
