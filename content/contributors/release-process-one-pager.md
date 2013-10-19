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

{note
Switch to the directory containing the (parent of the) artifact(s) to be released
}

... if for `core`:

<pre>
cd core
</pre>

... if for a `component/xxx/xx`:

<pre>
cd component/xxx/xxx
</pre>

## Check code

Update parent version to non-`SNAPSHOT` (including tck project, if any):
<pre>
vi `/bin/find . -name pom.xml | grep -v target`
</pre>

Newer dependencies:
<pre>
mvn versions:display-dependency-updates > /tmp/foo
grep "\->" /tmp/foo | /bin/sort -u
</pre>

Missing license headers in files:
<pre>
mvn org.apache.rat:apache-rat-plugin:check -D rat.numUnapprovedLicenses=50 -o
for a in `/bin/find . -name rat.txt -print`; do grep '!???' $a; done
</pre>

Missing/spurious `supplemental-models.xml`

... if in `core`:
<pre>
mvn license:download-licenses
groovy ../scripts/checkmissinglicenses.groovy
</pre>

... if for a `component/xxx/xxx`:
<pre>
mvn license:download-licenses
groovy ../../../scripts/checkmissinglicenses.groovy
</pre>

## Release

{note
Switch to `cmd.exe` if on Windows
}

Prepare then perform:
<pre>
mvn release:prepare -P apache-release -D dryRun=true
rm release.properties
mvn release:prepare -P apache-release -D skipTests=true
mvn release:perform -P apache-release
</pre>
