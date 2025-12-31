pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Compiling the code...'
                sh 'sleep 2'
            }
        }
        stage('Test') {
            steps {
                echo 'Running unit tests...'
                sh 'sleep 2'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying application to production...'
                sh 'sleep 2'
            }
        }
    }
}
