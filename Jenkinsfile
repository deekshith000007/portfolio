pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'deexi', url: 'https://github.com/deekshith000007/portfolio.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh 'docker build -t portfolio:${BUILD_NUMBER} .'
            }
        }
        
        stage('Docker Run') {
            steps {
                sh 'docker stop portfolio || true'
                sh 'docker rm portfolio || true'
                sh 'docker run -d -p 8081:8080 --name portfolio portfolio:${BUILD_NUMBER}'
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline succeeded! Your portfolio is now live.'
        }
        failure {
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
