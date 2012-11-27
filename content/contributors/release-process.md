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

<pre>
mvn clean install -o
</pre>

- site builds ok

<pre>
sh msdf.sh -o
</pre>

- archetype is ok

  - archetype runs ok

     using `-D archetypeCatalog=local`

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

The Isis parent `pom.xml` specifies the RAT Maven plugin, with a number of [custom exclusions](release-process-rat-exclusions.html).

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

Although Apache Isis has no dependencies which have incompatible licenses, the POMs for some of these dependencies (in the Maven central repo) do not necessarily contain the required license information.  Without appropriate additional configuration, this would result in the generated `DEPENDENCIES` file and generated Maven site indicating dependencies as having "unknown" licenses.

Fortunately, Maven allows the missing information to be provided by configuring the `maven-remote-resources-plugin`.  This is stored in the `src/main/appended-resources/supplemental-models.xml` file in the parent `[oai:isis]` module.
