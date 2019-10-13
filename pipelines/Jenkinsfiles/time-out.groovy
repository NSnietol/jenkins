pipeline{

    agent any
    stages{

            stage('Test') {
                steps{
                    retry(3){

                        sh 'No está funcionando ...'
                    }

                    timeout(time: 3, unit:'SECONDS'){
                        sh 'sleep 5'
                    }


                }
                    


            }

    }
}