Title: Applying Patches

If a patch is received on a JIRA ticket, then it should be reviewed and applied.  The commands are slightly different for diff files vs patch files.

## Diff files

If a diff file has been provided, then it can easily be applied using eGit's wizards  (Eclipse's Git integration)...


>this stuff needs fleshing out...

## Patch files

If a patch file has been povided, then it can be applied using command line tools.

First, take a look at what changes are in the patch. You can do this easily with `git apply`

    git apply --stat ISIS-xxx.patch

Note that this command does not apply the patch, but only shows you the stats about what it’ll do. After peeking into the patch file with your favorite editor, you can see what the actual changes are.

Next, you’re interested in how troublesome the patch is going to be. Git allows you to test the patch before you actually apply it.

    git apply --check ISIS-xxx.patch

If you don’t get any errors, the patch can be applied cleanly. Otherwise you may see what trouble you’ll run into.

To apply the patch, use:

    git apply ISIS-xxx.patch

Review changes.  Then commit the changes, using the `--signoff` flag to indicate that you reviewed and were happy with the contributed changes:

    git commit -m "..." --signoff

Alternatively, if you want to do the apply and commit/signoff in a single step, use `git am`:

    git am --signoff < ISIS-xxx.patch

Information adapted from [this blog post](https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/)

