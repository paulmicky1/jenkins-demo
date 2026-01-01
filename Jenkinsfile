pipeline {
    agent any

    environment {
        // Define the name of our image
        IMAGE_NAME = "my-jenkins-app"
        // Setup SonarQube Scanner Tool
        scannerHome = tool 'SonarQubeScanner'
    }

    stages {
        stage('Code Analysis') {
            steps {
                echo 'Checking code quality...'
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=jenkins-demo -Dsonar.sources=."
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Build Image') {
            steps {
                echo 'Building Docker Image...'
                // This command builds the image using the Dockerfile
                sh "docker build -t ${IMAGE_NAME}:v1 ."
            }
        }

        stage('Test Image') {
            steps {
                echo 'Verifying Image...'
                // Verify the image was actually created
                sh "docker images | grep ${IMAGE_NAME}"
            }
        }
    }
}
