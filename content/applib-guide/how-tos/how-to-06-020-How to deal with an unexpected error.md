How to deal with an unexpected error
------------------------------------

An alternative to calling `DomainObjectContainer#raiseError()` <!--(see ?)-->
is to simply throw an `org.apache.isis.applib.ApplicationException`. Which
you use is a matter of style, because the behaviour is exactly the same; internally `raiseError()` just throws the `ApplicationException`.
