Title: Recreating the Applib Documentation




### Prerequisites

Apache Isis currently use the JIMI jar to generate documentation. Previously this file was hosted at Sun's [Jimi page](http://java.sun.com/products/jimi/), however since Oracle's acquisition the download is somewhat more difficult to locate.

Once you have downloaded the file (`jimi_1.0.jar`), unzip it and locate in turn the `JimiProClasses.zip` file.  This is the JAR that needs to be installed. Make a note of its location.

To install into your local Maven repository, use:

<pre>
mvn install:install-file       \
    -D groupId=com.java        \
    -D artifactId=jimi         \
    -D version=1.0             \
    -D packaging=jar           \
    -D file=/path/to/JimiProClasses.zip
</pre>

### Generate documentation

In the following instructions:

* `$SITE` represents the directory where the [site's `trunk` directory](https://svn.apache.org/repos/asf/isis/site/trunk) has been checked out to.
* `$CODE` represents the directory where the [Isis codebase](https://git.apache.org/repos/asf/isis.git) has been cloned to.


To generate the documentation:
<pre>
cd $CODE/core/applib
mvn clean docbkx:generate-html docbkx:generate-pdf
</pre>

Copy over to the site:
<pre>
cp target/docbkx/html/guide/isis-applib.html $SITE/content/core/guides/.
cp target/docbkx/pdf/isis-applib.pdf         $SITE/content/core/guides/.
</pre>

<!--
<pre>
cd $SITE/core/applib/docs
touch nowfile
cp -R $CODE/core/applib/target/... .
</pre>

Check any new files into the site:
<pre>
svn add `svn st | grep ^? | awk '{print $2}'`
</pre>


Remove files that haven't been updated

<pre>
ls -lrt `find . -type f -not -newer nowfile` >/tmp/x
for a in `cat /tmp/x`; do
    svn info $a >/dev/null 2>&1
    if [ $? == 0 ]; then
        svn delete $a
    fi
done
</pre>

<pre>
rm nowfile
</pre>
-->