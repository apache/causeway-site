#!/usr/bin/env bash

#
# This script assumes that the git repos have been checked out alongside each other:
#
# github/apache/causeway
# github/apache/causeway-site
#

pushd content
for a in $(ls -1 | grep -v schema | grep -v versions)
do
	    rm -rf $a
done
popd

pushd ../causeway
cp -Rf antora/target/site/* ../causeway-site/content/.
popd

git add .
