Third-party Value Types
-----------------------

Third party value types can also supported, again
through the use of a `ValueSemanticsProvider`. However, since the source code cannot be altered, the provider must be supplied using a key value in `isis.properties` configuration file.

For example, the following would register a semantics provider for `org.jodatime.time.Interval` (not a built-in at the time of this writing):

      isis.core.progmodel.value.org.jodatime.time.DateTime.semanticsProviderName=\
        com.mycompany.values.JodaIntervalValueSemanticsProvider

