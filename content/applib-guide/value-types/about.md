Value Types
===========

The state of any given entity is characterized by properties <!--(?)--> and
collections <!--(?)-->. A collections is a one-to-many reference to another
entities, while a property is either a one-to-one reference to another
entity, or it is a value.

But what's a value? Well, it's an atomic piece of state. A string is a
value, so is a number, so is a date. Values should be designed to be
immutable (though some system value types, such as java.util.Date,
famously are not).

*Isis* supports all the standard JDK value types, and defines a number
of its own (eg Percentage and Color).   *Isis* also allows you to define 
your own value types, such as `LastName`, or `Celsius`, or `ComplexNumber`.

It's also possible to make Isis integrate with third-party
value types.  *Isis* provides one such integration, with 
[JodaTime](http://joda-time.sourceforge.net/).

For more information, see:

* [Built-in Value Types](./010-Built-in-Value-Types.html)

* [Custom Value Types](./020-Custom-Value-Types.html)

* [Third-party Value Types](./030-Third-party-Value-Types.html)

> **Note**
>
> *Isis*' support for a particular value type does not necessarily imply
> that there is a custom widget for that type in a particular viewer.
> Rather, it means that the state of the object can be serialized, is
> expected to have equal-by-content semantics, and is expected to be
> immutable. It may also be parseable from a string.


> Also, if using the JDO/DataNucleus ObjectStore, you may also need to perform additional DataNucleus-specific configuration if you want the data to be persisted in a SQL datatype other than SQL Blob (ie a serializable byte array).






