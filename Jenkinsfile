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
            post {
                always {
                    script {
                        if (currentBuild.result == "FAILURE") {
                            def issue_title = "Compilation Failed in Job: $JOB_NAME"
                            def issue_body = "The automated Compilation failed for Job: $JOB_NAME. Please investigate."
                            sh "echo '$issue_body' > issue_body.txt"
                            withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                                sh """
                                    curl -X POST -H 'Authorization: token $GITHUB_TOKEN' \
                                    -d @issue_body.txt \
                                    https://github.com/HardipinderS/sec_dev_ops/issues \
                                    -d '{"title": "$issue_title"}'
                                """
                            }
                            emailext (
                                to: "hardipinder@duck.com",
                                subject: "Compilation Failed in Job: $JOB_NAME",
                                body: "The automated Compilation failed for Job: $JOB_NAME. Please investigate."
                            )
                        } else {
                            emailext (
                                to: "hardipinder@duck.com",
                                subject: "Compilation Passed in Job: $JOB_NAME",
                                body: "The automated Compilation passed for Job: $JOB_NAME. going for next step."
                            )
                        }
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'pytest'
            }
            post {
                always {
                    script {
                        if (currentBuild.result == "FAILURE") {
                            emailext (
                                to: "hardipinder@duck.com",
                                subject: "Test Failed in Job: $JOB_NAME",
                                body: "The automated test failed for Job: $JOB_NAME. Please investigate."
                            )
                        } else {
                            emailext (
                                to: "hardipinder@duck.com",
                                subject: "Test Passed in Job: $JOB_NAME",
                                body: "The automated test passed for Job: $JOB_NAME. going for next step."
                            )
                        }
                    }
                }
            }
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
