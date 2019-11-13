pipeline{
    agent any
    stages{
        stage('Example'){
            steps{
                echo 'Hello from branch' + env.GIT_BRANCH
            }
        }
    }
}