
branch='dev'

crumb=$(curl -u "jenkins-trigger:1234" -s 'http://jenkins-local:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')

echo "We're going to shut the job, target : $branch"
curl -u "jenkins-trigger:1234" -H "$crumb" -X POST  http://jenkins-local:8080/view/new/job/maven-project/buildWithParameters?branch=$branch
