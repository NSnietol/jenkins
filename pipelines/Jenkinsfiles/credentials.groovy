pipeline{
    
    
    agent any

    stages {
        stage('test'){
            environment{
                AUTHOR = credentials('AWS_BUCKET_CRED')
            }
    
            steps{
                sh 'echo $AUTHOR  '
            }
            
        }
    }
}