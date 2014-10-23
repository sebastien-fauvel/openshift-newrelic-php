#!/bin/bash

function start_openshift_build {
    git push --force openshift master || resume_openshift_build
}

function resume_openshift_build {
    date >> build.log
    echo 'Resuming OpenShift build' >> build.log
    git add build.log
    git commit -m 'Resuming OpenShift build'
    start_openshift_build
}

start_openshift_build
