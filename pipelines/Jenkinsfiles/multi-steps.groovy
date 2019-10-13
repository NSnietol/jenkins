pipeline{
    
    
    agent any
    
    stages {
        stage('Build'){
            steps{
                sh 'echo Building '
                sh 'echo Building in progress'
            }
            
        }
        
        stage('Test'){
            steps{
                echo 'Testing Again'
            }
        }
        
        stage('Deploy'){
            
            steps{
                echo 'Deploying.'
            }
        }
        
        
    }
    
}