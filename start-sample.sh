#!/bin/bash

REPO_SRC="https://github.com/Anderwerty/spring-boot-sample-web-ui.git"
LOCAL_REPO="project"

LOCAL_REPO_VC_DIR=$LOCAL_REPO/.git

if [ ! -d $LOCAL_REPO_VC_DIR ]
then	echo "Repository does not exist. It will be cloned"
	git clone $REPO_SRC $LOCAL_REPO
else
	echo "Updating project"
	cd $LOCAL_REPO
	git pull $REPO_SRC
	cd ..
fi

#Stop the application, if it is running. Add functionality
kill $(lsof -t -i:8080)

cd $LOCAL_REPO
mvn clean install

#Start the application in background


mvn spring-boot:run &

