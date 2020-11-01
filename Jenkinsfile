pipeline {
     environment {
    registry = "nassercsed/capstone"
    registryCredential = 'docker.jenkins'
    dockerImage = ''
    }
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
        
      stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
        
    }
}
