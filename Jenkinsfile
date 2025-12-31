pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the application...'
                // This command creates a text file named "my-app.txt"
                sh 'echo "This is the built application version 1.0" > my-app.txt' 
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'grep "version 1.0" my-app.txt' // Checks if the file contains the text
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'sleep 1'
            }
        }
    }

    // This section runs after the stages are done
    post {
        success {
            // This tells Jenkins to save "my-app.txt"
            archiveArtifacts artifacts: 'my-app.txt', fingerprint: true
        }
    }
}
