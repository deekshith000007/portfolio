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
                            docker stop portfolio
                            docker rm portfolio
                        fi
                    '''
                    
                    // Run the newly built Docker container, mapping port 8081 to 8080
                    sh 'docker run -d -p 8081:8080 --name portfolio portfolio:${BUILD_NUMBER}'
                }
            }
        }
    }
    
    post {
        success {
            // Display a success message when the pipeline completes successfully
            echo 'Pipeline succeeded! Your portfolio is now live.'
        }
        failure {
            // Display an error message when the pipeline fails
            echo 'Pipeline failed. Please check the logs for details.'
        }
    }
}
