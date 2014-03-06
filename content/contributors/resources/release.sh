#
# parameterize
#

# artifact
ISISART=isis
# releaseVersion
ISISREL=1.4.0
# developmentVersion
ISISDEV=1.5.0-SNAPSHOT
# release candidate
ISISRC=RC1

PASSPHRASE="some secret phrase"

read -p "ISISART? ($ISISART): " ISISART
read -p "ISISREL? ($ISISREL): " ISISREL
read -p "ISISDEV? ($ISISDEV): " ISISDEV
read -p "ISISRC? ($ISISRC): " ISISRC
read -p "PASSPHRASE? ($PASSPHRASE): " PASSPHRASE

if [ -z $ISISART ]; then exit; fi
if [ -z $ISISREL ]; then exit; fi
if [ -z $ISISDEV ]; then exit; fi
if [ -z $ISISRC ]; then exit; fi
if [ -z $PASSPHRASE ]; then exit; fi

clear
echo "" 
echo "ISISART  : $ISISART" 
echo "ISISREL       : $ISISREL" 
echo "ISISDEV       : $ISISDEV" 
echo "ISISRC        : $ISISRC" 
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
git checkout -d $ISISART-$ISISREL-$ISISRC 

mvn release:prepare -P apache-release -D dryRun=true --batch-mode -Dgpg.passphrase=$PASSPHRASE -DreleaseVersion=$ISISREL -DdevelopmentVersion=$ISISDEV -Dtag=$ISISART-$ISISREL
if [ $? -ne 0 ]; then
    echo "mvn release:prepare -DdryRun=true failed :-("  >&2
    exit 1
fi

mvn release:prepare -P apache-release -D skipTests=true -Dresume=false -DreleaseVersion=$ISISREL -DdevelopmentVersion=$ISISDEV -Dtag=$ISISART-$ISISREL
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

rm -rf /tmp/$ISISART-$ISISREL
mkdir /tmp/$ISISART-$ISISREL

cp target/$ISISART-$ISISREL-source-release.zip /tmp/$ISISART-$ISISREL/.
pushd /tmp/$ISISART-$ISISREL
unzip $ISISART-$ISISREL-source-release.zip

cd $ISISART-$ISISREL
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

git push -u origin prepare/$ISISART-$ISISREL-$ISISRC
git push origin refs/tags/$ISISART-$ISISREL:refs/tags/$ISISART-$ISISREL-$ISISRC
git fetch
