Title: Autocreating Schema Objects (1.9.0-SNAPSHOT)

> this is a stub


    public static final String CLASS_METADATA_LOADED_LISTENER_KEY = "classMetadataLoadedListener";
    static final String CLASS_METADATA_LOADED_LISTENER_DEFAULT = CreateSchemaFromClassMetadata.class.getName();


Implement



org.datanucleus.metadata.MetaDataListener:

    public interface MetaDataListener {
        void loaded(AbstractClassMetaData cmd);
    }


Optionally implement `org.apache.isis.objectstore.jdo.datanucleus.PersistenceManagerFactoryAware`

public interface PersistenceManagerFactoryAware {

    public void setPersistenceManagerFactory(final PersistenceManagerFactory persistenceManagerFactory);
}


Default implementation is:
