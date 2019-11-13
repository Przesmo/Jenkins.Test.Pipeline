pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                echo 'Hello from branch: ' + env.GIT_BRANCH
            }
        }
        stage('Push'){
            steps{
                currentBuild.result = 'UNSTABLE'
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