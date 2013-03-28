Title: Bookmark Service

The `BookmarkService` provides the ability to obtain a serializable `org.apache.isis.applib.bookmarks.Bookmark` for any (persisted) domain object, and to lookup domain objects given a `Bookmark`.

The API defined by `BookmarkService` is:

<pre>
  @Named("Bookmarks")
  public interface BookmarkService {

    @NotInServiceMenu
    Object lookup(BookmarkHolder bookmarkHolder);

    @Hidden
    Object lookup(Bookmark bookmark);

    @Hidden
    Bookmark bookmarkFor(Object domainObject);
  }
</pre>

If a domain class implements the `org.apache.isis.applib.bookmarks.BookmarkHolder` interface then the `BookmarkService` will appear as a contributed action.  Otherwise the service is hidden from view, intended to be injected into domain objects as a supporting domain service.


### Register the Service

An implementation of this service is provided by Isis core.  Register this service like any other service, in `isis.properties`:

<pre>
isis.services=<i>...other services...</i>,\
              org.apache.isis.core.metamodel.services.bookmarks.BookmarkServiceDefault,\
              ...
</pre>
