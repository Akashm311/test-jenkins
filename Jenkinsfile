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
                // Build and publish the Docker image
                script {
                    def dockerImage = docker.build("my-python-app:${env.BUILD_NUMBER}")
                    dockerImage.inside {
                        // Run any additional setup or tests inside the container if needed
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container
                script {
                    def container = docker.image("my-python-app:${env.BUILD_NUMBER}").run("-d -p 8080:80")
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
