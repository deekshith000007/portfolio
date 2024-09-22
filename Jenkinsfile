pipeline {
    agent any
    
    tools {
        maven 'Maven'  // This should match the name configured in Jenkins Global Tool Configuration
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'deexi', url: 'https://github.com/deekshith000007/portfolio.git'
            }
        }
        
        stage('Build') {
            steps {
                // Build the project using Maven
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
<<<<<<< HEAD
                script {
                    def imageName = "portfolio_image" // Customize image name
                    // Build the Docker image
                    sh "docker build -t ${imageName} ."
                }
=======
                sh 'docker build -t portfolio:${BUILD_NUMBER} .'
>>>>>>> d06d74315b3d71a9f40749b525372529f1c8c3d7
            }
        }
        
        stage('Docker Run') {
            steps {
<<<<<<< HEAD
                script {
                    // Run the Docker container
                    sh "docker run -d -p 8081:8080 portfolio_image:latest" // Map your ports
                }
            }
        }
    }
}
=======
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
>>>>>>> d06d74315b3d71a9f40749b525372529f1c8c3d7
