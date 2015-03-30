Title: Scimpi viewer

{note
This component has been retired.  The source is in mothballed/component/viewer/dnd.
}

The scimpi module provides a webapp viewer that out-of-the-box provides a similar interface to that provided by the [HTML viewer](../html/about.html).

However, unlike the HTML viewer it allows the user interface to be extensively customized.

### Customization

Scimpi works by searching for a specific page to render the domain object, eg `Customer.shtml` to render a `Customer` object. If none is found, it always falls back to a generic page, which can render any object.

Customization therefore is accomplished by providing a specific page. The elements of this page can be any of the tags that Scimpi understands.

### Releases

- See [release notes](release-notes/about.html).
