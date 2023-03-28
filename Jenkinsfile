pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest'
            }
        }
        stage('Deploy') {
            steps {
                timeout(time: 50, unit: 'SECONDS') {
                sh "python app/main.py"
                }
            }
        }
    }
}
