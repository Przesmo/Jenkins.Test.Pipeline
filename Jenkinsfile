pipeline{
    agent any
    stages{
        stage('Build'){
            script{
               app = docker.build("psmoll/test_repository")
            }
        }
        stage('Push'){
            script{
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                }
            }
        }
    }   
}