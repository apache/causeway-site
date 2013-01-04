Title: Release Process (1 pager)

Summarises the steps spelt out in full [here](release-process.html)

## Get code

Pull down latest, create branch:
<pre>
git checkout master
git pull --ff-only
git checkout -b prepare/isis-1.2.3-RC1
</pre>

Sanity check:
<pre>
rm -rf ~/.m2/repository/org/apache/isis
mvn clean install -o
</pre>


## Switch to correct directory

Switch to the directory containing the (parent of the) artifact(s) to be released, eg:

<pre>
cd core
</pre>

## Check code

Update parent version to non-`SNAPSHOT` (including tck project, if any):
<pre>
vi `find . -name pom.xml | grep -v target`
</pre>

Newer dependencies:
<pre>
mvn versions:display-dependency-updates > /tmp/foo
grep "\->" /tmp/foo | sort -u
</pre>

Missing license headers in files:
<pre>
mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
for a in `find . -name rat.txt -print`; do grep '!???' $a; done
</pre>

Missing/spurious `supplemental-models.xml`:
<pre>
mvn license:download-licenses
groovy ../scripts/checkmissinglicenses.groovy
</pre>

## Release

Prepare then perform (switch to `cmd.exe` if on Windows):
<pre>
mvn release:prepare -P apache-release -D dryRun=true
rm release.properties
mvn release:prepare -P apache-release -D skipTests=true
mvn release:perform -P apache-release
</pre>
