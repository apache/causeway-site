Title: Migrating from v1.7.0 to 1.8.0

Existing projects written against v1.7.0 should run against v1.8.0 without any changes.  In particular (unlike 1.6.0 and
 1.7.0) there should be no need to update `pom.xml` files of existing projects.  If you *do* encounter any difficulties
then let us know via the [users mailing list](../../support.html), so we can support you and document issues here.

That said, many of the existing annotations have been deprecated in 1.8.0, replaced with a simplified and rationalized
 set of annotations; see [here](../../reference/recognized-annotations/about.html).  To help you migrate your application
 over to the new annotations, there is a new configuration property that can be set in `isis.properties`:

    isis.reflector.validator.allowDeprecated=false

If this flag is present and set to false, then metamodel validation errors will be thrown on startup if any deprecated
annotations are encountered.  These can be viewed either in the console or by browsing to the app (an error page will
be displayed).
