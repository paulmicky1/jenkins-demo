pipeline {
    agent any

    environment {
        // This variable defines the name of your image
        IMAGE_NAME = "my-jenkins-app"
        scannerHome = tool 'SonarQubeScanner'
    }

    stages {
        stage('Code Analysis') {
            steps {
                echo 'Checking code...'
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=jenkins-demo -Dsonar.sources=."
                }
            }
        }

        stage('Build Image') {
            steps {
                echo 'Building Docker Image...'
                // THIS is the command that was missing before
                sh "docker build -t ${IMAGE_NAME}:v1 ."
            }
        }
    }
}
