pipeline {
    agent any

    environment {
        // This ensures Jenkins installs and links the scanner tool
        scannerHome = tool 'SonarQubeScanner'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Create a dummy file to simulate a build artifact
                sh 'echo "version 1.0" > my-app.txt'
            }
        }
        
        stage('Code Analysis') {
            steps {
                echo 'Analyzing code...'
                withSonarQubeEnv('SonarQubeScanner') {
                    // Note: We use the tool variable ${scannerHome} here
                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=jenkins-demo -Dsonar.sources=."
                }
            }
        }

        stage('Quality Gate') {
            steps {
                // Wait for the report. Fails if SonarQube finds too many bugs.
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
