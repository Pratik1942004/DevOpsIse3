pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "yourdockerhubusername/gradle-simple:latest"
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials-id' // Replace with your Jenkins Docker Hub credentials ID
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, "-f Dockerfile .")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}
