#!/usr/bin/env bash
pushd content
for a in $(ls -1 | grep -v schema | grep -v versions)
do
	    rm -rf $a
done
popd

pushd ../isis
cp -Rf antora/target/site/* ../isis-site/content/.
popd

git add .
