pipeline{
    environment {
    registry = "psmoll/test_repository"
    registryCredential = 'dockerhub'
}
    agent any
    stages{
        stage('Build'){
            steps{
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Push'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }   
}