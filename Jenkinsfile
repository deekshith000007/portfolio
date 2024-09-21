pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                // Clone your GitHub repository
                git 'https://github.com/deekshith000007/portfolio.git' // Public repository
            }
        }
        stage('Build') {
            steps {
                // Build the project using Maven
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "portfolio_image" // Customize image name
                    // Build the Docker image
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh "docker run -d -p 8081:8080 portfolio_image:latest" // Map your ports
                }
            }
        }
    }
}
