Built-in Value Types
--------------------

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
all in the org.apache.applib.value package:

-   Color

-   Date (date only), DateTime (date and time) and Time (time only)

-   TimeStamp

-   Image

-   Money

-   Password

-   Percentage

### Value formats

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
