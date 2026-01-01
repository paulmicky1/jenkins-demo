stage('Code Analysis') {
            steps {
                echo 'Analyzing code quality...'
                // 1. Send code to SonarQube
                withSonarQubeEnv('SonarQube') {
                    sh "${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=my-first-analysis \
                    -Dsonar.sources=."
                }
            }
        }
        
        stage('Quality Gate') {
            steps {
                // 2. Wait for SonarQube to say "OK" or "FAIL"
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
