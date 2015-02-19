Title: Verify releases using a script

To save some time in verifying an Isis release we've assembled a script to automate the process. The script is tested on Mac OSX and Linux.  Windows users can use Cygwin or [msysgit](http://msysgit.github.io/).

It's **recommended** that you start this process in an empty directory:

	mkdir ~/verify-isis-release
	cd ~/verify-isis-release

## Copy the script to your local machine 
	
The script could be enhanced in many ways, feel free to do so! Copy (or [download](resources/verify-isis-release.sh)) the `verify-isis-release.sh` script below:
	
	#!/bin/bash
	# Instructions:
	# -Create an empty directory
	# -Put a .txt file in it containing a list of all the urls of the zip files
	# -Run this script
	# TODO: enhance this script so it will stop when something is broken
	_download(){
		for fil in `cat *.txt`
		do
			echo 'Downloading '$fil
			curl  -L -O $fil
			curl  -L -O $fil.asc
		done
	}
	_verify(){
		for zip in *.zip
		do 
			echo 'Verifying '$zip	
			gpg --verify $zip.asc $zip 
		done
	}
	_unpack(){
		echo 'Unpacking '
		unzip -q '*.zip'
	}
	_build(){
		echo 'Removing Isis from local repo '$module
		rm -rf ~/.m2/repository/org/apache/isis
		COUNTER=0
		for module in ./*/
		do
			COUNTER=$[COUNTER+1]
			if [ $COUNTER -eq 1 ]
			then
				cd $module
				echo 'Building Core '$module
				mvn clean install -o
				cd ..
			else
				cd $module
				echo 'Building Module '$module
				mvn clean install
				cd ..
			fi
		done
	}
	# The work starts here 
	_download
	_verify
	_unpack
	_build

Make sure the script is executable:

	chmod +x verify-isis-release.sh


## Create an input file

The input file is a plain .txt file containing all urls to the packages to be verfied. Here's a sample of the release of Isis 1.0.0:

    https://repository.apache.org/content/repositories/orgapacheisis-063/org/apache/isis/core/isis/1.0.0/isis-1.0.0-source-release.zip
    https://repository.apache.org/content/repositories/orgapacheisis-058/org/apache/isis/objectstore/isis-objectstore-jdo/1.0.0/isis-objectstore-jdo-1.0.0-source-release.zip
    https://repository.apache.org/content/repositories/orgapacheisis-059/org/apache/isis/security/isis-security-file/1.0.0/isis-security-file-1.0.0-source-release.zip
    https://repository.apache.org/content/repositories/orgapacheisis-060/org/apache/isis/viewer/isis-viewer-wicket/1.0.0/isis-viewer-wicket-1.0.0-source-release.zip
     https://repository.apache.org/content/repositories/orgapacheisis-062/org/apache/isis/viewer/isis-viewer-restfulobjects/1.0.0/isis-viewer-restfulobjects-1.0.0-source-release.zip
    https://repository.apache.org/content/repositories/orgapacheisis-065/org/apache/isis/archetype/quickstart_wicket_restful_jdo-archetype/1.0.0/quickstart_wicket_restful_jdo-archetype-1.0.0-source-release.zip
    
The actual list of packages to be verified will be provided through the mailing list.

## Clean out Isis from your local Maven repo

    rm -rf ~/.m2/repository/org/apache/isis

## Execute the script
Execute...

    ./verify-isis-release.sh
    
…and get yourself a cup of coffee.

## Test the archetype

Assuming that everything builds ok, then test the archetypes (adjust version as necessary):

    mvn archetype:generate  \
        -D archetypeGroupId=org.apache.isis.archetype \
        -D archetypeArtifactId=simpleapp-archetype \
        -D groupId=com.mycompany \
        -D artifactId=myapp \
        -D version=1.0-SNAPSHOT \
        -B \
        -o \
        -D archetypeVersion=1.8.0   # adjust version as necessary

    cd myapp
    mvn clean install -o
    mvn -P self-host antrun:run
    
If it runs up ok, then it's time to [vote](verifying-releases.html)!
