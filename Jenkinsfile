
/*pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
        choice(name: 'Deployment_Type', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    environment {
        EMAIL_TO = 'ngwahermann@gmail.com'
        AWS_REGION = 'us-west-2'
    }
    stages {
        stage('1. Terraform Init') {
            steps {
                echo 'Terraform init phase'

                // Run terraform init with migration or reconfigure option if necessary
                script {
                    def backendChanged = sh(script: 'terraform init -migrate-state || terraform init -reconfigure', returnStatus: true)
                    if (backendChanged == 0) {
                        echo 'Terraform initialized successfully with backend migration or reconfiguration.'
                    } else {
                        error('Terraform backend configuration failed.')
                    }
                }
            }
        }

        stage('2. Terraform Plan') {
            steps {
                echo 'Terraform plan phase'
                sh "AWS_REGION=${env.AWS_REGION} terraform plan"
            }
        }

        stage('3. Manual Approval') {
            steps {
                script {
                    // Capture the result of the manual approval input step
                    def userInput = input message: "Should we proceed?", ok: "Yes, we should.", parameters: [
                        choice(name: 'Manual_Approval', choices: ['Approve', 'Reject'], description: 'Approve or Reject the deployment')
                    ]
                    
                    echo "Deployment decision: ${userInput}"
                    
                    if (userInput == 'Reject') {
                        error('Deployment rejected by the user.')
                    }
                }
            }
        }

        stage('4. Terraform Deploy') {
            steps {
                echo "Terraform ${params.Deployment_Type} phase"
                sh "AWS_REGION=${env.AWS_REGION} terraform ${params.Deployment_Type} --auto-approve"
                sh "scripts/update-kubeconfig.sh" // Assuming this script updates Kubernetes configuration
            }
        }

        stage('5. Email Notification') {
            steps {
                mail bcc: 'ngwahermann@gmail.com',
                     body: '''Terraform deployment is completed.
                              Let me know if the changes look great.
                              Thanks for smp updated and port open,
                              Dominion System Technologies,
                              +1 (313) 413-1477''',
                     cc: 'ngwahermann@gmail.com',
                     subject: 'Terraform Infra Deployment Completed!!!',
                     to: 'ngwahermann@gmail.com'
            }
        }
    }
}
*/

/*pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
        choice(name: 'Deployment_Type', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    environment {
        EMAIL_TO = 'ngwahermann@gmail.com'
        AWS_REGION = 'us-west-2'
    }
    stages {
        stage('Validate Parameters') {
            steps {
                script {
                    if (!['apply', 'destroy'].contains(params.Deployment_Type)) {
                        error("Invalid deployment type: ${params.Deployment_Type}. Must be 'apply' or 'destroy'.")
                    }
                }
            }
        }

        stage('Check Terraform Version') {
            steps {
                script {
                    def terraformVersion = sh(script: 'terraform version', returnStdout: true).trim()
                    echo "Terraform version: ${terraformVersion}"
                }
            }
        }

        stage('1. Terraform Init') {
            steps {
                echo 'Terraform init phase'
                withCredentials([[$class: 'AmazonWebServicesCredentials', credentialsId: 'your-credentials-id']]) {
                    script {
                        def backendChanged = sh(script: 'terraform init -migrate-state || terraform init -reconfigure', returnStatus: true)
                        if (backendChanged == 0) {
                            echo 'Terraform initialized successfully with backend migration or reconfiguration.'
                        } else {
                            error('Terraform backend configuration failed.')
                        }
                    }
                }
            }
        }

        stage('2. Terraform Plan') {
            steps {
                echo 'Terraform plan phase'
                withCredentials([[$class: 'AmazonWebServicesCredentials', credentialsId: 'your-credentials-id']]) {
                    sh "AWS_REGION=${env.AWS_REGION} terraform plan"
                }
            }
        }

        stage('3. Manual Approval') {
            steps {
                script {
                    def userInput = input message: "Should we proceed?", ok: "Yes, we should.", parameters: [
                        choice(name: 'Manual_Approval', choices: ['Approve', 'Reject'], description: 'Approve or Reject the deployment')
                    ]
                    
                    echo "Deployment decision: ${userInput}"
                    
                    if (userInput == 'Reject') {
                        error('Deployment rejected by the user.')
                    }
                }
            }
        }

        stage('4. Terraform Deploy') {
            steps {
                echo "Terraform ${params.Deployment_Type} phase"
                withCredentials([[$class: 'AmazonWebServicesCredentials', credentialsId: 'your-credentials-id']]) {
                    sh "AWS_REGION=${env.AWS_REGION} terraform ${params.Deployment_Type} --auto-approve"
                    sh "scripts/update-kubeconfig.sh" // Update Kubernetes configuration
                }
            }
        }

        stage('5. Email Notification') {
            steps {
                mail bcc: 'ngwahermann@gmail.com',
                     body: '''Terraform deployment is completed.
                              Let me know if the changes look great.
                              Thanks you   4smp updated and port open,
                              Dominion System Technologies,
                              +1 (313) 413-1477''',
                     cc: 'ngwahermann@gmail.com',
                     subject: 'Terraform Infra Deployment Completed!!!',
                     to: 'ngwahermann@gmail.com'
            }
        }
    }
}
*/

pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
        choice(name: 'Deployment_Type', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    environment {
        EMAIL_TO = 'ngwahermann@gmail.com'
        AWS_REGION = 'us-west-2'
    }
    stages {
        stage('1. Terraform Init') {
            steps {
                echo 'Terraform init phase'

                // Run terraform init with migration or reconfigure option if necessary
                script {
                    def backendChanged = sh(script: 'terraform init -migrate-state || terraform init -reconfigure', returnStatus: true)
                    if (backendChanged == 0) {
                        echo 'Terraform initialized successfully with backend migration or reconfiguration.'
                    } else {
                        error('Terraform backend configuration failed.')
                    }
                }
            }
        }

        stage('2. Terraform Plan') {
            steps {
                echo 'Terraform plan phase'
                sh "AWS_REGION=${env.AWS_REGION} terraform plan"
            }
        }

        stage('3. Manual Approval') {
            steps {
                script {
                    // Capture the result of the manual approval input step
                    def userInput = input message: "Should we proceed?", ok: "Yes, we should.", parameters: [
                        choice(name: 'Manual_Approval', choices: ['Approve', 'Reject'], description: 'Approve or Reject the deployment')
                    ]
                    
                    echo "Deployment decision: ${userInput}"
                    
                    if (userInput == 'Reject') {
                        error('Deployment rejected by the user.')
                    }
                }
            }
        }

        stage('4. Terraform Deploy') {
            steps {
                echo "Terraform ${params.Deployment_Type} phase"
                sh "AWS_REGION=${env.AWS_REGION} terraform ${params.Deployment_Type} --auto-approve"
                sh "scripts/update-kubeconfig.sh" // Assuming this script updates Kubernetes configuration
            }
        }

        stage('5. Email Notification') {
            steps {
                mail bcc: 'ngwahermann@gmail.com',
                     body: '''Terraform deployment is completed.
                              Let me know if the changes look great.
                              Thank  you for your support ,
                              Dominion System Technologies,
                              +1 (313) 413-1477''',
                     cc: 'ngwahermann@gmail.com',
                     subject: 'Terraform Infra Deployment Completed!!!',
                     to: 'ngwahermann@gmail.com'
            }
        }
    }
}
