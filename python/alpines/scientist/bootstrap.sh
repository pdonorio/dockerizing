#!/bin/bash

# This variable is set inside the docker container
cd $DATADIR

if [ ! -v NOLECTURES ]; then

    echo "Ready to download material with 'git'"
    main_dir="lectures"
    # Basic repo
    repo="gitlab.hpc.cineca.it/training"
    ## repo="github.com/cineca-scai"
    # Project
    project="data"
    # Basic branch
    branch="scientificpy"
    # Basic path
    nbpath="material/2017"
    # nbpath="material"

    # If passed through environment
    if [ -n "$LECTURE_BRANCH" ]; then
    	branch="$LECTURE_BRANCH"
    fi

    if [ -n "$LECTURE_PATH" ]; then
    	nbpath="$LECTURE_PATH"
    fi

    if [ -n "$LECTURE_REPO" ]; then
            repo="$LECTURE_REPO"
    fi

    if [ -n "$LECTURE_PRJ" ]; then
            project="$LECTURE_PRJ"
    fi

    echo "************************"
    echo "** LECTURES"
    echo "Using: "
    echo ""
    echo "branch[$branch] path[$nbpath] repo[$repo] project[$project]"
    echo ""

    if [ -d $main_dir ]; then
        echo "Repository already found"
    else
        git -c http.sslVerify=false clone https://${repo}/${project}.git $main_dir
        if [ "$?" != "0" ]; then
            echo "Failed to retrieve repo"
        fi
    fi

    if [ -d $main_dir ]; then
        cd $main_dir
        git checkout $branch
        git pull origin $branch
        echo "Done repository init"
        cd $nbpath
    fi
else
    echo "Skipping download of material"
fi

# fix permissions
chown -R $NB_UID $DATADIR 2> /dev/null

###############################
# SET ENVIRONMENT
export IPYTHON=1

#####################
# BOOT SERVICES

#trust and launch
exec su $NB_USER -c "jupyter trust */*ipynb && jupyter notebook --no-browser --ip 0.0.0.0"
