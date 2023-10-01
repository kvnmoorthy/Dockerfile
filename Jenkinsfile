pipeline {
    agent any

    stages {

        stage('clone') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kvnmoorthy/Dockerfile.git']])
            }

        }
        stage('version') {
            steps {
                sh 'docker --version'

            }
        }
        stage('ecr login') {
            steps {
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 229150983365.dkr.ecr.us-east-2.amazonaws.com'
            }
        }
        stage('build') {
            steps {
                sh 'docker build -t web .'
            }
        }
        stage('tag') {
            steps {
                sh 'docker tag web:latest 229150983365.dkr.ecr.us-east-1.amazonaws.com/web:latest'
            }
        }
        stage('push') {
            steps {
                sh 'docker push 229150983365.dkr.ecr.us-east-1.amazonaws.com/web:latest'
            }
        }
    }
}
