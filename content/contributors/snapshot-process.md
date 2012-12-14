Title: Snapshot Release Process


Apache Isis consists of a number of separately releasable modules; see the main [release process](release-process.html) documentation for full details.  All the non-core components depend on the `core`, and use the `core`'s parent `pom.xml` as their parent pom.

{note
Unless otherwise stated, you should assume that the steps described here are performed in the base directory of the module being released.
}


## Prerequisites
Before you start, make sure you've defined the snapshots repo in your local `~/.m2/settings.xml` file:

<pre>
&lt;settings&gt;
  &lt;servers&gt;
    &lt;!-- To publish a snapshot of some part of Maven --&gt;
    &lt;server&gt;
      &lt;id&gt;apache.snapshots.https&lt;/id&gt;
      &lt;username&gt;xxxxxxx&lt;/username&gt;
      &lt;password&gt;yyyyyyy&lt;/password&gt;
    &lt;/server&gt;
    ...
  &lt;/servers&gt;
  ...
&lt;/settings&gt;
</pre>

where `xxxxxxx` and `yyyyyyy` are your Apache LDAP username and password.     For more information, see these [ASF docs](http://www.apache.org/dev/publishing-maven-artifacts.html#dev-env).

{note
It is also possible to configure to use `.ssh` secure keys, and thereby avoid hardcoding your Apache LDAP password into your `.m2/settings.xml` file. A description of how to do this can be found, for example, [here](http://incubator.apache.org/bval/cwiki/release-setup.html).
}

### Sanity Check

Before deploying the snapshot, perform a quick sanity check.

First, delete all Isis artifacts from your local Maven repo:

<pre>
rm -rf ~/.m2/repository/org/apache/isis
</pre>

Next, check that the releasable module builds independently. The build process depends on whether the artifact is of Isis core or of one of its components:

* For Isis core, build using the `-o` offline flag:

  `mvn clean install -o`

  Confirm that the versions of the Isis artifacts now cached in your local repository are correct.

* For an Isis component, build without the offline flag; Maven should pull down the component's dependencies from the Maven central repo:

  `mvn clean install`

  Confirm that the versions of the Isis artifacts now cached in your local repository are correct (both those pulled down from Maven central repo, as well as those of the component built locally).

### Deploy All Modules

Deploy all modules using:

<pre>
mvn -D deploy=snapshot deploy
</pre>

This will deploy all the modules that make up a release.

To confirm that they are present, browse to Apache's [Nexus repository manager](https://repository.apache.org) and search for "isis".

{note
Depending on the module being released, the deploy process could take a long time.  Go grab a bite of lunch.
}


