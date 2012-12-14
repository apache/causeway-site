Title: Development Environment

#### Installing Git

The easiest place to get hold of command-line git is probably the [github download page](http://git-scm.com/downloads).

On Windows, this also installs the rather good mSysGit Unix shell.  We recommend that you enable git for both the mSysgit and the Windows command prompt:

<img src="resources/setting-up-git.png" width="400px"></img>

Once git is installed, the two main command line tools to note are:

- `git` command line tool
- `gitk` for viewing the commit history

Three commands in particular worth knowing:

<pre>git help <i>command</i></pre>

   will open the man page in your web browser

<pre>git gui</pre>

   will open up a basic GUI client to staging changes and making commits

<pre>gitk --all</pre>

   will open the commit history for all branches.  In particular, you should be able to see the local `master`, which branch you are working on (the `HEAD`), and also the last known position of the `master` branch from the central repo, called `origin/master`.

If using Windows, note that github also have a dedicated [Windows client](https://help.github.com/articles/set-up-git).  With a little [hacking around](http://haacked.com/archive/2012/05/30/using-github-for-windows-with-non-github-repositories.aspx), it can also be made to work with non-github repositories.

If using Mac, you might also want to check out Atlassian's [Sourcetree](http://www.atlassian.com/software/sourcetree/overview).



#### Cloning the Isis repo and Configuring

First, clone the Isis repo.  If you are **not a committer**, please see the [contributing](contributing.html) page for details on which repo to clone from.

**Committers**, meanwhile, should clone from the Apache read/write repo:

<pre>
git clone https://git-wip-us.apache.org/repos/asf/isis.git
</pre>

You should then configure your user name and password; see also [Apache's git](https://git-wip-us.apache.org/) docs:

<pre>
git config user.name "<i>My Name Here</i>"
git config user.email <i>myusername@apache.org</i>
</pre>

And, you should also configure the `core.autocrlf` so that line endings are normalized to LF (Unix style) in the rep; again see [Apache's git](https://git-wip-us.apache.org/) page: 

- on Windows, use:
<pre>git config core.autocrlf auto   
</pre>

- on Mac/Linux, use:
<pre>
git config core.autocrlf input
</pre>

The Windows setting means that files are converted back to CRLF on checkout; the Mac/Linux setting means that the file is left as LF on checkout.

We also recommend setting `core.safecrlf`, which aims to ensure that any line ending conversion is repeatable.  Do this on all platforms:

<pre>
git config core.safecrlf true
</pre>

Note that these settings are supplemented in the repo by the `.gitattributes` file and that explicitly specifies line handling treatment for most of the common file types that we have.

One final configuration that we recommend is for `git pull` to perform a rebase by default, rather than a merge.  This results in a linear log history.  If you want to explicitly have branches in the history, then you can always create a topic branch, discussed below:
<pre>
git config branch.autosetuprebase always
</pre>

If you don't use git outside of Apache, you can add the `--global` flag so that the above settings apply for all repos managed by git on your PC.

For further reading, see:

- [git config man page](http://www.kernel.org/pub/software/scm/git/docs/git-config.html)
- [.gitattributes man page](http://www.kernel.org/pub/software/scm/git/docs/gitattributes.html)
- [.gitattributes git-scm.com docs](http://git-scm.com/docs/gitattributes)


## Installing Maven

Install Maven 3.0.x, downloadable [here](http://maven.apache.org/download.html).

Set `MAVEN_OPTS` environment variable:

<pre>
MAVEN_OPTS=-Xms512m -Xmx1024m -XX:MaxPermSize=128m
</pre>



<!--
TODO: x-ref importing-projects
TODO: x-ref sharing projects
-->




## Building the Source Code

To build the source code, simply go to the root directory and type:

<pre>
mvn clean install
</pre>

Alternatively, you can go to the root of any of the components (eg as documented [here](release-process.html) and build each individually.