Title: Verifying Releases using Creadur Tools

The [Apache Creadur](http://creadur.apache.org) project exists to provide a set of tools to ensure compliance with Apache's licensing standards.  The main release auditing tool, [Apache RAT](http://creadur.apache.org/rat), is used in the preparation of the release (as documented [here](release-process.html)).  Creadur's remaining tools are to support the verification process.

At the time of writing, these additional tools are quite young and haven't been formally released; so to use them will take a little bit of work.  In the future we expect these tools to mature and ease the effort required to verify releases.

## Using the Tentacles tool

At the time of writing the Tentacles tool hasn't been released, so you'll need to build from source:

<pre>
mkdir /tmp/verify
cd /tmp/verify
svn co http://svn.apache.org/repos/asf/creadur/tentacles/trunk creadur-tentacles
cd creadur-tentacles
mvn clean install
</pre>

You can pull down a release, using a command such as:
<pre>
cd /tmp/verify
java -jar creadur-tentacles/target/apache-tentacles-0.1-SNAPSHOT.jar https://repository.apache.org/content/repositories/orgapacheisis-NNN/
</pre>

where `NNN` is the repository that has the staged artifacts requiring verification.

As per the [tentacles documentation](http://creadur.apache.org/tentacles/), this command generates a report called `archives.html` (in the newly created `orgapacheisis-NNN` directory).  This lists all of the top-level binaires, their `LICENSE` and `NOTICE` files and any `LICENSE` and `NOTICE` files of any binaries they may contain.

Validation of the output at this point is all still manual.  Things to check for include:

* any binaries that contain no LICENSE and NOTICE files
* any binaries that contain more than one LICENSE or NOTICE file

In this report, each binary will have three links listed after its name '(licenses, notices, contents)'
