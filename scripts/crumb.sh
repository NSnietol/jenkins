crumb=$(curl -u "jenkins-trigger:1234" -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')


# Without parameters
#curl -u "jenkins-trigger:1234" -H "$crumb" -X POST http:///localhost:8080/job/ENV/build?delay=0sec

curl -u "jenkins-trigger:1234" -H "$crumb" -X POST  http://localhost:8080/job/ansible-job/buildWithParameters?message=Hola_desde_bash
