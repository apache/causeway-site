@ObjectType
-----------

The `@ObjectType` annotation is used to provide a unique abbreviation for
the object's class name. This is used internally to generate a string
representation of an objects identity (the `Oid`).

For example:

    @ObjectType("ORD")
    public class Order {

        ...
    }

If no `@ObjectType` annotation is present, then the framework uses the
fully-qualified class name.

If an `@ObjectType` is not unique, then the framework will fail to boot.
