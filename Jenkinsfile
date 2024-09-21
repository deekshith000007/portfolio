pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/deekshith000007/portfolio.git' // Replace with your GitHub repo URL
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def imageName = "portfolio_image" // Customize image name
                    sh "docker build -t ${imageName} ."
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d -p 8081:8080 portfolio_image:latest" // Map your ports
                }
            }
        }
    }
}
