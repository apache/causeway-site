#
# parameterize
#

ARTIFACT=isis
REL=1.4.0
DEV=1.5.0-SNAPSHOT
RC=RC1
PASSPHRASE="some secret phrase"

read -p "ARTIFACT? ($ARTIFACT): " ARTIFACT
read -p "REL? ($REL): " REL
read -p "DEV? ($DEV): " DEV
read -p "RC? ($RC): " RC
read -p "PASSPHRASE? ($PASSPHRASE): " PASSPHRASE

if [ -z $ARTIFACT ]; then exit; fi
if [ -z $REL ]; then exit; fi
if [ -z $DEV ]; then exit; fi
if [ -z $RC ]; then exit; fi
if [ -z $PASSPHRASE ]; then exit; fi

clear
echo "" 
echo "ARTIFACT  : $ARTIFACT" 
echo "REL       : $REL" 
echo "DEV       : $DEV" 
echo "RC        : $RC" 
echo "PASSPHRASE: (suppressed)" 



#
# release prepare
#
echo "" 
echo "" 
echo "" 
echo "#################################################" 
echo "release prepare" 
echo "#################################################" 
echo "" 
echo "" 
echo "" 


# eg isis-1.4.0-RC1
git checkout -d $ARTIFACT-$REL-$RC 

mvn release:prepare -P apache-release -D dryRun=true --batch-mode -Dgpg.passphrase=$PASSPHRASE -DreleaseVersion=$REL -DdevelopmentVersion=$DEV -Dtag=$ARTIFACT-$REL
if [ $? -ne 0 ]; then
    echo "mvn release:prepare -DdryRun=true failed :-("  >&2
    exit 1
fi

mvn release:prepare -P apache-release -D skipTests=true -Dresume=false -DreleaseVersion=$REL -DdevelopmentVersion=$DEV -Dtag=$ARTIFACT-$REL
if [ $? -ne 0 ]; then
    echo "mvn release:prepare failed :-("  >&2
    exit 1
fi


#
# sanity check
#
echo "" 
echo "" 
echo "" 
echo "#################################################" 
echo "sanity check" 
echo "#################################################" 
echo "" 
echo "" 
echo "" 

rm -rf /tmp/$ARTIFACT-$REL
mkdir /tmp/$ARTIFACT-$REL

cp target/$ARTIFACT-$REL-source-release.zip /tmp/$ARTIFACT-$REL/.
pushd /tmp/$ARTIFACT-$REL
unzip $ARTIFACT-$REL-source-release.zip

cd $ARTIFACT-$REL
mvn clean install
if [ $? -ne 0 ]; then
    echo "sanity check failed :-("  >&2
    popd
    exit 1
fi

cat DEPENDENCIES

popd


#
# release perform
#
echo "" 
echo "" 
echo "" 
echo "#################################################" 
echo "release perform" 
echo "#################################################" 
echo "" 
echo "" 
echo "" 

mvn release:perform -P apache-release
if [ $? -ne 0 ]; then
    echo "mvn release:perform failed :-("  >&2
    exit 1
fi


#
# nexus
#
echo "" 
echo "" 
echo "" 
echo "#################################################" 
echo "nexus staging" 
echo "#################################################" 
echo "" 
echo "" 
echo "" 
read -p "Hit enter when staged in nexus (else ^C): " CONFIRM



#
# git push branch/tag
#
echo "" 
echo "" 
echo "" 
echo "#################################################" 
echo "git push branch/tag" 
echo "#################################################" 
echo "" 
echo "" 
echo "" 

git push -u origin prepare/$ARTIFACT-$REL-$RC
git push origin refs/tags/$ARTIFACT-$REL:refs/tags/$ARTIFACT-$REL-$RC
git fetch
