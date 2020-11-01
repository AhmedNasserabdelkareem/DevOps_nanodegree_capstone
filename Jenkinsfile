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
         
        stage('Set the current cluster') {
              steps{
                  withAWS(credentials: 'aws-static', region: 'us-west-2') {
                      sh '''
                      aws eks --region us-west-2 update-kubeconfig --name capstone
                      kubectl config use-context arn:aws:eks:us-west-2:711881707760:cluster/capstone
                      '''
                }
            }
        }
        
        stage('Deploy to EKS') {
              steps{
                  withAWS(credentials: 'aws-static', region: 'us-west-2') {
                      sh '''
                      kubectl apply -f aws-auth-cm.yaml
                      kubectl get nodes
                      '''
                }
            }
        }
    }
}
