 pipeline{
    agent any
    stages{
        stage('Create kubernetes cluster') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-static') {
					sh '''
						eksctl create cluster \
						--name createcluster \
						--version 1.17 \
						--nodegroup-name standard-workers \
						--node-type t2.micro \
						--nodes 2 \
						--nodes-min 1 \
						--nodes-max 3 \
						--node-ami auto \
						--region us-west-2 \
						--zones us-west-2a \
						--zones us-west-2b \
						--zones us-west-2c \
					'''
				}
			}
		}

        stage('Create config file cluster') {
			steps {
				withAWS(region:'us-west-2', credentials:'aws-static') {
					sh '''
						aws eks --region us-west-2 update-kubeconfig --name createcluster
					'''
				}
			}
		}


    }
}