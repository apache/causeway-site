Title: Release Process

{stub
This page is a work-in-progress.
}

Before starting off the release process it is essential to gain consensus on the isis-dev mailing list that this is the right time for a release and to agree its content. Allow at least a week for this discussion.

Once agreed, the formal release can begin.  The steps are:

- create a branch to prepare the release
- use `mvn release:prepare` to generate the signed artifacts and create a tag in the source code control system
- use `mvn release:perform` to upload the signed artifacts to the Apache staging repository
- vote on the staged artifacts (in particular, the signed source release ZIP from which the remaining artifacts are derivable)
- on a successful vote:
  - promote the staged artifacts
  - merge in the branch back to into trunk
- on a failed vote:
  - drop the staging repository
  - delete the branch and tag
  - fix the problems and go round round the loop again.

Before any of this can happen, there are a number of prerequisites, in terms of (a) the codebase itself, (b) the community process, and (c) the contributor acting as release manager and performing the release.

## Code Prerequisites

Before making any formal release, there are a number of prerequisites that should always be checked

### Update Dependency Versions

First, check (via [http://search.maven.org](http://search.maven.org)) whether there is a newer version of the Apache parent `org.apache:apache`. If so, update the `<parent>` element in Isis' own parent POM `org.apache.isis:isis`.

Second, use the Maven versions plugin can be used to determine if there are newer versions of any of Isis' dependencies:

<pre>
mvn versions:display-dependency-updates
</pre>

Update any of the dependencies that are out-of-date.

### Sanity check

Next, perform a quick sanity check:

- builds ok

  `mvn clean install -o`

- site builds ok

  `sh msdf.sh -o`

- archetype is ok

  - archetype runs ok

     `-D archetypeCatalog=local`

  - app generated from the archetype runs ok

### Fix Line Endings

All Isis code should be saved with UNIX line endings; for contributors that use Windows, the `dos2unix` command should be used to convert line endings.

{note
When we move to git, this issue should be mitigated by git's default handling.
}

In addition, the `svn:eol-style` property should be set to `native` and the `svn:mime-type` property should be set appropriately, as per this [Apache guidance](http://www.apache.org/dev/version-control.html#https-svn-config).

{note
The move to git will need to reproduce this guidance somehow...
}

Both line endings and Subversion properties can be set by running the provided script:

<pre>
./fix-lineendings-and-svnprops.sh
</pre>

### Code Cleanup / Formatting

Make sure that all source code has been cleaned up and formatted according to the Apache Isis and ASF conventions.  Full details are in [Isis coding conventions](coding-conventions.html).

## License Notice (`RAT` tool)

The Apache Release Audit Tool `RAT` (from the [Apache Creadur](http://creadur.apache.org) project) is designed to perform a number of basic checks, most significant being missing copyright header files.

The Isis parent `pom.xml`specifies the RAT Maven plugin, with the following custom exclusions:

<table>
<tr><th>Subtype</th><th>File path(s)</th><th>Description</th></tr>
<tr><td>IDE-specific</td><td>**/.project, **/.classpath, **/.settings</td><td>Eclipse project files</td></tr>
<tr><td>&nbsp;</td><td>**/*.launch</td><td>Eclipse launch configuration files</td></tr>
<tr><td>&nbsp;</td><td>**/*.java.jsp</td><td>Structure101 project file</td></tr>
<tr><td>&nbsp;</td><td>**/*.ucd, **/*.ucls</td><td>Soyatec UML plugin project files</td></tr>
<tr><td>Image formats</td><td>**/*.svg</td><td>Scalable Vector Graphics</td></tr>
<tr><td>&nbsp;</td><td>**/*.pdn</td><td>Paint.NET format</td></tr>
<tr><td>Data files</td>**/*.json<td></td><td>JSON (test) data</td></tr>
<tr><td>&nbsp;</td><td>**/isis.log</td>Isis' log file (byproduct of tests)<td></td></tr>
<tr><td>&nbsp;</td><td>**/rat.txt</td><td>RAT's own audit file</td></tr>
<tr><td>&nbsp;</td><td>**/fixture-data</td><td>SQL Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/test.data</td><td>SQL Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/xml/**/*.xml</td><td>XML Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>tmp/tests/*.xml</td><td>XML Object Store fixture data</td></tr>
<tr><td>&nbsp;</td><td>tmp/ldap-conf/**</td><td>LDAP Security fixture data</td></tr>
<tr><td>&nbsp;</td><td>**/src/main/resources/resources.txt</td><td>Resource file</td></tr>
<tr><td>Archetype support</td><td></td><td></td></tr>
<tr><td>&nbsp;</td><td>**/src/main/appended-resources/, supplemental-models.xml</td><td>(Empty) supplemental models</td></tr>
<tr><td>Program formats</td><td>**/*.min.js</td><td>Minified Javascript (note that the non-Minified Javascript equivalents is checked for its license)</td></tr>
</table>

In addition, a number of additional licenses are configured:

<table>
<tr><th>License</th><th>Description</th></tr>
<tr><td>Apache 2.0</td><td>The RAT tool searches for an older version of the Apache license header. This additional license reconfigures RAT to use the current form of words</td></tr>
<tr><td>MIT</td><td>JQuery (bundled with Isis) is dual licensed under MIT</td></tr>
<tr>Isis bundles up source code fom the still-to-be-released JMock 2.6-RC2 codebase<td></td><td></td></tr>
<tr><td>DocBook</td><td>Like many other Apache projects, Isis generates its documentation in DocBook form. In order to speed up generation, Isis has a local copy of the DocBook DTDs, Entities etc. Key phrases from these files are configured so that RAT identifies these files as valid to use.</td></tr>
<tr><td>XHTML</td><td>Isis also has a dependency on the XHTML-strict DTD</td></tr>
</table>

To run the RAT tool, first clean up any generated artifacts:

<pre>
mvn clean -P integration-tests
</pre>

Then, run the tool using:

<pre>
mvn org.apache.rat:apache-rat-plugin:check
</pre>

{note
Do *not* use `mvn rat:check`; depending on your local Maven configuratoin this may bring down the obsolete mvn-rat-plugin from Codehaus repo.
}

All being well the command should succeed.  If it does not, then review the `rat.txt` file in the failing module's `target` directory.  Missing license notes are indicated using the key:

- `!???` identifies those files that are missing license notes
- `tests-common/*` and `tests/*` ignores certain test files
- `hsql-db` are generated HSQLDB directories

Investigate and fix any reported violations.

You can use the groovy script `addmissinglicenses.groovy` to automatically insert missing headers:

<pre>
groovy addmissinglicenses.groovy
</pre>

The actual files checked are those with extensions specified in the line:

<pre>
def fileEndings = [".java", ".htm"]
</pre>

## Missing License Check

Although <emphasis
>Apache Isis</emphasis
> has no dependencies which have incompatible licenses, the <acronym
>POM</acronym
>s for these dependencies (in the Maven central repo) do not necessarily contain the required license information. When the release process is run this results in the generated <filename
>DEPENDENCIES</filename
> file and generated Maven site listing dependencies as having "unknown" licenses.</ns:clipboard
>
