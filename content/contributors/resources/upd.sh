#################################################################
#
# update the variables in this first section as required; 
# format is "old_ver new_ver"
#
# eg:
# isis_core="1.4.0 1.5.0"   # update from 1.4.0 to 1.5.0
# isis_core="1.4.0 1.4.0"   # don't update (since old_ver = new_ver)
# isis_core=""              # also don't update (no versions provided)
#
# It shouldn't be necessary to update anything else.
#
#################################################################

isis_core="1.4.0 1.5.0"
objectstore_jdo="1.4.1 1.5.0"
security_shiro="1.4.0 1.5.0"
security_file="1.4.0 1.4.0"
viewer_restfulobjects="2.2.0 2.3.0"
viewer_wicket="1.4.1 1.5.0"
archetype_todoapp="1.4.1 1.5.0"
archetype_simple="1.4.1 1.5.0"



#################################################################
# constants
#################################################################
repo_root=https://repository.apache.org/content/repositories/releases/org/apache/isis

zip="source-release.zip"
asc="$zip.asc"
md5="$zip.md5"




#################################################################
#
# isis_core
#
#################################################################
old_ver=`echo $isis_core | awk '{print $1}'`
new_ver=`echo $isis_core | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="core"
	fullname="isis"
	pushd isis-core

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# objectstore_jdo
#
#################################################################
old_ver=`echo $objectstore_jdo | awk '{print $1}'`
new_ver=`echo $objectstore_jdo | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="objectstore"
	localname="jdo"

	fullname="isis-$type-$localname"
	pushd component/$type/$localname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# security_file
#
#################################################################
old_ver=`echo $security_file | awk '{print $1}'`
new_ver=`echo $security_file | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="security"
	localname="file"

	fullname="isis-$type-$localname"
	pushd component/$type/$localname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# security_shiro
#
#################################################################
old_ver=`echo $security_shiro | awk '{print $1}'`
new_ver=`echo $security_shiro | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="security"
	localname="shiro"

	fullname="isis-$type-$localname"
	pushd component/$type/$localname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# viewer_restfulobjects
#
#################################################################
old_ver=`echo $viewer_restfulobjects | awk '{print $1}'`
new_ver=`echo $viewer_restfulobjects | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="viewer"
	localname="restfulobjects"

	fullname="isis-$type-$localname"
	pushd component/$type/$localname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# viewer_wicket
#
#################################################################
old_ver=`echo $viewer_wicket | awk '{print $1}'`
new_ver=`echo $viewer_wicket | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="viewer"
	localname="wicket"

	fullname="isis-$type-$localname"
	pushd component/$type/$localname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$zip

	popd
fi



#################################################################
#
# archetype_todoapp
#
#################################################################
old_ver=`echo $archetype_todoapp | awk '{print $1}'`
new_ver=`echo $archetype_todoapp | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="archetype"
	fullname="quickstart_wicket_restful_jdo-archetype"
	pushd $type/$fullname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$zip

	popd
fi


#################################################################
#
# archetype_simple
#
#################################################################
old_ver=`echo $archetype_simple | awk '{print $1}'`
new_ver=`echo $archetype_simple | awk '{print $2}'`

if [ "$old_ver" != "$new_ver" ]; then 

	type="archetype"
	fullname="simple_wicket_restful_jdo-archetype"
	pushd $type/$fullname

	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$md5
	svn add $fullname-$new_ver-$md5
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$asc
	svn add $fullname-$new_ver-$asc
	curl -O $repo_root/$type/$fullname/$new_ver/$fullname-$new_ver-$zip
	svn add $fullname-$new_ver-$zip

	svn delete $fullname-$old_ver-$md5
	svn delete $fullname-$old_ver-$asc
	svn delete $fullname-$old_ver-$zip

	popd
fi

