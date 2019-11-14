pipeline{
    agent any
    stages{
        stage('Build'){
               app = docker.build("psmoll/test_repository")
        }
        stage('Push'){
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
        }
    }
}