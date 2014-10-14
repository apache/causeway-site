Title: Settings Services

{note
In 1.6.0 this implementation was released as part of *org.apache.isis.core:isis-module-settings-jdo:1.6.0* and was also released as an [Isis addon](http://github.com/isisaddons/isis-module-settings) module.  **In 1.7.0+ only the [Isis addon](http://github.com/isisaddons/isis-module-settings) implementation is released.**
}

The `ApplicationSettingsService` and the `UserSettingsService` are two similar services that provide the ability to store either configuration settings.  With `ApplicationSettingsService` these settings have global scope; for the `UserSettingsService` the settings are stored per user.

The core applib defines only interfaces and some convenience abstract classes.  The JDO objectstore provides an [implementation](../../components/objectstores/jdo/services/settings-services-jdo.html), alternatively you could write your own implementation.

## ApplicationSettingsService

The API defined by `ApplicationSettingsService` is:

    public interface ApplicationSettingsService {
        ApplicationSetting find(@Named("Key") String key);
    }

where `ApplicationSetting` in turn is defined as:

    public interface ApplicationSetting {
    
        String getKey();
    
        SettingType getType();
        String getDescription();
    
        String getValueRaw();
    
        String valueAsString();
        LocalDate valueAsLocalDate();
        Integer valueAsInt();
        Long valueAsLong();
        Boolean valueAsBoolean();
    }

The intention is for implementations to store only the value of each setting as a raw string (`getValueRaw()`), however for callers the API has typesafe methods `valueAsXxx()`; calling the wrong method will throw an exception.  The `getType()` property indicates the datatype of each setting. 

## UserSettingsService

The API defined by `UserSettingsService` is:

    public interface UserSettingsService {
        UserSetting find(@Named("User") String user, @Named("Key") String key);
    }

where `UserSetting` in turn is defined as:

    public interface ApplicationSetting {
    
        String getUser();
        String getKey();
    
        SettingType getType();
        String getDescription();
    
        String getValueRaw();
    
        String valueAsString();
        LocalDate valueAsLocalDate();
        Integer valueAsInt();
        Long valueAsLong();
        Boolean valueAsBoolean();
    }

This is typesafe following the same pattern as `ApplicationSetting`, discussed above.

