pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                script{
                app = docker.build("psmoll/test_repository")
                }
            }
        }
        stage('Push'){
            steps{
                script{
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }   
}