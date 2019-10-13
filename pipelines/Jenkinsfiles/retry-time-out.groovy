pipeline{

    agent any
    stages{

            stage('Test') {
                steps{

                     timeout(time: 3, unit:'SECONDS'){
    
                            retry(3){
                                sh 'sleep 5'
                            }
                    }
                }
            }

    }
}