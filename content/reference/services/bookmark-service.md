Title: Bookmark Service

[//]: # (content copied to _user-guide_xxx)

The `BookmarkService` provides the ability to obtain a serializable `org.apache.isis.applib.bookmarks.Bookmark` for any (persisted) domain object, and to lookup domain objects given a `Bookmark`.

This is a good way of storing a reference to an arbitrary object (a polymorphic relationship).  The downside is that there is no way for the objectstore (eg JDO objectstore) to enforce any kind of referental integrity.


## API

The API defined by `BookmarkService` is:

    public interface BookmarkService {

        @NotInServiceMenu
        Object lookup(BookmarkHolder bookmarkHolder);

        @Programmatic
        Object lookup(Bookmark bookmark);

        @Programmatic
        <T> T lookup(Bookmark bookmark, Class<T> requiredType);

        @Programmatic
        Bookmark bookmarkFor(Object domainObject);

        @Programmatic
        Bookmark bookmarkFor(Class<?> cls, String identifier);
    }

If a domain class implements the `org.apache.isis.applib.bookmarks.BookmarkHolder` interface then the `BookmarkService` will appear as a contributed action.  Otherwise the service is hidden from view, intended to be injected into domain objects as a supporting domain service.


## Usage within the framework

Bookmarks are used by the [BackgroundCommandService](./background-service.html), which uses a bookmark to capture the target object on which an action will be invoked subsequently.

Bookmarks are also used by the [PublishingService](./publishing-service.html) and the [AuditingService](./auditing-service.html).


## Implementations

The core framework provides a default implementation of this API:

* `org.apache.isis.core.metamodel.services.bookmarks.BookmarkServiceDefault`


## Register the Service

The `BookmarkServiceDefault` is automatically registered with the framework (it is annotated with `@DomainService`) so there is no need to explicitly register the service.

