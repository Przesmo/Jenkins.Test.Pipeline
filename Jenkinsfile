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
                echo 'PUSH'
            }
        }
        stage('Deploy'){
            steps{
                echo 'DEPLOY'
            }
        }
    }
}