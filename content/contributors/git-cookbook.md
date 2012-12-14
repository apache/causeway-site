Title: Git Cookbook

This page describes the commands often used while working with git.

In addition to these basic commands, please make sure you have read:

* [development environment](development-environment.html)
* [git policy](git-policy.html)
* [contributing](contributing.html)

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


## Common Workflows (Committers only)

The [contributing](contributing.html) page describes the workflow for non-committers.  This section is therefore primarily for the benefit of Isis **committers**.

### Working on `master`

The easiest way of working is to make your commits directly on your local `master`.  This is perhaps somewhat hacky, but acceptable for very small changes.

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

## Updating branch with latest

When you want to 'catch-up' with the changes made by others and in the remote `origin`, use:

<pre>
git checkout <i>branchname</i>
git rebase master
</pre>

This will reapply the commits from `origin` on top of the `master` branch.  If there are conflicts then they will occur a this point.  Conflicts are resolved by editing the file, then:

<pre>
git add <i>filename</i>
git rebase --continue
</pre>

Once the rebase is finished, you'll see the branch *branchname* as a direct descendent of `master` (use `gitk --all` to confirm).  You will still be on the *branchname*.  To catch up `master`, use:

<pre>
git checkout master
git merge <i>branchname</i> --ff-only
</pre>

The `--ff-only` ensures that the merge is a fast-forward; ie all commits will have only a single parent, and no conflicts.

At this point you can delete the branch:

<pre>
git branch -d <i>branchname</i>
</pre>

## Push the changes

Immediately prior to pushing your changes, check one more time that you are up-to-date:

<pre>
git fetch
</pre>

If this pulls down any commits, then reintegrate first (using `git rebase`) and try again.

Assuming that now new commits were brought down, you can now simply do a fast forward merge of master, and then push the changes:

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


## More advanced use cases

### If accidentally push to remote

Suppose you committed to `master`, and then pushed the change, and then decided that you didn't intend to do that:

<pre>
C1  -  C2  -  C3  -  C4  -  C5  -  C6  -  C7
                                          ^
                                          master
                                          ^
                                          origin/master
</pre>

To go back to an earlier commit, first we wind back the local `master`:

<pre>
git reset --hard C5
</pre>
where `C5` is the long sha-id for that commit.

This gets us to:

<pre>
C1  -  C2  -  C3  -  C4  -  C5  -  C6  -  C7
                            ^
                            master
                                          ^
                                          origin/master
</pre>

Then, do a force push:

<pre>
git push origin master --force
</pre>

If this doesn't work, it may be that the remote repo has disabled this feature.  There are other hacks to get around this, see for example [here](http://stackoverflow.com/questions/1377845/git-reset-hard-and-a-remote-repository).





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



