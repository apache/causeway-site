#!/usr/bin/env bash

#
# This variant of copyover.sh assumes that the git repos have been checked out with an additional directory for the worktree.
#
# github/apache/causeway/master
# github/apache/causeway-site/asf-site
#

pushd content
for a in $(ls -1 | grep -v schema | grep -v versions)
do
	    rm -rf $a
done
popd

pushd ../../causeway/master
cp -Rf antora/target/site/* ../../causeway-site/asf-site/content/.
popd

git add .
