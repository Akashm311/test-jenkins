pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your version control system (e.g., Git)
                checkout scm
            }
        }

        stage('Build and Publish Docker Image') {
        steps {
        script {
            // Change to the directory where your Dockerfile is located
            dir("Documents/demo-jenkins") {
                // Build and tag the Docker image
                sh 'docker build -t test:v2 .'
            }
        }
    }
}


        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                script {
                    sh 'docker run -p 8084:80 test:v2'
                }
            }
        }
    }

    post {
        always {
            // Clean up - stop and remove the container
            script {
                def container = docker.image("my-python-app:${env.BUILD_NUMBER}")
                container.stop()
                container.remove()
            }
        }
    }
}
