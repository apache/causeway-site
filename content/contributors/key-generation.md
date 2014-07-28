Title: Key Generation

In order that a contributor can make a release it is necessary for them to have generated a key and had that key recognized by other members of the Apache Software Foundation. 

For further background information on this topic, see the [release signing page](http://www.apache.org/dev/release-signing.html) and the [openpgp page](http://www.apache.org/dev/openpgp.html#generate-key) on the Apache wiki.

## Install and Configure gpg

Download and install GnuPG (gpg), version 1.4.10 or higher.

Then, edit `~/.gnupg/gpg.conf` (on Windows, the file to edit is `C:\Users\xxx\AppData\Roaming\gnupg\gpg.conf`) so that the default is to generate a strong key:

<pre>
personal-digest-preferences SHA512
cert-digest-algo SHA512
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
</pre>


## Key Generation

The ASF requires that keys are signed with a key (or subkey) based on RSA 4096 bits. To do this:

<pre>
$ gpg --gen-key
gpg (GnuPG) 1.4.11; Copyright (C) 2010 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Please select what kind of key you want:
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (sign only)
   (4) RSA (sign only)
Your selection?
</pre>

Specify RSA key:

<pre>
Your selection? 1

RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048)
</pre>

Specify key length as 4096 bits:

<pre>
What keysize do you want? (2048) 4096
Requested keysize is 4096 bits

Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for? (0)
</pre>

Specify key as non-expiring:

<pre>
Key is valid for? (0) 0
Key does not expire at all
Is this correct? (y/N) y

You need a user ID to identify your key; the software constructs the user ID
from the Real Name, Comment and Email Address in this form:
    "Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>"

Real name: 
</pre>

Enter your name, email and comment:

- use your apache.org email
- the comment should be "CODE SIGNING KEY"

<pre>
Real name: Xxx Xxxxxxxxx
Email address: <xxx@apache.org>
Comment: CODE SIGNING KEY
You selected this USER-ID:
    "Xxx Xxxxxxxxx (CODE SIGNING KEY) <xxx@apache.org>"

Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O

You need a Passphrase to protect your secret key.
Enter passphrase:
</pre>

Provide a passphrase to secure your key.

<pre>
Enter passphrase:
Repeat passphrase:
</pre>

GPG will goes on to generate your key:

<pre>
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
...+++++
.........................+++++
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
....+++++
...+++++
gpg: key nnnnnnnn marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   4096R/nnnnnnnn yyyy-mm-dd
      Key fingerprint = xxxx xxxx xxxx xxxx xxxx  xxxx xxxx xxxx xxxx xxxx
uid                  Xxx Xxxxxx <xxx@apache.org>
sub   4096R/kkkkkkkk yyyy-mm-dd
</pre>

The public key with id nnnnnnnn should now be stored in `~/.gnupg/pubring.pgp` (on Windows 7, this is in `c:/Users/xxx/AppData/Roaming/gnupg/pubring.pgp`).

To confirm the key has been generated, use:

<pre>
$ gpg --list-keys --fingerprint
</pre>

The key Id is the one true way to identify the key, and is also the last 8 digits of the fingerprint. The corresponding secret key for id `nnnnnnnn` is stored in `~/.gnupg/secring.pgp` (on Windows 7, this is in `c:/Users/xxx/AppData/Roaming/gnupg/secring.pgp`).

It's also worth confirming the key has the correct preference of algorithms (reflecting the initial configuration we did earlier). For this, enter the gpg shell for your new key:

<pre>
$ gpg --edit-key nnnnnnnnn
>gpg
</pre>

where `nnnnnnnn` is your key id. Now, use the 'showpref' subcommand to list details:

<pre>
gpg> showpref
[ultimate] (1). Xxx Xxxxxxxx (CODE SIGNING KEY) <xxx@apache.org>
     Cipher: AES256, AES192, AES, CAST5, 3DES
     Digest: SHA512, SHA384, SHA256, SHA224, SHA1
     Compression: ZLIB, BZIP2, ZIP, Uncompressed
     Features: MDC, Keyserver no-modify

gpg>
</pre>

The Digest line should list SHA-512 first and SHA-1 last. If it doesn't, use the "setpref" command:
<pre>
setpref SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
</pre>

Finally, remember to take a backup of your key and the keyring (ie, backup the `.gnupg` directory and its contents).


## Subkey Generation

It's recommended to use a subkey with an expiry date to sign releases, rather than your main, non-expiring key. If a subkey is present, then gpg will use it for signing in preference to the main key.

{note

After (binary) release artifacts are created, they are deployed to the ASF's Nexus staging repository. However, Nexus seems unable to retrieve a subkey from the public key server. Until we find a fix/workaround for this, all releases should be signed just with a regular non-expiring main key.

}

To create a subkey Enter the gpg shell using (the identifier of) your main key:

<pre>
gpg --edit-key xxxxxxxx
gpg>
</pre>

Type 'addkey' to create a subkey, and enter your passphrase for the main key:

<pre>
gpg> addkey
Key is protected.
[enter your secret passphrase]

You need a passphrase to unlock the secret key for
user: "Dan Haywood (CODE SIGNING KEY) <danhaywood@apache.org>"
4096-bit RSA key, ID xxxxxxxx, created 2011-02-01

Please select what kind of key you want:
   (3) DSA (sign only)
   (4) RSA (sign only)
   (5) Elgamal (encrypt only)
   (6) RSA (encrypt only)
Your selection?
</pre>

Select (6) to choose an RSA key for encryption:

{note

It would seem that Nexus repository manager does not recognize RSA subkeys with an 'S'ign usage; see this discussion on a mailing list and this issue on Sonatype's JIRA

}

<pre>
Your selection? 6

RSA keys may be between 1024 and 4096 bits long.
What keysize do you want? (2048) 4096

Requested keysize is 4096 bits

Please specify how long the key should be valid.
         0 = key does not expire
      <n>  = key expires in n days
      <n>w = key expires in n weeks
      <n>m = key expires in n months
      <n>y = key expires in n years
Key is valid for?
</pre>

Specify that the key is valid for 1 year:

<pre>
Key is valid for? (0) 1y

Key expires at yy/MM/dd hh:mm:ss
Is this correct? (y/N) y
Really create? (y/N) y
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
...+++++
.+++++

pub  4096R/xxxxxxxx  created: yyyy-mm-dd  expires: never       usage: SC
                     trust: ultimate      validity: ultimate
sub  4096R/xxxxxxxx  created: yyyy-mm-dd  expires: yyYY-mm-dd  usage: E
[ultimate] (1). Dan Haywood (CODE SIGNING KEY) <danhaywood@apache.org>

gpg>
</pre>

Quit the gpg shell; you now have a subkey.


## Generate a Revocation Certificate

It's good practice to generate a number of revocation certificates so that the key can be revoked if it happens to be compromised. See the [gpg page](http://www.apache.org/dev/openpgp.html#revocation-certs) on the Apache wiki for more background on this topic.

First, generate a "no reason specified" key:

<pre>
$ gpg --output revoke-nnnnnnnn-0.asc --armor --gen-revoke nnnnnnnn

sec  4096R/nnnnnnnn yyyy-mm-dd Xxx Xxxxxxx (CODE SIGNING KEY) <xx@apache.org>
Create a revocation certificate for this key? (y/N) Y

Please select the reason for the revocation:
  0 = No reason specified
  1 = Key has been compromised
  2 = Key is superseded
  3 = Key is no longer used
  Q = Cancel
(Probably you want to select 1 here)
Your decision?
</pre>

Select 0.

<pre>
Your decision? 0

Enter an optional description; end it with an empty line:
</pre>

Provide a description:

<pre>
> Generic certificate to revoke key, generated at time of key creation.
>
Reason for revocation: No reason specified
Generic certificate to revoke key, generated at time of key creation.
Is this okay? (y/N)
</pre>

Confirm this is ok.

<pre>
Is this okay? y

You need a passphrase to unlock the secret key for
user: "Xxx Xxxxxxx (CODE SIGNING KEY) <xxx@apache.org>"
4096-bit RSA key, ID nnnnnnnn, created yyyy-mm-dd

Enter passphrase:
</pre>

Enter a passphrase:

<pre>
Enter passphrase:
Revocation certificate created.

Please move it to a medium which you can hide away; if Mallory gets
access to this certificate he can use it to make your key unusable.
It is smart to print this certificate and store it away, just in case
your media become unreadable.  But have some caution:  The print system of
your machine might store the data and make it available to others!
</pre>

The file `revoke-nnnnnnnn-0.asc` should be created: Then, backup this file.

Now repeat the process to create two further revocation certificates:

- `gpg --output revoke-nnnnnnnn-1.asc --armor --gen-revoke nnnnnnnn`

  Specify reason as "1 = Key has been compromised"

- `gpg --output revoke-nnnnnnnn-3.asc --armor --gen-revoke nnnnnnnn`

  Specify reason as "3 = Key is no longer used"

Backup these files also.

{note

if you find that you need to revoke your certificate, this blog post explains how.

}

## Publish Key

It is also necessary to publish your key. There are several places where this should be done. In most cases, you'll need the "armored" " (ie ASCII) representation of your key. This can be generated using:

<pre>
$ gpg --armor --export nnnnnnnn > nnnnnnnn.asc
</pre>

where `nnnnnnnn` is the id of your public key.

You'll also need the fingerprint of your key. This can be generated using:

<pre>
$ gpg --fingerprint nnnnnnnn
</pre>

The output from this command includes a line beginning "Key fingerprint", followed by a (space delimited) 40 character hexadecimal fingerprint. The last 8 characters should be the same as the key id (`nnnnnnnn`).

### Publish to a public key server

To a publish your key to a public key server (eg the MIT key server hosted at [http://pgp.mit.edu](http://pgp.mit.edu)), use the procedure below. Public key servers synchronize with each other, so publishing to one key server should be sufficient. For background reading on this, see the [release signing page](http://www.apache.org/dev/release-signing.html#keyserver-upload) on the Apache wiki, and the [gpg key page](http://maven.apache.org/developers/release/pmc-gpg-keys.html) on the Maven wiki.

To send the key up to the key server:

<pre>
$ gpg --send-keys --keyserver pgp.mit.edu nnnnnnnn
</pre>

where `nnnnnnnn` is the key Id.

Alternatively, you can browse to the [MIT key server](http://pgp.mit.edu/) and paste in the armored representation of your key.

Confirm the key has been added by browsing to submitting the following URL:

`http://pgp.mit.edu:11371/pks/lookup?search=0xnnnnnnnnn&op=vindex`

again, where `nnnnnnnn` is the key Id.

### Publish to your Apache home directory

The armored representation of your public key should be uploaded to your home directory on `people.apache.org`, and renamed as `.pgpkey`. Make sure this is readable by all.

### Publish to your Apache HTML home directory

The armored representation of your public key should be uploaded to your `public_html` home directory on `people.apache.org`, named `nnnnnnnn.asc`. Make sure this is readable by all.

Check the file is accessible by browsing to:

`http://people.apache.org/~xxxxxxxx/nnnnnnnn.asc`

where

- `xxxxxxxx` is your apache LDAP user name
- `nnnnnnnn` is your public key id.

### FOAF

First, check out the committers/info directory:

<pre>
svn co https://svn.apache.org/repos/private/committers/info
</pre>

Go to Apache [FOAF-a-matic](http://people.apache.org/foaf/foafamatic.html) web page to generate the FOAF file text (we copy this text out in a minute):

- enter ASF LDAP user name
- enter First name, Last name
- for PGP key fingerprints, add Key
  - paste in the key id
  - paste in the fingerprint
- press "Create"

In the box below, you should have a FOAF file, something like:

<pre>
<?xml version="1.0" encoding="UTF-8"?>
&lt;rdf:RDF
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
      xmlns:foaf="http://xmlns.com/foaf/0.1/"
      xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
      xmlns:pm="http://www.web-semantics.org/ns/pm#"
      xmlns:wot="http://xmlns.com/wot/0.1/"
      xmlns:rss="http://purl.org/rss/1.0/"
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:ical="http://www.w3.org/2002/12/cal/ical#"
      xmlns:doap="http://usefulinc.com/ns/doap#"&gt;
  &lt;foaf:Person rdf:ID="danhaywood"&gt;
    &lt;foaf:name&gt;Xxx Xxxxxxxx&lt;/foaf:name&gt;
    &lt;foaf:givenname&gt;Xxx&lt;/foaf:givenname&gt;
    &lt;foaf:family_name&gt;Xxxxxxxx&lt;/foaf:family_name&gt;
    &lt;wot:hasKey&gt;
      &lt;wot:PubKey&gt;
        &lt;wot:fingerprint&gt;nnnn nnnn nnnn nnnn nnnn  nnnn nnnn nnnn nnnn nnnn&lt;/wot:fingerprint&gt;
        &lt;wot:hex_id&gt;nnnnnnnn&lt;/wot:hex_id&gt;
      &lt;/wot:PubKey&gt;
    &lt;/wot:hasKey&gt;
  &lt;/foaf:Person&gt;
&lt;/rdf:RDF&gt;
</pre>

(If you are creating the FOAF file for the first time, you may want to add additional details).

From this, copy out the `wot:key`, and paste into your FDF file in `committers/info`:

<pre>
    &lt;wot:hasKey&gt;
      &lt;wot:PubKey&gt;
        &lt;wot:fingerprint&gt;nnnn nnnn nnnn nnnn nnnn  nnnn nnnn nnnn nnnn nnnn&lt;/wot:fingerprint&gt;
        &lt;wot:hex_id&gt;nnnnnnnn&lt;/wot:hex_id&gt;
      &lt;/wot:PubKey&gt;
    &lt;/wot:hasKey&gt;
</pre>

Then, manually add in a `<wot:pubkeyAddress>` element within `<wot:PubKey>`:

<pre>
    &lt;wot:hasKey&gt;
      &lt;wot:PubKey&gt;
        &lt;wot:fingerprint&gt;nnnn nnnn nnnn nnnn nnnn  nnnn nnnn nnnn nnnn nnnn&lt;/wot:fingerprint&gt;
        &lt;wot:hex_id&gt;nnnnnnnn&lt;/wot:hex_id&gt;
        &lt;wot:pubkeyAddress
          rdf:resource="http://people.apache.org/~username/nnnnnnnn.asc/&gt;
      &lt;/wot:PubKey&gt;
    &lt;/wot:hasKey&gt;
</pre>

ie, referencing your publically exported public key

Finally, commit your changes.

### Save to `KEYS`

The armored representation of the public key should be saved to Isis' `KEYS` file, [http://www.apache.org/dist/isis/KEYS](http://www.apache.org/dist/isis/KEYS) (that is, in the ASF distribution directory for Isis).

First, in a new directory, checkout this file:

<pre>
svn -N co https://svn.apache.org/repos/asf/isis/ .
</pre>
This should bring down the `KEYS` file.

Then, export your signature and armored representation.

<pre>
gpg --list-sigs nnnnnnnn >>KEYS
gpg --armor --export nnnnnnnn >>KEYS
</pre>

Then commit.

### id.apache.org

Log onto `id.apache.org` and ensure that the finger print of your public key is correct.


## Attend Key Signing Party (Apache web of trust)

It is strongly advised that the contributor attend a key signing party at an Apache event, in order that other Apache committers/members can in person verify their identity against the key. The process for this is described [here](http://www.apache.org/dev/release-signing.html#key-signing-party) and [here](http://wiki.apache.org/apachecon/PgpKeySigning).


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
