#!/bin/bash
# Get branch name from ref head

if ! [ -t 0 ]; then
  read -a ref
fi
IFS='/' read -ra REF <<< "${ref[2]}"
branch="${REF[2]}"
echo "Commit received, target: $branch"
#Request a crumb

crumb=$(curl -u "jenkins-trigger:1234" -s 'http://jenkins:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

echo "We're going to shut the job, target : $branch"
curl -u "jenkins-trigger:1234" -H "$crumb" -X POST  http://jenkins:8080/view/new/job/maven-project/buildWithParameters?branch=$branch