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

<!--
- site builds ok

<pre>
sh msdf.sh -o
</pre>

- archetype is ok

  - archetype runs ok

     using `-D archetypeCatalog=local`

  - app generated from the archetype runs ok
-->


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

In order to prepare the release, you'll (need to) have a `~/.gnupg` directory with the relevant files (`gpg.conf`, `pubring.gpg`, `secring.gpg` etc).

{note
If on Windows, the equivalent directory is `c:\users\xxx\appdata\roaming\gnupg`.  For `gpg`, use either [cygwin.com](http://cygwin.com) or [gpg4win.org](http://www.gpg4win.org).  Note also that the mSysGit version of `gpg` (as provided by GitHub's bash client) is not compatible with that provided by cygwin.
}


<!--
TODO: a section like this will be required when considering archetypes and/or maven sites.

### Manually update versions to the release version

There are a couple of locations where the version must be bumped up manually.
-->



<!--
TODO: something equivalent to this will need to be documented for the archetype modules.

#### Update <version> in archetype resources

The release plugin (used in the sections that follow) will automatically bump up the `<version>` of all of the POMs (first to remove the `-SNAPSHOT` prefix while the release is being cut, and then update to the next iterations `-SNAPSHOT` after that). However, what it doesn't do, unfortunately, is to update the `<isis.version>` property in the archetype resources for the quickstart archetype.

Therefore, open up the `src/main/resources/archetype-resources/pom.xml` in the `oai:quickstart-archetype` module, and update the `<isis.version>` property:

<pre>
&lt;properties&gt;
    &lt;isis.version&gt;0.x.x-incubating&lt;/isis.version&gt;
&lt;/properties&gt;
</pre>
Then commit the pom.xml file.
-->



<!--
TODO: something like this will be need to be considered when we get Maven site running again.

#### Update skin `<version>`

The parent module's `site.xml` file defines the skin that is used by the parent module and every inheriting child module. Since the Maven release process does not automatically increment this version, it must be updated manually first.

Therefore, open up the `src/site/site.xml` in the `oai.core:isis` parent module, and update the `<version>`:

<pre>
&lt;skin&gt;
    ...
    &lt;version&gt;0.x.x-incubating&lt;/version&gt;
&lt;/skin&gt;
</pre>
Then commit the `site.xml` file.
-->


### Dry-run

<pre>
mvn release:prepare -P apache-release -D dryRun=true
</pre>

{note
Some modules might have additional profiles to be activated.  For example, the sql OS requires `-P apache-release,integration-tests` so that its integration tests are also run.
}

This should generate something like:

<pre>
$ mvn release:prepare -P apache-release -D dryRun=true
[INFO] Scanning for projects...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Build Order:
[INFO]
[INFO] Apache Isis Core
[INFO] Isis Core AppLib
[INFO] Isis Core Unit Test Support
[INFO] Isis Core MetaModel
[INFO] Isis Core Runtime
[INFO] Isis Core WebServer
[INFO] Isis Core CgLib Bytecode
[INFO] Isis Core Javassist Bytecode
[INFO] Isis Core In-Memory ObjectStore
[INFO] Isis Core In-memory ProfileStore
[INFO] Isis Core No-op Security
[INFO] Isis Core TCK App
[INFO] Isis Core TCK DOM
[INFO] Isis Core Integration Testing Support
[INFO] Isis Core TCK Fixtures
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Apache Isis Core 0.3.1-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] --- maven-release-plugin:2.3.2:prepare (default-cli) @ isis ---
[INFO] Resuming release from phase 'map-release-versions'
What is the release version for "Apache Isis Core"? (org.apache.isis.core:isis)
0.3.1: :
</pre>

Then answer the next three questions, either accepting the offered values or overriding as required:
<pre>
What is the release version for "Apache Isis Core"? (org.apache.isis.core:isis)
0.3.1: :
What is SCM release tag or label for "Apache Isis Core"? (org.apache.isis.core:i
sis) isis-0.3.1: :
What is the new development version for "Apache Isis Core"? (org.apache.isis.cor
e:isis) 0.3.2-SNAPSHOT:
</pre>


The next step, assuming this completes successfully, is to re-run the command.  Before you do that, first delete the generated `release.properties` file:

<pre>
rm release.properties
</pre>

{note
The requirement to delete this file is a side-effect of using `mvn` with a decentralized version control system such `git` rather than with a centralized version control system such as `svn`
}

Then, re-run the command, but without the `dryRun` flag.  You can also set the `skipTests` flag since they would have been run during the previous dry run:
<pre>
mvn release:prepare -P apache-release -D skipTests=true
</pre>

### Post-prepare sanity check

You should end up with artifacts in your local repo with the new version `x.y.z`. There are then a couple of sanity checks that you can perform:

* unzip the source-release ZIP and check it builds

  For example, if building core, then the ZIP file will be called `isis-x.y.z-source-release.zip` and should reside in `~/.m2/repository/org/apache/isis/core/isis/x.y.z` directory.

  Unzip in a new directory, and build (see Chapter 3, Building Isis from Source).

* Inspect the `DEPENDENCIES` file.

  This file should be in the root of the extracted ZIP. In particular, check that there are no category-x dependencies.

<!--
TODO: for archetype projects
* Use the locally built quickstart archetype to generate the application, and make sure that the generated application runs ok.

mvn archetype:generate  \
    -D groupId=com.mycompany \
    -D artifactId=myapp \
    -D archetypeCatalog=local \
    -D archetypeGroupId=org.apache.isis \
    -D archetypeArtifactId=quickstart-archetype \
    -D archetypeVersion=0.x.x-incubating
Check that the generated app's artifacts point to the correct version of Isis (specifically: without a -SNAPSHOT suffix), and runs as expected.
-->

If you find problems and the release was performed on a branch, then just delete the branch and start over.

## Upload Release for Voting

Once the release has been built locally, it should be uploaded for voting. This is done by deploying the Maven artifacts to a staging directory (this includes the source release ZIP file which will be voted upon).

The Apache staging repository runs on Nexus server, hosted at [repository.apache.org](https://repository.apache.org). The process of uploading will create a staging repository that is associated with the host (IP address) performing the release. Once the repository is staged, the newly created staging repository is "closed" in order to make it available to others.

Before you start, make sure you've defined the staging repo in your local `~/.m2/settings.xml` file:

<pre>
&lt;settings&gt;
  &lt;servers&gt;
    &lt;!-- To publish a snapshot of some part of Maven --&gt;
    &lt;server&gt;
      &lt;id&gt;apache.releases.https&lt;/id&gt;
      &lt;username&gt;xxxxxxx&lt;/username&gt;
      &lt;password&gt;yyyyyyy&lt;/password&gt;
    &lt;/server&gt;
    ...
  &lt;/servers&gt;
  ...
&lt;/settings&gt;
</pre>

where `xxxxxxx` and `yyyyyyy` are your Apache LDAP username and password.   For more information, see these [ASF docs](http://www.apache.org/dev/publishing-maven-artifacts.html#dev-env).

{note
It is also possible to configure to use `.ssh` secure keys, and thereby avoid hardcoding your Apache LDAP password into your `.m2/settings.xml` file. A description of how to do this can be found, for example, [here](http://incubator.apache.org/bval/cwiki/release-setup.html).
}


### Perform the Release

The command to stage the release is:

<pre>
mvn release:perform -P apache-release
</pre>

The command starts off by checking out the codebase from the tag:

<pre>
...
[INFO] --- maven-release-plugin:2.3.2:perform (default-cli) @ isis ---
[INFO] Performing a LOCAL checkout from scm:git:file:///C:\APACHE\isis-git-rw\co
re
[INFO] Checking out the project to perform the release ...
[INFO] Executing: cmd.exe /X /C "git clone --branch isis-0.4.0 file:///C:\APACHE
\isis-git-rw\core C:\APACHE\isis-git-rw\core\target\checkout"
[INFO] Working directory: C:\APACHE\isis-git-rw\core\target
[INFO] Performing a LOCAL checkout from scm:git:file:///C:\APACHE\isis-git-rw
[INFO] Checking out the project to perform the release ...
[INFO] Executing: cmd.exe /X /C "git clone --branch isis-0.4.0 file:///C:\APACHE
\isis-git-rw C:\APACHE\isis-git-rw\core\target\checkout"
[INFO] Working directory: C:\APACHE\isis-git-rw\core\target
[INFO] Executing: cmd.exe /X /C "git ls-remote file:///C:\APACHE\isis-git-rw"
[INFO] Working directory: C:\Users\ADMINI~1\AppData\Local\Temp
[INFO] Executing: cmd.exe /X /C "git fetch file:///C:\APACHE\isis-git-rw"
[INFO] Working directory: C:\APACHE\isis-git-rw\core\target\checkout
[INFO] Executing: cmd.exe /X /C "git checkout isis-0.4.0"
[INFO] Working directory: C:\APACHE\isis-git-rw\core\target\checkout
[INFO] Executing: cmd.exe /X /C "git ls-files"
[INFO] Working directory: C:\APACHE\isis-git-rw\core\target\checkout
[INFO] Invoking perform goals in directory C:\APACHE\isis-git-rw\core\target\che
ckout\core
[INFO] Executing goals 'deploy'...
...
</pre>

All being well this command will complete successfully.



### Check the Repository

If the mvn release:perform has worked then it will have put release artifacts into a newly created staging repository .

Log onto [repository.apache.org](http://repository.apache.org) (using your ASF LDAP account) and check that the release has been staged:

<!--
TODO: update screenshot
-->

![](http://incubator.apache.org/isis/docbkx/html/guide/images/release/nexus-staging-1.png)


If nothing appears in a staging repo you should stop here and work out why.

Assuming that the repo has been populated, make a note of its repo id; this is needed for the voting thread. In the screenshot above the id is `org.apache.isis-008`.

### Close the Repository

After checking that the staging repository contains the artifacts that you expect you should close the staging repository. This will make it available so that people can check the release.

Press the Close button and complete the dialog:

<!--
TODO: update screenshot
-->

![](http://incubator.apache.org/isis/docbkx/html/guide/images/release/nexus-staging-2.png)

All being well, the close should complete successfully:

<!--
TODO: update screenshot
-->

![](http://incubator.apache.org/isis/docbkx/html/guide/images/release/nexus-staging-3.png)

The Nexus repository manager will also email you with confirmation of a successful close.

If Nexus has problems with the key signature, however, then the close will be aborted:

<!--
TODO: update screenshot
-->

![](http://incubator.apache.org/isis/docbkx/html/guide/images/release/nexus-staging-4.png)

Use `gpg --keyserver hkp://pgp.mit.edu --recv-keys nnnnnnnn` to confirm that the key is available.

{note
Unfortunately, Nexus does not seem to allow subkeys to be used for signing. See [Key Generation](key-generation.html) for more details.
}

### Push changes

Finally, push your local branch to a new, similarly named branch on the central origin server:
<pre>
git push -u origin release/x.y.z
</pre>

## Voting

Once the artifacts have been uploaded, you can call a vote.

In all cases, votes last for 72 hours and require a +3 (binding) vote from members.

### Start voting thread on dev@isis.apache.org

The following boilerplate is for a release of the Apache Isis `core`.  Adapt as required:

Use the following subject:
<pre>
[VOTE] Apache Isis Core release x.y.z
</pre>

And use the following body:

<pre>
I've staged a release for Apache Isis Core, namely x.y.z.

The artifacts have been staged to staging repository on repository.apache.org:
* https://repository.apache.org/content/repositories/orgapacheisis-nnn/org/apache/isis/core/isis/x.y.z/isis-x.y.z-source-release.zip (zip file)
* https://repository.apache.org/content/repositories/orgapacheisis-nnn/org/apache/isis/core/isis/x.y.z/isis-x.y.z-source-release.zip.asc (signature)

In the source code repo the code has been tagged as release/isis-x.y.z.

Our website contains some suggestions of how to verify the release, see
http://isis.apache.org/contributors/verifying-releases.html

Please verify the release and cast your vote.  The vote will be open for 72 hours.

[ ] +1
[ ]  0
[ ] -1
</pre>





12.6.2. Other contributors cast their vote

It is the responsibility of other contributors (or any ASF member) to cast their vote on the release. This section provides some guidance on this process.

12.6.2.1. Verifying the source release artifacts

Download both the ZIP and .ASC files from the location specified in the voting email. To verify that the signature is correct, use:

gpg --verify isis-x.x.x-incubating.zip.asc isis-x.x.x-incubating.zip
The ZIP file should then be unpacked.

Once unpacked, it is recommended that voters at a minimum sanity check the contents, as per Section 12.1.2, “Sanity check”.

In particular, when building locally, confirm that the versions in your local repository (~/.m2/repository/org/apache/isis) are correct.

12.6.2.2. Verifying the binary release artifacts

Optionally, voters can verify the binary releases (in the Maven staging repository). For this it is necessary to download each artifact from Nexus and its corresponding .ASC file. Since there are many such artifacts, we suggest you just choose one or two at random.

12.6.2.3. Casting a Vote

When the above checks have been made (and any other checks that the voter thinks is relevant), they should cast a vote by replying to the email thread above.

12.6.3. After the isis-dev vote

Once the vote has completed, post the results to the isis-dev mailing list.

Use the following subject:

[RESULT] [VOTE] Apache Isis release 0.x.x-incubating
with the body:

The vote has completed with the following result :

  +1 (binding): <<list of names>>
  +1 (non binding): <<list of names>>





If the vote has been unsuccessful, then delete the branches and SVN tag, drop the staging repository, address the problems in trunk, and go again.






12.7. Promoting Release to Distribution

12.7.1. Release Binaries to Maven Central Repo

From the Nexus pages, select the staging repository and select 'release' from the top menu.

This moves the release artifacts into an Apache releases repository, from there they will be automatically moved to the Maven repository.

12.7.2. Release Source Zip

Releasing the source ZIP is a matter of copying the ZIP into the /www/www.apache.org/dist/incubator/isis directory on people.apache.org.

Note

There is an alternative and newer approach, namely to check in the release to subversion. At some stage these procedures will be updated to reflcet this newer approach.

Assuming you've downloaded the ZIP file and signature file from the staging repo, and the dist directory already exists, use scp to copy the files up:

scp isis-x.x.x-incubating-source-release.* people.apache.org:/www/www.apache.org/dist/incubator/isis/.
12.7.3. Promote and update the Website

To promote the site, first log onto people.apache.org. Then:

switch to the website directory:

$ cd /www/incubator.apache.org
Either:

move the previous site to one side:

$ mv isis isis-0.x.w-incubating
where 0.x.w is the previous version was uploaded

or simply delete the site:

$ rm -rf isis
Move the new site into place, and for good measure touch every file to ensure it is picked up:

$ mv isis-0.x.x-incubating isis
$ find isis -exec touch {} \;
Finally, check that the download links are valid, as specified in downloads.html. If there are any errors or adjustments, make them directly, but remember to apply the same changes back to the source tree for the next iteration.

The new site should become available within a couple of hours.

12.7.4. Announce the release

Announce the release to isis-dev@incubator.a.o mailing list.

Use the following subject:

Subject: [ANN] Apache Isis version 0.x.x-incubating Released
And use the following body (summarizing the main points as required):

The Isis team is pleased to announce the release of Apache Isis version 0.x.x-incubating

  http://incubator.apache.org/isis

<<summary of the main points of the release>>

Full release notes are available at [1] on the Isis website.

You can access this release directly from the Maven central repo [2], use the Maven archetype to configure an initial project [3],
or download the release and build it from source [4].

Enjoy!

-The Isis team

[1] http://incubator.apache.org/isis/release-notes-0.x.x-incubating.html
[2] http://search.maven.org
[3] http://incubator.apache.org/isis/quickstart-app.html
[4] http://incubator.apache.org/isis/downloads.html





12.8. Prepare for next iteration

12.8.1. Merge changes from branch back into trunk

Because we release from a branch, the changes made in the branch (changes to pom.xml made automatically by the release-plugin, or any manual edits) should be merged back from the release branch back into trunk. There are two ways to do this:

The "official" way is to use SVN's merge command for this (using the "reintegrate" flag):

$ cd .../trunk/framework
$ svn merge --reintegrate https://svn.apache.org/repos/asf/incubator/isis/branches/0.x.x-incubating/framework .
$ svn commit -m "reintegrating release branch 0.x.x-incubating ready for next iteration"
However, you will find that this is very slow (the merge command alone takes something like ~1 hour) and will generate a massive change set which also will take an age to commit.

Alternatively, then, you may well find it easy to perform the edits manually:

one option is to use a directory comparison tool such as Beyond Compare or WinMerge to compare the branch workspace with the trunk workspace.

Set the tool's filters to compare only pom.xml files, because these are the only files that the release process in the branch will have updated and require merging in.

or, you could use UNIX command line tools to perform an update.

The following command will locate every pom.xml and perform in place updates, saving the original file to pom.xml.bak:

find . -name pom.xml -exec sed -i.bak -e 's/0\.1\.0/0\.2\.0/g' {} \;
The above works on Cygwin, too (though you may need to fully qualified the find command as /usr/bin/find).

12.8.2. Manually update versions to snapshot versions

After the release there are a couple of locations where the version must be bumped up manually to the next SNAPSHOT version.

12.8.2.1. Update <version> in archetype resources

Open up the src/main/resources/archetype-resources/pom.xml in the [oai:quickstart-archetype] module, and update the <isis.version> property:

<properties>
    <isis.version>0.x.y-incubating-SNAPSHOT</isis.version>
</properties>
Then commit the pom.xml file.

12.8.2.2. Update skin <version>

Open up the src/site/site.xml in the [oai:isis] parent module, and update the <version>:

<skin>
    ...
    <version>0.x.y-incubating-SNAPSHOT</version>
</skin>
Then commit the site.xml file.

12.8.3. Update examples etc (source code outside of trunk/framework)

Finally, remember that the version in the pom.xml for any modules that are not in the release - specifically those outside of trunk/framework, such as the examples and domain-libs modules - should be manually updated also.






12.9. Update Isis Project Incusbation Status page

Update the Isis Project Incubation Status page to capture the new status of the project. In particular:

The News section should document the new release

The Project Info section should be reviewed and updated if required

Any links to missing Incubation status reports should be added

The file is updated by checking out and editing the following file from SVN:

https://svn.apache.org/repos/asf/incubator/public/trunk/site-author/projects/isis.xml

For additional information, see this guidance on the incubator website.













##Post-Release

### Merge changes back to mainline

TODO: to document.

### Close All JIRA tickets for the release

All JIRA tickets for the release should be closed, or moved to future releases if not yet addressed.

### Update CMS site with release notes

For the completed release, use JIRA to generate release notes using the procedure documented [here](http://confluence.atlassian.com/display/JIRA/Creating+Release+Notes).  If any of the tickets closed are tasks/subtasks, then please edit the contents of the file to associate them back together again.

Then, update the appropriate section of the CMS site:

- on the [documentation page](../documentation.html) clearly indicate the latest version of the core or component just released
- a the core or component's about page, provide a link to release notes providing details of the contents of the release.


<!--
### Update CMS site with generated Maven site

TODO: some sort of process required here...
-->


### Update `STATUS` file

The trunk holds a [STATUS](https://git-wip-us.apache.org/repos/asf/isis/repo?p=isis.git;a=blob_plain;f=STATUS;hb=HEAD) file which is a brief summary of the current status of the project.  Update this file with details of the release.

<!--
DEFUNCT
### Update downloads.apt.vm

The website's `src/site/apt/downloads.apt.vm` file lists (what will be) the current release, along with any archived releases. Update this to reflect how things will be once the release is complete.
-->