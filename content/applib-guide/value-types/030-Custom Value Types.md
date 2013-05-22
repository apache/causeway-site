Custom Value Types
------------------

In addition to the built-in value types it is also possible to define user-defined value types. This is typically done using the `@Value` annotation.

The `@Value` annotation is used to provide an implementation of the `org.apache.isis.applib.adapters.ValueSemanticsProvider` interface. In turn this provides objects that allow the framework to interact with the value, specifically:

-   the `EncoderDecoder` is used to convert the value into and back out of serializable form

    This is used by some object stores (eg the XML Object Store), for by the XML Snapshot capability <!--(see ?)-->;

-   the `Parser` is used to convert Strings into the value type

    This is used as a fallback by viewers that do not have any specific widgets to support the particular value type, and make do with a simple text field instead.

    An obvious example is to parse a date. But it could be used to parse "TRUE" and "FALSE" into a boolean (as opposed to using a checkbox).

-   the `DefaultsProvider` is used to provide a meaningful default for the value

    Not every value type will have a default, but some do (eg false for a boolean, 0 for a number). This is used as the default value for non-`@Optional` properties and parameters.

Each of these interfaces also reside in `org.apache.isis.applib.adapters`.

For more details, explore the built-in types within the applib, for example `org.apache.isis.applib.value.Money`.

    @Value(semanticsProviderName =  "org.apache.isis.core.progmodel.facets.value.MoneyValueSemanticsProvider")
    public class Money extends Magnitude {
        ...
    }

where `MoneyValueSemanticsProvider` is the implementation of
`ValueSemanticsProvider` described above.

> **Note**
>
> Using value types generally removes the need for using `@MustSatisfy` annotation <!--(see ?)-->; the rules can 
> instead move down into a `validate()` method on the value type itself.
