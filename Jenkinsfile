pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
        stage('Compile') {
            steps {
                sh 'python -m py_compile app/main.py'
                sh 'find . -name "*.pyc"'
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
