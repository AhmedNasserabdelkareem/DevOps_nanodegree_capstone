## DevOps_nanodegree_capstone

<hr>

## Project Overview

Capstone project for Udacity's "Cloud DevOps Engineer" Nanodegree Program.

<hr>

## Objectives

- Working in AWS
- Using Jenkins to implement Continuous Integration and Continuous Deployment
- Building pipelines
- Working with CloudFormation to deploy clusters
- Building Kubernetes clusters
- Building Docker containers in pipelines

<hr>

## Project Steps

1. [Development](#development)
2. [Create eks cluster](#EKS)
3. [Resources creation](#AWS)
4. [Create image && docker hub](#Docker)
5. [Deploy to Kubernetes Cluster](#deploy-kubernetes-cluster)
6. [CI/CD Pipeline](#ci/cd-pipeline)

<hr>

### Development

 - Simple flask "Hello World" application.

<hr>

### EKS

 - First, Trying to create kubernetes cluster with this command:

    ```
        $ eksctl create cluster \
				--name capstone \
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
    ```

 - Configure it using this command:


    ```
        $ aws eks --region us-west-2 update-kubeconfig --name capstone
    ```

![1.png](Screenshots/1.png)
![2.png](Screenshots/2.png)
![3.png](Screenshots/3.png)

<hr>

### AWS

 - Cluster

![11.png](Screenshots/11.png)

 - Creating stacks

![12.png](Screenshots/12.png)
![13.png](Screenshots/13.png)

 - EC2 instances

![14.png](Screenshots/14.png)

 - Creating user 

![15.png](Screenshots/15.png)

 - User's policy

![16.png](Screenshots/16.png)


<hr>

### Docker

 - Try to lint Dockerfile

![4.png](Screenshots/4.png)
![5.png](Screenshots/5.png)

 - Building docker image 

![6.png](Screenshots/6.png)

 - Upload it to Dockerhub

![10.png](Screenshots/10.png)


<hr>

### deploy-kubernetes-cluster

 - Applying to kubernetes using aws-auth.cm.yaml templete

![7.png](Screenshots/7.png)
![8.png](Screenshots/8.png)


<hr>

### ci/cd-pipeline

 - The whole pipeline
 
![9.png](Screenshots/9.png)
