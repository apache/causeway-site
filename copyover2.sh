#!/usr/bin/env bash

#
# This variant of copyover.sh assumes that the git repos have been checked out with an additional directory 
# for the worktree of causeway
#
# github/apache/causeway/main
# github/apache/causeway-site
#

pushd content
for a in $(ls -1 | grep -v schema | grep -v versions)
do
	    rm -rf $a
done
popd

pushd ../causeway/main
cp -Rf antora/target/site/* ../../causeway-site/content/.
popd

git add .
