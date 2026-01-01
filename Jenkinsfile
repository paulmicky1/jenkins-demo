pipeline {
    agent any

    environment {
        // This tool allows us to run the scanner command
        scannerHome = tool 'SonarQubeScanner' 
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        
        stage('Code Analysis') {
            steps {
                // This step sends the code to SonarQube
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=my-first-analysis \
                    -Dsonar.sources=."
                }
            }
        }
    }
}
