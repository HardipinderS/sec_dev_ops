pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                sh "curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip"
                sh "unzip awscliv2.zip"
                sh "./aws/install"
                sh "aws --version"
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
        stage('Security checks') {
            steps {
                // Run Bandit security check and save result to variable
                script {
                    bandit_result = sh (
                        script: 'python -m bandit -r app/main.py -ll',
                        returnStdout: true
                    )
                }
                // Run PyLint security check and save result to variable
                script {
                    pylint_result = sh (
                        script: 'python -m pylint app/',
                        returnStdout: true
                    )
                }
                // Run Flake8 security check and save result to variable
                script {
                    flake8_result = sh (
                        script: 'python -m flake8 app/',
                        returnStdout: true
                    )
                }
                // Send email with the results using emailext plugin
                emailext (
                    to: 'hardipinder@duck.com',
                    subject: 'Security check results',
                    body: "Bandit result: \n${bandit_result}\n\nPyLint result: \n${pylint_result}\n\nFlake8 result: \n${flake8_result}",
                    mimeType: 'text/plain'
                )
            }
        }
        // stage('Deploy') {
        //     steps {
        //         sh 'ls -l'
        //         sh 'scp deploy.sh ec2-user@$18.219.240.101:~/'
        //         sh 'ssh ec2-user@$18.219.240.101 "chmod +x deploy.sh"'
        //         sh 'ssh ec2-user@$18.219.240.101 ./deploy.ssh'
        //         // timeout(time: 50, unit: 'SECONDS') {
        //         // sh "python app/main.py"
        //         }
        //     }
        }
    }

