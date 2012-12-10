Title: Deploying a Snapshot Release

{stub
This page is a work-in-progress; it needs to be updated with respect to the [release process](release-process.html) for multiple releasable modules.
}

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

Before deploying the snapshot, perform a quick sanity check:

* builds ok (`mvn clean install`)
* an example app runs ok

### Deploy All Modules

Deploy all modules using:

<pre>
mvn -D deploy=snapshot deploy
</pre>

This will deploy all the modules that make up a release.

To confirm that they are present, browse to Apache's [Nexus repository manager](https://repository.apache.org) and search for "isis".

{note
The deploy process is liable will take a long time.  Go grab a bite of lunch.
}


