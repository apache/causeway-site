Title: Git Policy

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

There are many ways of using Git, but the only real prescriptive advice here is:

**commits should only have one parent**.

Doing this keeps the commit history clean; even though work actually happens in parallel, in the commit history it will look like all work was done serially.

This is accomplished using `git rebase`; the idea being that any changes that you make locally are re-applied on top of the latest fetch from the `master` branch.  The [cookbook](git-cookbook.html) page describes how to do this in detail.

Many other projects also work this way; a good write-up of how SpringSocial use git can be found [here](https://github.com/SpringSource/spring-social/wiki/Contributing).

## Commit message

#### Commit message format

The minimum we expect in a commit messages is:

<pre>
ISIS-nnn: brief summary here

- optionally, longer details
- should be written here
- in bullet points
</pre>

where `ISIS-nnn` is a ticket raised in our [JIRA issue tracker](https://issues.apache.org/jira/browse/ISIS).

For non-committers we typically expect more detail again; see the [contributing](contributing.html) page for the longer format recommended for contributors to use.