#
# parameterize
#

if [ "$OS" == "Windows_NT" ]; then
    ISISTMP=/c/tmp
else
    ISISTMP=/tmp
fi

# artifact
ISISART=isis
# releaseVersion
ISISREL=1.4.0
# developmentVersion
ISISDEV=1.5.0-SNAPSHOT
# release candidate
ISISRC=RC1

read -p "ISISART? ($ISISART): " ISISART
read -p "ISISREL? ($ISISREL): " ISISREL
read -p "ISISDEV? ($ISISDEV): " ISISDEV
read -p "ISISRC? ($ISISRC): " ISISRC

if [ -z $ISISART ]; then exit; fi
if [ -z $ISISREL ]; then exit; fi
if [ -z $ISISDEV ]; then exit; fi
if [ -z $ISISRC ]; then exit; fi

clear
echo "" 
echo "ISISART   : $ISISART" 
echo "ISISREL   : $ISISREL" 
echo "ISISDEV   : $ISISDEV" 
echo "ISISRC    : $ISISRC" 



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

mvn release:prepare -P apache-release -D dryRun=true -DreleaseVersion=$ISISREL -DdevelopmentVersion=$ISISDEV -Dtag=$ISISART-$ISISREL
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

rm -rf $ISISTMP/$ISISART-$ISISREL
mkdir $ISISTMP/$ISISART-$ISISREL

cp target/$ISISART-$ISISREL-source-release.zip $ISISTMP/$ISISART-$ISISREL/.
pushd $ISISTMP/$ISISART-$ISISREL
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

mvn release:perform -P apache-release -DworkingDirectory=$ISISTMP/$ISISART-$ISISREL
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
