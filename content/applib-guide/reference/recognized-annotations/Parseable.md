@Parseable
----------

> **Support**
> 
> * Not supported by: Wicket viewer (which uses Wicket's Converter API instead).

Parseability means being able to parse a string representation into an
object by way of the `org.apache.isis.applib.adapters.Parser` interface.
Generally this only applies to value types, where the `@Value` annotation
<!--(see ?)--> implies encodability through the `ValueSemanticsProvider`
interface <!--(see ?)-->.

For these reasons the `@Parser` annotation is generally never applied
directly, but can be thought of as a placeholder for future enhancements
whereby non-value types might also have be able to be parsed. 

> **Note**
> 
> The `@AutoComplete` also allows objects to be looked up from a string represention.
