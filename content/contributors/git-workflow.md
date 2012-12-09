Title: git workflow

This page explains how you can contribute to Apache Isis.  Thanks for considering to help out, your contributions are appreciated!

*There is some overlap between this material and that in [Using Git](using-git.html) page.  We intend to merge the two pages; for now, please read both.*

##Identify Work

[JIRA](https://issues.apache.org/jira/browse/ISIS) and the [mailing lists](http://isis.apache.org/support.html) are great places to start. If you have your own ideas to improve or extend Isis it's a good practice to create a ticket in JIRA and/or discuss this in the mailing lists. You probably get some useful feedback and support.

##Clone the Isis source code

Isis' source code is hosted in an Apache git repo ([https](https://git-wip-us.apache.org/repos/asf/isis.git), [http](http://git-wip-us.apache.org/repos/asf/isis.git)), with a clone on github ([https](https://github.com/apache/isis.git), [ssh](git@github.com:apache/isis.git)).


**If you are a committer** then you can clone directory from the Apache git repo:

<pre>
git clone https://git-wip-us.apache.org/repos/asf/isis.git apache-isis
cd apache-isis
git checkout -t origin/master
</pre>

This will set up your local `master` branch as a tracking branch of the `origin/master` branch.


**If you are not a committer** but would like to contribute patches then the easiest thing is probably to create a fork in github.  You use this fork to (a) provide an initial copy of the code, and (b) provide a place to share your changes with the project maintainers, generating patches etc.

You can create a fork through the github website; you'll end up with a repo called something like `https://github.com/yourname*/isis.git`.  Once created, you should clone your new fork to your computer.  On Windows, use github's 'Clone in Windows' feature; on Mac/Linux create a clone from the command line:

<pre>
git clone https://github.com/<i>yourname</i>/isis.git apache-isis
cd apache-isis
git checkout master
</pre>

What you'll also want to do is to add a remote to the original Apache Isis repo that you forked.  This remote is traditionally called `upstream`.  You should then arrange for your `master` branch to track the `upstream/master` remote branch:

<pre>
git remote add upstream https://github.com/apache/isis.git
git pull upstream
git branch --set-upstream master upstream/master
</pre>

You can now fetch any more recent commits from the upstream repo using simply:
<pre>
git fetch
</pre>

Because you've just created your fork, most likely the upstream's `master` branch will be the same as your local `master` and your github fork's `origin/master` (all three will point to the same commit).  Use `gitk --all` to confirm.

For more info on tracking branches [here](http://git-scm.com/book/en/Git-Branching-Remote-Branches) and [here](http://gitready.com/beginner/2009/03/09/remote-tracking-branches.html).

##Sample Git Workflow

For this example, suppose that you've decided to work on JIRA ticket #123, an enhancement to support Blob/Clob datatypes.

#### Update your master branch

We're assuming you have cloned the Isis repository as per the example above. Let's first make sure your fork is up-to-date, by retrieving new commits from upstream repo and then merging them as a fast-forward into your local branch.

If a committer, your upstream is simply the `origin`.  If not a committer, your upstream is the `upstream` remote.  In either case, because your local `master` branch is tracking the appropriate remote's `master` branch, the same commands work:

<pre>
git checkout master
git fetch
git merge --ff-only
</pre>

Alternatively, you can combine the `git fetch` and `git merge` and just use `git pull`:
<pre>
git checkout master
git pull --ff-only
</pre>

If the `merge` or `pull` fails, it means that you must have made commits and there have been changes meanwhile on the remote `master`'s branch.  Use `gitk --all` to confirm.  There's a procedure below to retrospectively sort out this situation.


#### Create a topic branch

We recommend you name topic branches by the JIRA ticket, ie <tt>ISIS-nnn-description</tt>.   So let's create a new branch based off `master` and call it "ISIS-123-blobs"

<pre>
git checkout master
git checkout -b ISIS-123-blobs
</pre>

You can confirm the branch is there and is your new `HEAD` using either `gitk --all`.  Alternatively, use the command line:
<pre>
$ git branch
master
* ISIS-123-blobs
</pre>

The command line prompt should also indicate you are on a branch, isolated from any changes that might happen on the `master` branch.

###Make File Changes and Commit

Next, make changes to your files using the usual commands:

* `git add`
* `git mv`
* `git rm`
* `git commit`
* `git status`

and so on.

Continue this way until happy with the change.  Remember to run all your tests on the topic branch (including a full `mvn clean install`).

###Reintegrating with `master`

Before you can share your change, you should reintegrate your changes with the `master` branch.  

The first thing to do is to pull down any changes made in upstream remote's `master` since you started your topic branch:

<pre>
git checkout master
git pull --ff-only
</pre>

These are the same commands that you would have run before you created your topic branch.  If you use `gitk --all`, there's a good chance that new commits have come in.

If you are a committer, you'll see that the remote `origin/master` has most likely advanced.  If you are not a committer, you'll similarly see that the remote `upstream/master` has advanced.  (For non-committers, the `origin/master` won't ever advance because this is simply your fork taken a while back).

Because you've been working in a topic branch, your local `master` branch and the remote `master` branch's should be pointing to the same commit.

Next, we reintegrate our topic branch by rebasing onto master:
<pre>
git checkout ISIS-123-blobs
git rebase master
</pre>

This takes all of the commits in your branch, and applies them on top of the new `master` branch.  When your change is eventually integrated back in, it will result in a nice clear linear history on the public repo.

### Committers only: pushing the changes

**If you are a committer**, you can now simply do a fast forward merge of master, and then push the changes:

<pre>
git checkout master
git merge --ff-only ISIS-123-blobs
git push
</pre>

Because the `master` branch is a direct ancestor of the topic branch, the fast-forward merge should work.  The `git push` then pushes those changes back to the master Isis repo.

To clean up, you can delete your topic branch:
<pre>
git branch -d ISIS-123-blobs
</pre>

And committers are done.

### Non-committers: Making your branch available remotely

For non-committers, your changes must be applied by a project maintainer.  So what you need to do is make those code changes available for review.  This is where your Github fork comes in.

Make sure you've checked out your topic branch, and the push the changes to github (`origin` remote):
<pre>
git checkout ISIS-123-blobs
git push -u origin ISIS-123-blobs
</pre>
This will create a corresponding branch in the remote github repo.  If you use `gitk --all`, you'll also see a `remotes/origin/ISIS-123-blobs` branch.

With your topic branch onto your fork, an Isis maintainer can review and merge the topic branch into the main repository.

The easiest way to inform the Isis maintainer is by raising a *pull request* in Github.  Pull requests sent to the Apache GitHub repositories should forward a pull request e-mail to the [dev mailing list](../support.html), so we recommend that you sign up to the dev mailing list first before issuing your pull request.  

To raise the pull request:

* Open a web browser to your GitHub account's Isis fork.
* Select your topic branch so that the pull request references the topic branch.
* Click the Pull Request button.
* Notifying the Mailing List

Assuming you've already subscribed to the dev mailing list, you can check that your request came through.


####If your pull request is accepted

To double check that your pull request is accepted, update your `master` branch from the `upstream` remote:

<pre>
git checkout master
git pull
</pre>

You can then use `gitk --all` (or `git log` if you prefer the command line) to check your contribution has been added.

You can now delete your topic branch and remove the branch in your github:

<pre>
git branch -D ISIS-123-blobs
git push origin --delete ISIS-123-blobs
</pre>

Finally, you probably want to push the latest changes in master back up to github.

<pre>
git checkout master
git push origin master
</pre>

####If your pull Request is rejected

In this case, you just need to update your branch from the main repository and then address the rejection reason.

<pre>
git checkout master
git pull
git checkout ISIS-123-blogs
git rebase master
</pre>

You'll probably also want to remove the remote branch on github:
<pre>
git push origin --delete ISIS-123-blobs
</pre>

... and continue as before until you are ready to resubmit your change.


## If you've accidentally worked on `master` branch

If at any time the `git pull` from your upstream fails, it most likely means that you must have made commits on the `master` branch.  You can use `gitk --all` to confirm; at some point in time both `master` and `origin\master` will have a common ancestor.

You can retrospectively create a topic branch for the work you've accidentally done on `master`.  

First, create a branch for your current commit:
<pre>
git branch <i>newbranch</i>
</pre>

Next, make sure you have no outstanding edits.  If you do, you should commit them or stash them:

<pre>
git stash
</pre>

Finally, locate the shaId of the commit you want to roll back to (easily obtained in `gitk -all`), and wind `master` branch back to that commit:
<pre>
git checkout master
git reset --hard <i>shaId</i>      # move master branch shaId of common ancestor
</pre>

