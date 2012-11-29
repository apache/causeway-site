Title: Using Git

*See [INFRA-5502](https://issues.apache.org/jira/browse/INFRA-5502) for current status on our move from svn to git*

## Introduction

These notes recommend how contributors should work with git.  To understand these notes, the only real concepts that you need to grok are:

- git commits form an acyclic graph, with each commit pointing to its parent commit (or commit**s**, if a merge)

- a branch is merely a pointer to one of these commits; git calls the main branch `master`

- git commits happen in two steps: first they are added to the index (also called the staging area), then they are committed.

For more background reading, see:

- [Pro Git](http://git-scm.com/book) book (free in electronic form)
- [Git community book](https://github.s3.amazonaws.com/media/book.pdf)
- [git reset demystified](http://git-scm.com/2011/07/11/reset.html) - differentiating the working directory vs index/staging area

And, of course, there is loads of good advice on [stackoverflow.com](http://stackoverflow.com/questions/tagged/git)

## General principle

There are many ways of using Git, but the only real prescriptive advice here is that commits should only have one parent.  Doing this keeps the commit history clean; even though work actually happens in parallel, in the commit history it will look like all work was done serially.

This is accomplished using `git rebase`; the idea being that any changes that you make locally are re-applied on top of the latest fetch from the `master` branch.  Many other projects also work this way; a good write-up of how SpringSocial use git can be found [here](https://github.com/SpringSource/spring-social/wiki/Contributing).

## Basics

#### Installing Git

The easiest place to get hold of command-line git is probably the [github download page](http://git-scm.com/downloads). On Windows, this also installs the rather good mSysGit Unix shell.

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


#### Git clone

<pre>
git clone url  # awaiting url, pending completion of INFRA-5502
</pre>


#### Commit message format

Commit messages should follow the format:

<pre>
ISIS-nnn: brief summary here

- optionally, longer details
- should be written here
- in bullet points
</pre>

where `ISIS-nnn` is a ticket raised in our [JIRA issue tracker](https://issues.apache.org/jira/browse/ISIS).


#### Modifying existing files

To modify existing files:

<pre>
git add <i>filename</i>
git commit -m "ISIS-nnn: yada yada"
</pre>

The `git add` command adds the changes to the file(s) to the git index (aka staging area).  If you were to make subsequent changes to the file these would not be committed.
 
The `git commit` takes all the staged changes and commits them locally.  Note that these changes are not shared public with Isis' central git repo.

You can combine these two commands using `-am` flag to git commit:

<pre>
git commit -am "ISIS-nnn: yada yada"
</pre>

#### Adding new files

To add a new file:

<pre>
git add .
git commit -m "ISIS-nnn: yada yada"
</pre>

Note that this sequence of commands is identical to modifying an existing file.  However, it isn't possible to combine the two steps using `git commit -am`; the `git add` is always needed when adding new files to the repo.

#### Deleting files

To delete a file:

<pre>
git rm filename
git commit -m "ISIS-nnn: yada yada"
</pre>

#### Renaming or moving files

To rename or move a file:

<pre>
git mv <i>filename</i> <i>newfilename</i>
git commit -m "ISIS-nnn: yada yada"
</pre>


## Common Workflows

### Working on master

With this option, you do nothing special locally, just commit to the `master` branch.

When you are ready to push your changes, use:

<pre>
git pull --rebase
</pre>

This will bring down all the latest commits made to the central repo, and update *origin/master*.  It will then apply all commits made in your master branch on top of that.

Alternatively, you can do this in two stages:

<pre>
git fetch                
git rebase origin/master
</pre>

After the `git fetch`, you will see that `gitk --all` shows the new set of commits as a branch separate from your own commits on branch.  The `git rebase` command then applies all your changes on top of that branch.  (Your original commits are orphaned and are eventually garbage collected by git).

### Creating a local branch

If you are working on a branch for a significant period (eg to implement a ticket), then it probably makes sense to create a local branch:

<pre>
git checkout -b <i>branchname</i>
</pre>

If you use `gitk --all`, then you'll see a new tag for the current commit.  The command line in the shell also changes.

Any commits made now advance the new branch, but leave the `master` branch alone.

If you want to switch to some other branch, use:

<pre>
git checkout <i>branchname</i>
</pre>

Any changes in your working directory and index/staging area are *preserved*.  This makes it easy to separate out different strands of work... you realize that some set of changes just made should be on a different ticket, so you create a new branch and commit those changes there.

When you want to reintegrate the changes into the branch, use:

<pre>
git checkout <i>branchname</i>
git rebase master
</pre>

This will reapply the commits on top of the `master` branch.  If there are conflicts then they will occur a this point.  Conflicts are resolved by editing the file, then:

<pre>
git add <i>filename</i>
git rebase --continue
</pre>

Once the rebase is finished, you'll see the branch *branchname* as a direct descendent of `master` (use `gitk --all` to confirm).  You will still be on the *branchname*.  To catch up `master`, use:

<pre>
git merge master --ff-only
</pre>

The `--ff-only` ensures that the merge is a fast-forward; ie all commits will have only a single parent, and no conflicts.

At this point you can delete the branch:

<pre>
git checkout master
git branch -d <i>branchname</i>
</pre>


## Backing up a local branch

If committing to a local branch, the changes are still just that: local, and run risk of a disk failure or other disaster.

To create a new, similarly named branch on the central repo, use:

<pre>
git push -u origin <i>branchname</i>
</pre>

Using `gitk --all` will show you this new branch, named *origin/branchname*.

Thereafter, you can push subsequent commits using simply:

<pre>
git push
</pre>

Doing this also allows others to collaborate on this branch, just as they would for `master`.

When, eventually, you have reintegrated this branch, you can delete the remote branch using:

<pre>
git push origin --delete <i>branchname</i>
</pre>

For more detail, see these blogs/posts [here](http://www.mariopareja.com/blog/archive/2010/01/11/how-to-push-a-new-local-branch-to-a-remote.aspx) and [here](http://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-both-locally-and-in-github).

### Quick change: stashing changes

If you are working on something but are not ready to commit, then use:

<pre>
git stash
</pre>

If you use `gitk --all` then you'll see new commits are made that hold the current state of your working directory and staging area.

You can then, for example, pull down the latest changes using `git pull --rebase` (see above).

To reapply your stash, then use:

<pre>
git stash pop
</pre>

Note that stashing works even if switching branches


## Ignoring files

Put file patterns into `.gitignore`.  There is one at the root of the git repo, but they can additionally appear in subdirectories (the results are cumulative).

See also:

- [github's help page](https://help.github.com/articles/ignoring-files)
- [man page](http://www.kernel.org/pub/software/scm/git/docs/gitignore.html)


