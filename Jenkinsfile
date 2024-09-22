pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the specified branch from your GitHub repository
                git branch: 'deexi', url: 'https://github.com/deekshith000007/portfolio.git'
            }
        }
        
        stage('Build') {
            steps {
                // Run Maven build and package the application
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                // Build the Docker image and tag it with the Jenkins build number
                sh 'docker build -t portfolio:${BUILD_NUMBER} .'
            }
        }
        
        stage('Docker Run') {
            steps {
                script {
                    // Stop and remove any existing container with the name 'portfolio', if running
                    sh '''
                        if [ $(docker ps -q -f name=portfolio) ]; then
                     
