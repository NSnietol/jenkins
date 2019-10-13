pipeline{

    agent any

    stages{

            stage('Build'){
                sh 'echo Build'
            }
            stage('Test'){
                sh 'echo Test'
            }
            stage('Push'){
                sh 'echo Push'
            }
            stage('Deploy'){
                sh 'echo Deploy'
            }


    }


}