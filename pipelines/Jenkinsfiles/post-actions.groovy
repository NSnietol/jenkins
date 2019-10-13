pipeline{
    
    
    agent any
    
    stages {
        stage('test'){
            steps{
                sh 'echo test '
            }
            
        }
    }

    post {
        always{
            echo 'Hola, ya se ejecutó el pipeline, revisalo!'
        }
        success{
            echo 'Ejecución correcta'
        }
        failure{
            echo 'La ejecución falló'
        }
        unstable{
            echo 'El job está inestable'
        }
        changed{
            echo 'El job está funcionando diferente'
        }

    }
    
}