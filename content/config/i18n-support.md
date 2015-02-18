Title: Internationalization (i18n) support (1.8.0-SNAPSHOT)

As of 1.8.0-SNAPSHOT (ISIS-903), Isis' support for i18n has been re-implemented
to use GNU [gettext](https://www.gnu.org/software/gettext/manual/index.html) `.pot` and `.po` 
files.  The implementation does <i>not</i> however use any GNU software (to
simplify the toolchain/developer experience, and because GNU software is usually
GPL, incompatible with the Apache license).

## Rationale

The gnutext `.pot` and `.po` files are intended to be used as follows:

* the `.pot` (portable object template) file holds the message text to be translated
* this file is translated into multiple `.po` (portable object) files, one per supported locale
* these `.po` files are renamed according to their locale, and placed into the 'appropriate' location to be picked up by the runtime.

The format  of the `.pot` and `.po` files is identical; the only difference is that 
the `.po` file has translations for each of the message strings.  In Isis' implementation,
if the translation is missing then the original message text will be returned.  What that
means in practice is that the `.pot` file can be copied to a `.po` file and used as is.
(In fact, if there is no translation available then Isis' implementation will 
return the original text, so it isn't even necessary for there to be any `.po` files).

There are a couple of advantages of using `.po` files rather than the more Java's own `ResourceBundle` API:

* the `.po` message format is such that any given message text to translate need only be translated once, even if it appears in multiple places in the application (eg "Name")
* the `.po` message format includes translations for (optional) plural form as well as singular form
* there are lots of freely available editors [to be found](https://www.google.co.uk/search?q=.po+file+editor), many summarized on this [Drupal.org](https://www.drupal.org/node/11131) webpage

Perhaps most usefully, there are also online communities/platforms of translators to assist with translating files.  One such is [crowdin](https://crowdin.com/) (nb: this link does not imply endorsement).

## Service API and Implementation

The cornerstone of Isis' support for i18n is the `TranslationService` service.  This is defined in the applib with the following API:

    public interface TranslationService {

        public String translate(final String context, final String text);
        public String translate(final String context, final String singularText, final String pluralText, int num);

        public enum Mode {
            READ,
            WRITE;
        }
        Mode getMode();
    }

where:

* `translate(...)` : is an overloaded method to return either the singular/regular or plural form of the text
* `getMode()` : indicates whether the translation service is in read or write mode.

If the service is running in the normal read mode, then it simply proides translations for the locale of the current user.  If however the service is configured to run in write mode, then it records the fact that the message was requested to be translated (a little like a spy/mock in unit testing mock), and returns the original message.  The service can then be queried to discover which messages need to be translated.

### `TranslationServicePo` (implementation)

Isis provides a default implementation of `TranslationService`, namely `TranslationServicePo`.  When in read mode this service locates the appropriate  `.po` file (based on the requesting user's locale), finds the translation and returns it.  When in write mode however it will write all translations into a `.pot` file.

To make the service as convenient as possible to use, the service configures itself as follows:

* if running in prototype mode or during integration tests, then the service runs in *write* mode, in which it records all translations.  The `.pot` file is written out when the system is shutdown.
* if running in server (production) mode, then the service runs in *read* mode.  It is also possible to set a configuration setting in `isis.properties` to force read mode even if running in prototype mode (useful to manually test/demo the translations).

When running in write mode the original text is returned to the caller untranslated.  If in read mode, then the translated `.po` files are read and translations provided as required.


## Translating validation and other (imperative) messages

The `TranslationService` it is used internally by Isis when building up the metamodel; the name and description of every class, property, collection, action and action parameter is automatically translated.  Thus the simple act of bootstrapping Isis will cause most of the messages requiring translation (that is: those for the Isis metamodel) to be captured by the `TranslationService`. 

However, for an application to be fully internationalized, any validation messages (from either `disableXxx()` or `validateXxx()` supporting methods) and also possibly an object's title (from the `title()` method) will also require translation.  Moreover, these messages must be captured in the `.pot` file such that they can be translated.

### `TranslatableString`

The first part of the puzzle is tackled by an extension to Isis' programming model.  Whereas previously the `disableXxx()` / `validateXxx()` / `title()` methods could only return a `java.lang.String`, they may now optionally return a `TranslatableString` (defined in Isis applib) instead.

Here's a (silly) example from the [simpleapp](../intro/getting-started/simpleapp-archetype.html):

    public TranslatableString validateUpdateName(final String name) {
        return name.contains("!")? TranslatableString.tr("Exclamation mark is not allowed"): null;
    }

This corresponds to the following entry in the `.pot` file:

    #: dom.simple.SimpleObject#updateName()
    msgid "Exclamation mark is not allowed"
    msgstr ""

The full API of `TranslatableString` is modelled on the design of GNU gettext (in particular the [gettext-commons](https://code.google.com/p/gettext-commons/wiki/Tutorial) library):

    public final class TranslatableString {

        public static TranslatableString tr(
                final String pattern,
                final Object... paramArgs) { ... }

        public static TranslatableString trn(
                final String singularPattern,
                final String pluralPattern,
                final int number,
                final Object... paramArgs) { ... }

        public String translate(
                final TranslationService translationService, 
                final String context) { ... }
    }

where:

* `tr(...)` : returns a translatable string with a single pattern for both singular and plural forms.
* `trn(...)` : returns a translatable string with different patterns for singular and plural forms; the one to use is determined by the 'number' argument
* `translate(...)`:  translates the string using the provided `TranslationService`, using the appropriate singular/regular or plural form, and interpolating any arguments.

The interpolation uses the format `{xxx}`, where the placeholder can occur multiple times.  

For example:

    final TranslatableString ts = TranslatableString.tr(
        "My name is {lastName}, {firstName} {lastName}.",
        "lastName", "Bond", "firstName", "James");

would interpolate (for the English locale) as "My name is Bond, James Bond".   

For a German user, on the other hand, if the translation in the corresponding `.po` file was:

    #: xxx.yyy.Whatever#context()
    msgid "My name is {lastName}, {firstName} {lastName}."
    msgstr "Iche heisse {firstName} {lastName}."

then the translation would be: "Ich heisse James Bond".

### Integration Testing

So much for the API; but as noted, it is also necessary to ensure that the required translations are recorded (by the `TranslationService`) into the `.pot` file.  

For this, we recommend that you ensure that all such methods are tested through *an integration test* (not unit test).  For example, here's the corresponding integration test for the "Exclamation mark" example from the simpleapp (above):

    @Rule
    public ExpectedException expectedException = ExpectedException.none();

    @Inject
    FixtureScripts fixtureScripts;

    @Test
    public void failsValidation() throws Exception {
        // given
        RecreateSimpleObjects fs = new RecreateSimpleObjects().setNumber(1);
        fixtureScripts.runFixtureScript(fs, null);
        SimpleObject simpleObjectWrapped = wrap(fs.getSimpleObjects().get(0));

        // expect
        expectedExceptions.expect(InvalidException.class);
        expectedExceptions.expectMessage("Exclamation mark is not allowed");

        // when
        simpleObjectWrapped.updateName("new name!");
    }

Running this test will result in the framework calling the `validateUpdateName(...)` method, and thus to record the required translation.

When the integration tests are complete (that is, when Isis is shutdown), the `TranslationServicePo` will write out all captured translations to its log (more on this below).  This will include all the translations captured from the Isis metamodel, along with all translations as exercised by the integration tests.

To ensure your app is fully internationalized app, you must therefore:

* use `TranslatableString` rather than `String` for all validation/disable and title methods.
* ensure that (at a minimum) all validation messages and title methods are integration tested.

Indeed, we make no apologies: one of the reasons that we decided to implement Isis' i18n support in this way is because it encourages/requires the app to be properly tested.


## Configuration

There are several different aspects of the translation service that can be configured.

### Logging

To configure the `TranslationServicePo` to write to out the `translations.pot` file, add the following to the *integtests* `logging.properties` file:

    log4j.appender.translations-po=org.apache.log4j.FileAppender
    log4j.appender.translations-po.File=./translations.pot
    log4j.appender.translations-po.Append=false
    log4j.appender.translations-po.layout=org.apache.log4j.PatternLayout
    log4j.appender.translations-po.layout.ConversionPattern=%m%n

    log4j.logger.org.apache.isis.core.runtime.services.i18n.po.PoWriter=INFO,translations-po
    log4j.additivity.org.apache.isis.core.runtime.services.i18n.po.PotWriter=false

Just to repeat, this is *not* the `WEB-INF/logging.properties` file, it should instead be added to the `integtests/logging.properties` file.

### Location of the `.po` files

The default location of the translated `.po` files is in the `WEB-INF` directory.  These are named and searched for similarly to regular Java resource bundles.

For example, assuming these translations:

    /WEB-INF/translations_en-US.po    
    /WEB-INF/translations_en.po
    /WEB-INF/translations_fr-FR.po
    /WEB-INF/translations.po

then:

* a user with `en-US` locale will use `translations_en-US.po`
* a user with `en-GB` locale will use `translations_en.po`
* a user with `fr-FR` locale will use `translations_fr-FR.po`
* a user with `fr-CA` locale will use `translations.po`

The basename for translation files is always `translations`; this cannot be altered.
    
### Externalized translation files

Normally Isis configuration files are read from the `WEB-INF` file.  However, Isis can be configured to read config files from an [external directory](../reference/externalized-configuration.html); this is also supported for translations.

Thus, if in `web.xml` the external configuration directory has been set:

    <context-param>
        <param-name>isis.config.dir</param-name>
        <param-value>location of external config directory</param-value>
    </context-param>

Then this directory will be used as the base for searching for translations (rather than the default 'WEB-INF/' directory).

### Force read mode

As noted above, if running in prototype mode then `TranslationServicePo` will be in write mode, if in production mode then will be in read mode.  To force read mode (ie use translations) even if in prototype mode, add the following configuration property to `isis.properties`:

    isis.services.translation.po.mode=read

## Supporting services

The `TranslationServicePo` has a number of supporting/related services.

### `LocaleProvider`

The `LocaleProvider` API is used by the `TranslationServicePo` implementation to obtain the locale of the "current user".  

A default implementation is provided by the Wicket viewer.  Note that this default implementation does not support requests made through the Restful Objects viewer (there is no Wicket 'application' object available); the upshot is that requests through Restful Objects are never translated.  Registering a different implementation of `LocaleProvider` that taps into appropriate REST (RestEasy?) APIs would be the way to address this.

### `TranslationsResolver`

The `TranslationResolver` is used by the `TranslationService` implementation to lookup translations for a specified locale.  It is this service that reads from the `WEB-INF/` (or externalized directory).  Again, an alternative implementation of this service could be registered if required.

### `TranslationServicePoMenu`

The `TranslationServicePoMenu` provides a couple of menu actions in the UI (prototype mode only) that interacts with the underlying `TranslationServicePo`:

* the `downloadTranslationsFile()` action - available only in write mode - allows the current `.pot` file to be downloaded.  Note however that while this will contain all the translations from the metamodel, it will not necessarily contain all translations for all imperative methods returning `TranslatableString` instances.

* the `clearTranslationsCache()` action - available only in read mode - will clear the cache so that new translations can be loaded.  This allows a translator to edit the appropriate `translations-xx-XX.po` file and check the translation is correct without having to restart the app.



## Using ResourceBundles (no-op in 1.8.0-SNAPSHOT)

> This earlier i18n implementation only honoured the locale of the server, not of the user making the request.

Use the following settings in `isis.properties` to provide localized names and  descriptions for object members.

<pre>
isis.reflector.facet-decorators=org.apache.isis.core.metamodel.facetdecorator.i18n.resourcebundle.I18nDecoratorUsingResourceBundleInstaller
</pre>
