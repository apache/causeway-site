Title: Value Types

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

> **Note**
>
> *Isis*' support for a particular value type does not necessarily imply
> that there is a custom widget for that type in a particular viewer.
> Rather, it means that the state of the object can be serialized, is
> expected to have equal-by-content semantics, and is expected to be
> immutable. It may also be parseable from a string.


> Also, if using the JDO/DataNucleus ObjectStore, you may also need to perform additional DataNucleus-specific configuration if you want the data to be persisted in a SQL datatype other than SQL Blob (ie a serializable byte array).


## Built-in value types

The following are the value types supported by *Isis* out-of-the-box.

### JDK Types

The following JDK types are supported by *Isis*.

#### Primitive Types

All the primitive types may be used as values: `byte`, `short`, `int`, `long`, `float`, `double`, `char`, and `boolean`.

#### Wrapper Types

The wrapper types for each of the primitives can also be used as value types: `java.lang.Byte`, `java.lang.Short`, `java.lang.Integer`, `java.lang.Long`, `java.lang.Float`, `java.lang.Double`, `java.lang.Character`, `java.lang.Boolean`.

#### Java Classes

The following java classes have value semantics and may be used as value types:

-   `java.lang.String`

-   `java.math.BigInteger` and `java.math.BigDecimal`

-   `java.util.Date` (date and time), `java.sql.Date` (date only), and `java.sql.Time` (time only)

-   `java.sql.Timestamp`

-   `java.awt.Image`

#### JODA

The following [Joda](http://joda-time.sourceforge.net/) types are also supported:

-   `org.joda.time.LocalDate`

-   `org.joda.time.LocalDateTime`

-   `org.joda.time.DateTime`


#### Isis AppLib

*Isis* itself also provides a number of its own value types. These are
all in the `org.apache.applib.value` package:

-   `Blob` : binary large object (eg image), also includes metadata about the data (specifically the filename and mime type)

-   `Clob` : character large objects (eg XML file), also includes metadata about the data (specifically the filename and mime type)

-   `Color`

-   `Date` (date only), `DateTime` (date and time) and `Time` (time only)

-   `TimeStamp`

-   `Image`

-   `Money`

-   `Password`

-   `Percentage`


## Custom value types

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


## Third-party value types

Third party value types can also supported, again
through the use of a `ValueSemanticsProvider`. However, since the source code cannot be altered, the provider must be supplied using a key value in `isis.properties` configuration file.

For example, the following would register a semantics provider for `org.jodatime.time.Interval` (not a built-in at the time of this writing):

      isis.core.progmodel.value.org.jodatime.time.DateTime.semanticsProviderName=\
        com.mycompany.values.JodaIntervalValueSemanticsProvider







## Value formats

> **note** this feature is only partially support by some viewers (eg Wicket viewer)

*Isis* provides default formats for the inbuilt value types, according
to type. These can be modified using `isis.properties`.

These formats cut across the above categories; for example the byte
format relates to both byte (primitive) and java.lang.Byte (wrapper). In
all cases this setting can be overriden for a specific field using the
@Mask annotation (see ?).

#### Byte format

The format for all bytes can be set, replacing the default format
derived from the system, using the following property to specify a mask:

    isis.value.format.byte=####

The mask is used to set up a java.text.DecimalFormat formatting object
so details of the mask format can be found in the Java documentation.

#### Date Format

The format for all dates can be set, replacing the default format derived from the system, using the following property to specify one of *long*, *medium*, *short*, *isolong*, *isoshort* or a mask:

    isis.value.format.date=dd/MM/yy

When a mask is specified it is used to set up a
`java.text.SimpleDateFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Date/time Format

The format for all date/time values can be set, replacing the default format derived from the system, using the following property to specify one of *long*, *medium*, *short*, *isolong*, *isoshort* or a mask:

    isis.value.format.datetime=dd/MM/yy

When a mask is specified it is used to set up a
`java.text.SimpleDateFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Decimal format

The format for `BigDecimal` values can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.decimal=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Double format

The format for all double values can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.double=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Float format

The format for all float values can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.float=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Integer format

The format for all integers (including `BigInteger`) can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.int=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Long format

The format for all long values can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.long=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Short format

The format for all short values can be set, replacing the default format derived from the system, using the following property to specify a mask:

    isis.value.format.short=####

The mask is used to set up a `java.text.DecimalFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Time Format

The format for all time values can be set, replacing the default format derived from the system, using the following property to specify one of *long*, *medium*, *short*, *isolong*, *isoshort* or a mask:

    isis.value.format.time=ddMMyyyy hhmm

When a mask is specified it is used to set up a
`java.text.SimpleDateFormat` formatting object so details of the mask format can be found in the Java documentation.

#### Timestamp Format

The format for time stamp values can be set, replacing the default format derived from the system, using the following property to specify one of *long*, *medium*, *short*, *isolong*, *isoshort* or a mask:

    isis.value.format.timestamp=hh:mm

When a mask is specified it is used to set up a
`java.text.SimpleDateFormat` formatting object so details of the mask format can be found in the Java documentation.

