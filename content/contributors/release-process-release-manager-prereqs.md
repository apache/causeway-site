Title: Release Manager Prereqs (Keys)

In order that a contributor can make a release it is necessary for them to have generated a key and had that key recognized by other members of the ASF.  

## Key Generation

*currently documented in 0.2.0-incubating contributor guide, 'Key Generation' appendix.*

## Update Maven Settings file (`~/.m2/settings.xml`)

The Maven release plugin will automatically sign the release, however it is necessary to update the `~/.m2/settings.xml` file with your GPG acronym passphrase in order that it can use your secret key.  This is defined under a profile so that it is activated only when we perform a release (as defined by `[org,apache:apache]` parent POM.

Therefore, make the following edits:

<pre>
&lt;settings&gt;
  ...
  &lt;profiles&gt;
    &lt;profile&gt;
      &lt;id&gt;apache-release&lt;/id&gt;
      &lt;properties&gt;
        &lt;gpg.passphrase&gt;xxx xxx xxx xxx xxx xxx xxx&lt;/gpg.passphrase&gt;
      &lt;/properties&gt;
    &lt;/profile&gt;
  &lt;/profiles&gt;
&lt;/settings&gt;
</pre>

In addition, to allow the release plugin to tag SVN changes, you must either add in your LDAP username/password or configure `.ssh`:

<pre>
&lt;settings&gt;
  ...
  &lt;servers&gt;
    ...
    &lt;server&gt;
      &lt;id&gt;apache.releases.https&lt;/id&gt;
      &lt;username&gt;xxxx&lt;/username&gt;
      &lt;password&gt;xxxx&lt;/password&gt;
    &lt;/server&gt;
  &lt;/servers&gt;
&lt;/settings&gt;
</pre>
