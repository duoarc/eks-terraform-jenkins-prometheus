#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-west-2"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    sh "terraform init"
                    sh "terraform apply -auto-approve"                
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name alt3-eks-cluster"
                        sh "kubectl apply -f voting-namespace.yaml"
                        sh "kubectl apply -f voting-deployment.yaml"
                        sh "kubectl apply -f voting-service.yaml"
                        sh "kubectl apply -f redis-deployment.yaml"
                        sh "kubectl apply -f redis-service.yaml"
                        sh "kubectl apply -f worker-deployment.yaml"
                        sh "kubectl apply -f postgres-deployment.yaml"
                        sh "kubectl apply -f posttgres-service.yaml"
                        sh "kubectl apply -f result-deployment.yaml"
                        sh "kubectl apply -f result-service.yaml"
                    }
                }
            }
        }
    }
}