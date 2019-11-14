pipeline{
    agent any
    stages{
        stage('Build'){
            environment { 
                TEST = 'clang'
            }
            steps{
                echo 'Hello from branch: ' + env.GIT_BRANCH
                sh jenkins/build.sh
            }
        }
        stage('Push'){
            steps{
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