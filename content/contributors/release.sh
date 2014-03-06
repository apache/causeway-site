
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
echo "" >&2
echo "ARTIFACT  : $ARTIFACT" >&2
echo "REL       : $REL" >&2
echo "DEV       : $DEV" >&2
echo "RC        : $RC" >&2
echo "PASSPHRASE: (suppressed)" >&2



#
# release prepare
#
echo "" >&2
echo "" >&2
echo "" >&2
echo "#################################################" >&2
echo "release prepare" >&2
echo "#################################################" >&2
echo "" >&2
echo "" >&2
echo "" >&2


# eg isis-1.4.0-RC1
git checkout -d $ARTIFACT-$REL-$RC 

mvn release:prepare -P apache-release -D dryRun=true --batch-mode -Dgpg.passphrase=$PASSPHRASE -DreleaseVersion=$REL -DdevelopmentVersion=$DEV -Dtag=$ARTIFACT-$REL
mvn release:prepare -P apache-release -D skipTests=true -Dresume=false -DreleaseVersion=$REL -DdevelopmentVersion=$DEV -Dtag=$ARTIFACT-$REL


#
# sanity check
#
echo "" >&2
echo "" >&2
echo "" >&2
echo "#################################################" >&2
echo "sanity check" >&2
echo "#################################################" >&2
echo "" >&2
echo "" >&2
echo "" >&2

rm -rf /tmp/$ARTIFACT-$REL
mkdir /tmp/$ARTIFACT-$REL

cp target/$ARTIFACT-$REL-source-release.zip /tmp/$ARTIFACT-$REL/.
pushd /tmp/$ARTIFACT-$REL
unzip $ARTIFACT-$REL-source-release.zip

cd $ARTIFACT-$REL
mvn clean install

cat DEPENDENCIES

popd


#
# release perform
#
echo "" >&2
echo "" >&2
echo "" >&2
echo "#################################################" >&2
echo "release perform" >&2
echo "#################################################" >&2
echo "" >&2
echo "" >&2
echo "" >&2

mvn release:perform -P apache-release


#
# nexus
#
echo "" >&2
echo "" >&2
echo "" >&2
echo "#################################################" >&2
echo "nexus staging" >&2
echo "#################################################" >&2
echo "" >&2
echo "" >&2
echo "" >&2
read -p "Hit enter when staged in nexus (else ^C): " CONFIRM



#
# git push branch/tag
#
echo "" >&2
echo "" >&2
echo "" >&2
echo "#################################################" >&2
echo "git push branch/tag" >&2
echo "#################################################" >&2
echo "" >&2
echo "" >&2
echo "" >&2

git push -u origin prepare/$ARTIFACT-$REL-$RC
git push origin refs/tags/$ARTIFACT-$REL:refs/tags/$ARTIFACT-$REL-$RC
git fetch
