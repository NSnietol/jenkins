pipeline{

    agent any
    stages{

            stage('Test') {
                steps{
                    retry(3){

                        sh 'No está funcionando ...'
                    }


                }
                    


            }

    }
}