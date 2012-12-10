Title: Release Process

{stub
This page is a work-in-progress.
}

Apache Isis consists of a number of separately releasable modules.  Relative to the root of the [source code repo](https://git-wip-us.apache.org/repos/asf/isis/repo?p=isis.git;a=tree), these are:

- `core`
- `component/objectstore/jdo`
- `component/objectstore/nosql`
- `component/objectstore/sql`
- `component/objectstore/xml`
- `component/security/ldap`
- `component/security/sql`
- `component/profilestore/sql`
- `component/profilestore/xml`
- `component/progmodel/groovy`
- `component/progmodel/wrapper`
- `component/viewer/bdd`
- `component/viewer/dnd`
- `component/viewer/html`
- `component/viewer/junit`
- `component/viewer/scimpi`
- `component/viewer/wicket`

All the non-core components depend on the `core`, and use the `core`'s parent `pom.xml` as their parent pom.

##Process Prerequisites

Before releasing `core`, ensure there is consensus on the [dev mailing list](../support.html) that this is the right time for a release.  The discussion should include confirming the version number to be used, and to confirm content.

For non-`core` components, ensure that there is awareness on the dev mailing list that a release is to be cut.  In particular, indicate the version of `core` that the component release will depend upon, and the version number to be used for the component's release.

Once agreed, the formal release can begin.  The steps are:

- create a branch locally in which to prepare the release
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

### Set up local environment

First, clear out your local Maven repo of any Isis artifacts:

<pre>
cd ~/.m2/repository/org/apache
mv isis isis-MOVED
</pre>

Second, create a branch in your local Git repo:
 
<pre>
git checkout -b release/x.y.z
</pre>

All release preparation is done locally; when we are done, this branch will be pushed back to master.


## Code Prerequisites

Before making any formal release, there are a number of prerequisites that should always be checked

### Update dependency versions

First, check (via [http://search.maven.org](http://search.maven.org)) whether there is a newer version of the Apache parent `org.apache:apache`. If so, update the `<parent>` element in Isis' own parent POM `org.apache.isis:isis`.

Second, use the Maven versions plugin can be used to determine if there are newer versions of any of Isis' dependencies:

<pre>
mvn versions:display-dependency-updates > /tmp/foo
grep "\->" /tmp/foo | sort -u
</pre>

Update any of the dependencies that are out-of-date.


### Sanity check

First, clear out your local Maven repo of any Isis artifacts:

<pre>
cd ~/.m2/repository/org/apache
mv isis isis-MOVED
</pre>

Next, check that the releasable module builds independently.  For example, if releasing the `core` module, check that it builds:

<pre>
cd core
mvn clean install -o
</pre>

Or, if you were building an objectstore, make sure that it builds independently:

<pre>
cd component/objectstore/jdo
mvn clean install -o
</pre>

{note
All remaining steps should be performed in the base directory of the module being released.
}


### Code cleanup / formatting

Make sure that all source code has been cleaned up and formatted according to the Apache Isis and ASF conventions.  Full details are in [Isis coding conventions](coding-conventions.html).

## License header notices (RAT tool)

The Apache Release Audit Tool `RAT` (from the [Apache Creadur](http://creadur.apache.org) project) checks for missing license header files.

The parent `pom.xml` of each releasable module specifies the RAT Maven plugin, with a number of custom exclusions.

To run the RAT tool, use:

<pre>
mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
</pre>

where `rat.numUnapprovedLicenses` property is set to a high figure, temporarily overriding the default value of 0.  This will allow the command to run over all submodules, rather than failing after the first one.

{note
Do *not* use `mvn rat:check`; depending on your local Maven configuratoin this may bring down the obsolete `mvn-rat-plugin` from Codehaus repo.
}

All being well the command should complete.  For each failing submodule, it will have written out a `target\rat.txt`; missing license notes are indicated using the key `!???`.  You can collate these together using something like:
<pre>
for a in `find . -name rat.txt -print`; do grep '!???' $a; done
</pre>

Investigate and fix any reported violations, typically by either:

- adding genuinely missing license headers from Java (or other) source files, or
- updating the `<excludes>` element for the `apache-rat-plugin` plugin to ignore test files, log files and any other non-source code files
  - also look to remove any stale `<exclude>` entries

To add missing headers, you can if you wish use the groovy script `addmissinglicenses.groovy` to automatically insert missing headers for certain file types.  The actual files checked are those with extensions specified in the line `def fileEndings = [".java", ".htm"]`:

- dry run:
<pre>
groovy addmissinglicenses.groovy
</pre>

- or to actually execute:
<pre>
groovy addmissinglicenses.groovy -x
</pre>

Once you've fixed all issues, confirm once more that `apache-rat-plugin` no longer reports any license violations, this time leaving the `rat.numUnapprovedLicenses` property to its default, 0:

<pre>
mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=0 -o

for a in `find . -name rat.txt -print`; do grep '!???' $a; done
</pre>


## Missing License Check

Although Apache Isis has no dependencies which have incompatible licenses, the POMs for some of these dependencies (in the Maven central repo) do not necessarily contain the required license information.  Without appropriate additional configuration, this would result in the generated `DEPENDENCIES` file and generated Maven site indicating dependencies as having "unknown" licenses.

Fortunately, Maven allows the missing information to be provided by configuring the `maven-remote-resources-plugin`.  This is stored in the `src/main/appended-resources/supplemental-models.xml` file in the parent `[oai:isis]` module.

To capture the missing license information, use:

<pre>
mvn license:download-licenses
</pre>

This Maven plugin creates a `licensexml` file in the `target/generated-resources` directory of each module.

Then, run the following script (shown here relative to the `core` module).

<pre>
groovy ../scripts/checkmissinglicenses.groovy
</pre>

This searches for all `licenses.xml` files, and compares them against the contents of the `supplemental-models.xml` file.   For example, the output could be something like:

<pre>
licenses to add to supplemental-models.xml:

[org.slf4j, slf4j-api, 1.5.7]
[org.codehaus.groovy, groovy-all, 1.7.2]


licenses to remove from supplemental-models.xml (are spurious):

[org.slf4j, slf4j-api, 1.5.2]
</pre>

If any missing entries are listed or are spurious, then update `supplemental-models.xml` and try again.

{note
Ignore any missing license warnings for the TCK modules; this is a result of the TCK modules for the viewers (eg `bdd-concordion-tck`) depending on the TCK dom, fixtures etc.
}


## Preparing a Release (`mvn release:prepare`)

In order to prepare a release, you must have a public/private key pair, and have configured Maven.  See the page on [key generation](key-generation.html) for more details.

{note
... in progress ...
}

<pre>
git checkout
</pre>




##Post-Release

### Close All JIRA tickets for the release

All JIRA tickets for the release should be closed, or moved to future releases if not yet addressed.

### Update CMS site with release notes

For the completed release, use JIRA to generate release notes using the procedure documented [here](http://confluence.atlassian.com/display/JIRA/Creating+Release+Notes).  If any of the tickets closed are tasks/subtasks, then please edit the contents of the file to associate them back together again.

Then, update the appropriate section of the CMS site:

- on the [documentation page](../documentation.html) clearly indicate the latest version of the core or component just released
- a the core or component's about page, provide a link to release notes providing details of the contents of the release.

### Update `STATUS` file

The trunk holds a [STATUS](https://git-wip-us.apache.org/repos/asf/isis/repo?p=isis.git;a=blob_plain;f=STATUS;hb=HEAD) file which is a brief summary of the current status of the project.  Update this file with details of the release.

<!--
DEFUNCT
### Update downloads.apt.vm

The website's `src/site/apt/downloads.apt.vm` file lists (what will be) the current release, along with any archived releases. Update this to reflect how things will be once the release is complete.
-->
