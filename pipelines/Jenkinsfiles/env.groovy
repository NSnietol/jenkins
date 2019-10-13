pipeline{
    
    
    agent any

    environment{
        AUTHOR='NS'
        VERSION=0.4
    }
    
    stages {
        stage('test'){
            environment{
                AUTHOR='N'
                VERSION=0.2
            }
    
            steps{
                sh 'echo $AUTHOR V: $VERSION '
            }
            
        }
    }
}