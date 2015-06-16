Title: Settings Services using JDO

[//]: # (content copied to user-guide_reference_domain-services_settings-service)

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-settings-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-settings) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-settings) implementation is released.**
}

The JDO objectstore provides simple implementations of the two applib [Settings Services](../../../../reference/services/settings-services.html).

## Application Settings

In the case of `ApplicationSettingsService`, the service is implemented by `ApplicationSettingsServiceJdo`, with the `ApplicationSetting` interface implemented by a `ApplicationSettingsJdo` entity.

The service also provides the ability to create list all existing settings, create new settings (of whichever datatype), update settings, and to delete settings.

These actions can be hidden using security if need be.  


## User Settings

In the case of `UserSettingsService`, the service is implemented by `UserSettingsServiceJdo`, with the `UserSetting` interface implemented by a `UserSettingsJdo` entity.

As for application settings, the user settings service also provides the ability to create list all existing settings, create new settings (of whichever datatype), update settings, and to delete settings.

These actions can be hidden using security if need be.  


### Register the Services

Register the services as any other service, in `isis.properties`:

    isis.services=...,\
                  org.apache.isis.objectstore.jdo.applib.service.settings.ApplicationSettingsServiceJdo,\
                  org.apache.isis.objectstore.jdo.applib.service.settings.UserSettingsServiceJdo,\
                  ...

Assuming that you've also configured Isis to use the JDO objectstore, you should be good to go...
