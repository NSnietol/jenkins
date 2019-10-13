#!/bin/bash
# Get branch name from ref head

if ! [ -t 0 ]; then
  read -a ref
fi
IFS='/' read -ra REF <<< "${ref[2]}"
branch="${REF[2]}"

if [ $branch == "master" ]; then

crumb=$(curl -u "jenkins-trigger:1234" -s 'http://jenkins:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

echo "We're going to shut the job, target : $branch"
curl -u "jenkins-trigger:1234" -H "$crumb" -X POST  http://jenkins:8080/view/SDL/job/job-sdl/build?delay=0sec

  if [ $? -eq 0 ] ; then
    echo "*** DSL OK"
  else
    echo "*** DSL :( exit 1"
  fi
fi



