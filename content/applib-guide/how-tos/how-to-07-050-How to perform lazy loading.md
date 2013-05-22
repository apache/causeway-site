How to perform lazy loading 
---------------------------

> This is generally done automatically.

The `DomainObjectContainer` provides the `resolve()` method in order to lazily resolve the value of a property or a collection.

In earlier versions of the framework it was necessary to call this method prior to accessing or mutating any property or collection. This is no longer required because *Apache Isis* uses bytecode enhancement to automatically call this method.  This is done either by Isis itself, or (in the case of the JDO ObjectStore), done by the objectstore enhancement process.

It is not possible to disabled bytecode enhancement if using the JDO Objectstore.  While it is possible to disable Isis' bytecode enhancement using
`isis.properties` file, this is not generally recommended. Only if Isis' bytecode enhancement has been disabled and the JDO ObjectStore is not being used would there be a requirement to call the `resolve()` method manually.

