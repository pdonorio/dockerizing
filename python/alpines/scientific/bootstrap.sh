#!/bin/bash

# This variable is set inside the docker container
cd $DATADIR

if [ ! -v NOLECTURES ]; then

    echo "Ready to download material with 'git'"

    # Project
    project="lectures"
    # Basic branch
    branch="science-rome"
    # Basic path
    nbpath="pyscience"
    # Basic repo
    repo="github.com/cineca-scai"


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

    if [ -d $project ]; then
        echo "Repository already found"
    else
        git -c http.sslVerify=false clone https://${repo}/${project}.git
    fi

    cd $project
    git checkout $branch
    git pull origin $branch
    echo "Done repository init"

    cd $nbpath
else
    echo "Skipping download of material"
fi

# fix permissions
chown -R $NB_UID $DATADIR 2> /dev/null

###############################
# SET ENVIRONMENT
export IPYTHON=1
# export PYSPARK_PYTHON=$CONDA_DIR/bin/python3
# export PYSPARK_DRIVER_PYTHON=ipython3
# export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

#####################
# BOOT SERVICES

#notebook
exec su $NB_USER -c "jupyter notebook --no-browser --ip 0.0.0.0"

#####################

## NORMAL RUN

# docker run --rm -it -v mytest:/data -p 8080:8080 -p 8888:8888 cineca/scientific:alpine

## CLOUDSCALE RUN

# --image "cineca/nbsparkling:0.7"
# --extra "-e LECTURE_BRANCH=school-unimore-2016 -e LECTURE_PATH=material -e LECTURE_REPO=gitlab.hpc.cineca.it/training -e LECTURE_PRJ=data -h notebook"
