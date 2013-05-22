How to specify a name and/or description for an object
------------------------------------------------------

By default, the name (or type) of an object, as displayed to the user
will be the class name. However, if an `@Named` annotation is included,
then this will override the default name. This might be used to include
punctuation or other characters that may not be used within a class
name, or when - for whatever reason - the name of the class includes
technical artifacts (for example project-defined prefixes or suffices).
It is also useful if the required name cannot be used because it is a
keyword in the language.

By default the framework will create a plural version of the object name
by adding an 's' to singular name, or a 'ies' to names ending 'y'. For
irregular nouns or other special case, the `@Plural` annotation may be
used to specify the plural form of the name explicitly.t

The programmer may optionally also provide a `@DescribedAs` annotations,
containing a brief description of the object's purpose, from a user
perspective. The framework will make this available to the user in a
form appropriate to the user interface style - for example as a tooltip.

For example:

    @Named("Customer")
    @Plural("Customers")
    @DescribedAs("Individuals or organizations that have either "+
                 "purchased from us in the past or "+
                 "are likely to in the future")
    public class CustomerImpl implements ICustomer {
        ...
    }

> **Note**
>
> There is an entirely separate mechanism for dealing with
> Internationalisation (to document... ask on mailing list...)<!--, details of which can be found in the core
> documentation.-->

