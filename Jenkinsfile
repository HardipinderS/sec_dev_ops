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
                            sh  "echo Tests failed! Sending email notification..."
                            def emailBody = "${env.JOB_NAME} build #${env.BUILD_NUMBER} failed. See console output for more information."
                            def subject = "${env.JOB_NAME} build #${env.BUILD_NUMBER} failed"
                            emailext body: emailBody, subject: subject, to: 'hardipinder@duck.com', mimeType: 'text/html', attachLog: true
                        } else {
                            sh  "echo Tests passed! Sending email notification..."
                            def emailBody = "${env.JOB_NAME} build #${env.BUILD_NUMBER} passed. See console output for more information."
                            def subject = "${env.JOB_NAME} build #${env.BUILD_NUMBER} passed"
                            emailext body: emailBody, subject: subject, to: 'hardipinder@duck.com', mimeType: 'text/html', attachLog: true
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
        stage('Deploy') {
            steps {
                sh 'ls -l'
                sh 'scp deploy.sh ec2-user@$18.219.240.101:~/'
                sh 'ssh ec2-user@$18.219.240.101 "chmod +x deploy.sh"'
                sh 'ssh ec2-user@$18.219.240.101 ./deploy.ssh'
                // timeout(time: 50, unit: 'SECONDS') {
                // sh "python app/main.py"
                }
            }
        }
    }

