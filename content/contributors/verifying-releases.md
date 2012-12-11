Title: Verifying Releases

Whenever a committer announces a vote on a release on the [dev mailing list](../support.html), it is the responsibility of the project's PMC to cast their vote on the release.  Any other ASF member may also vote.

This page provides some guidance on what a voter is expected to verify before casting their vote.

## Verifying the source release artifacts

Download both the ZIP and .ASC files from the location specified in the voting email. To verify that the signature is correct, use:

<pre>
gpg --verify isis-x.y.z.zip.asc isis-x.y.z.zip
</pre>

### Building the source release artifacts

Assuming the ZIP file verifies, it should be unpacked, and then the artifact built from source.

First, delete all Isis artifacts from your local Maven repo:

<pre>
rm -rf ~/.m2/repository/org/apache/isis
</pre>

The build process depends on whether the artifact is of Isis core or of one of its components:

* For Isis core, build using the `-o` offline flag:

  `mvn clean install -o`

  Confirm that the versions of the Isis artifacts now cached in your local repository are correct.

* For an Isis component, build without the offline flag; Maven should pull down the component's dependencies from the Maven central repo:

  `mvn clean install`

  Confirm that the versions of the Isis artifacts now cached in your local repository are correct (both those pulled down from Maven central repo, as well as those of the component built locally).

The above steps are the bare minimum you should perform before casting a vote.  Ideally, you should also run an Isis application (eg one of the examples) against the new code (either against a new version of core, or configured to use the new version of the component).

## Verifying the binary release artifacts

Optionally, you can verify the binary releases (in the Maven staging repository).  For this it is necessary to download each artifact from Nexus and its corresponding .ASC file.  Since there are many such artifacts, just verify one or two at random.


<!--
TODO: use the other creadur tools
-->


## Casting a Vote

When you have made the above checks (and any other checks you think may be relevant), cast your vote by replying to the email thread on the mailing list.  If you are casting `-1`, please provide details of the problem(s) you have found.
