Title: Verifying Releases

12.6.2. Other contributors cast their vote

It is the responsibility of other contributors (or any ASF member) to cast their vote on the release. This section provides some guidance on this process.

12.6.2.1. Verifying the source release artifacts

Download both the ZIP and .ASC files from the location specified in the voting email. To verify that the signature is correct, use:

gpg --verify isis-x.x.x-incubating.zip.asc isis-x.x.x-incubating.zip
The ZIP file should then be unpacked.

Once unpacked, it is recommended that voters at a minimum sanity check the contents, as per Section 12.1.2, ŒÈŒÌSanity checkŒÈŒÌ.

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
