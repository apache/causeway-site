#!/usr/bin/env bash
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
