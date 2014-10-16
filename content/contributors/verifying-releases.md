Title: Verifying Releases

Whenever a committer announces a vote on a release on the [dev mailing list](../support.html), it is the responsibility of the project's PMC to cast their vote on the release.  Anyone else can also vote, but only members of the Apache Isis PMC's vote are binding.

This page provides some guidance on what a voter is expected to verify before casting their vote. 

Per this [ASF documentation](http://www.apache.org/dev/release.html), the legal requirements for an ASF release are:

* a source zip file + corresponding signature (signed by the release manager, which is in the ASF web of trust and in our KEYS file)
* all source files have the Apache license (this is ensured by the running of the rat plugin prior to release; you could run it on the unzipped source)
* all dependencies are appropriately licensed; see the `DEPENDENCIES` file which is automatically generated from the POMs plus the supplemental-models.xml file

Note that the binaries are *not* an ASF release, they merely exist on the Maven central repo as a convenience.  That said, you might also want to verify the release by pulling the binaries from the Maven staging repository.  Details of how to do this are also documented below.

## Prerequisites ##

To verify the source ZIP files, you will need to have imported the public keys used for signing Isis releases.  These can be downloaded from the root of the Isis source tree.

Since the Isis source is mirrored on github.com, you can just use:

<pre>
curl http://www.apache.org/dist/isis/KEYS > /tmp/KEYS
gpg --import /tmp/KEYS
</pre>

## Verifying the source release artifacts ##

> Note: to automate this next stage, there is also a [script](/contributors/verifying-releases-script.html) available; but read what follows first before using the script.

Download both the ZIP and .ASC files from the location specified in the voting email. To verify that the signature is correct, use:

    gpg --verify isis-x.y.z.zip.asc isis-x.y.z.zip

## Building the source release artifacts ##

Assuming the ZIP file verifies, it should be unpacked, and then the artifact built from source.

First, delete all Isis artifacts from your local Maven repo:

    rm -rf ~/.m2/repository/org/apache/isis

The build process depends on whether the artifact is of Isis core or of one of its components.

#### Isis Core ####

To build Isis core, first download any dependencies:

    mvn dependency:go-offline

Check that no Isis artifacts have yet been downloaded, ie there is no `~/.m2/org/repository/org/apache/isis` directory.  If there are, it could indicate that the release being verified incorrectly references previous versions of Isis core.

Assuming all is ok, build using the `-o` offline flag:

    mvn clean install -o

Confirm that the versions of the Isis artifacts now cached in your local repository are correct.

#### Isis Component ####

To build an Isis component, build without the offline flag; Maven should pull down the component's dependencies from the Maven central repo:

    mvn clean install

Confirm that the versions of the Isis artifacts now cached in your local repository are correct (both those pulled down from Maven central repo, as well as those of the component built locally).

The above steps are the bare minimum you should perform before casting a vote.  Ideally, you should also run an Isis application (eg one of the examples) against the new code (either against a new version of core, or configured to use the new version of the component).

## Verifying the binary release artifacts (using the Maven staging repository) ##

If you wish, you can verify the binary releases by configuring your local Maven install to point to the Maven Maven staging repository (or repositories) and then using them, eg to run the [simpleapp archetype](../intro/getting-started/simpleapp-archetype.html) and running the resultant app.

Configuring your local Maven install amounts to updating the `~/.m2/settings.xml` file:

    <profiles>
        <profile>
            <id>verify-isis</id>
            <repositories>
                <repository>
                    <id>isis-core-staging</id>
                    <name>Isis Core Staging</name>
                    <releases>
                        <enabled>true</enabled>
                        <updatePolicy>always</updatePolicy>
                        <checksumPolicy>warn</checksumPolicy>
                    </releases>
                    <url>http://repository.apache.org/content/repositories/orgapacheisis-10xx</url>
                    <layout>default</layout>
                </repository>
                ...
            </repositories>
        </profile>
        ...
    </profiles>
    <activeProfiles>
        <activeProfile>verify-isis</activeProfile>
        ...
    </activeProfiles>

where the repository URL is as provided in the VOTE email.  If there is more than one repository (as is sometimes the case if multiple components have been released), then repeat the <repository> section for each.

Once the vote has completed, the staging repositories will be removed and so you should deactive the profile (comment out the `<activeProfile>` element).  If you forget to deactive the profile, there should be no adverse effects; Maven will just spend unnecessary cycles attempting to hit a non-existent repo.

## Using the Creadur Tools

The [Apache Creadur](http://creadur.apache.org) project exists to provide a set of tools to ensure compliance with Apache's licensing standards.  The main release auditing tool, [Apache RAT](http://creadur.apache.org/rat), is used in the preparation of the release (as documented [here](release-process.html)).  Creadur's remaining tools are to support the verification process.

At the time of writing, these additional tools are quite young and haven't been formally released; so to use them will take a little bit of work.  See [here](verifying-releases-using-creadur-tools.html) for more details.

## Casting a Vote

When you have made the above checks (and any other checks you think may be relevant), cast your vote by replying to the email thread on the mailing list.  If you are casting `-1`, please provide details of the problem(s) you have found.

