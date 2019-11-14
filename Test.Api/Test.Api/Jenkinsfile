pipeline{
    agent any
    stages{
        stage('Build'){
            environment { 
                TEST = 'clang'
            }
            steps{
               app = docker.build("psmoll/test_repository")
            }
        }
        stage('Push'){
            steps{
                docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                app.push("${env.BUILD_NUMBER}")
                app.push("latest")
                
                expression{
                    currentBuild.result = 'UNSTABLE'
                }
            }
        }
        stage('Deploy'){
            when{
                expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
            steps {
                echo 'DEPLOY'
            }
        }
    }
}