pipeline {
    agent any
    stages {
        
        /*stage('Instal hadolint'){
            steps{
                sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64'
            }
        }*/
        
        stage('Lint Docker File'){
            steps{
                sh '''
                docker pull hadolint/hadolint:latest-debian
                hadolint Dockerfile
                '''
            }
        }
    }
}
