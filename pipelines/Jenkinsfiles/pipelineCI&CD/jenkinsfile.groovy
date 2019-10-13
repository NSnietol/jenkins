pipeline{
    
    
    agent any

    stages {
        stage('Build'){
           steps{

               sh ''' 
                    jenkins/build/build-mvn.sh clean package

                    jenkins/build/build.sh
                '''

           }
        }

        stage('Test'){
           steps{

               sh 'jenkins/test/test.sh'

           }
        }
    }
}