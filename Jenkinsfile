/*
pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
                choice(name: 'Deployment_Type', choices:['apply','destroy'],description:'The deployment type')
                  }
    environment {
        EMAIL_TO = 'd.dampes@yahoomail.com'
    }
    stages {
        stage('1.Terraform init') {
            steps {
                echo 'terraform init phase'
                sh 'terraform init'
            }
        }
        stage('2.Terraform plan') {
            steps {
                echo 'terraform plan phase'
                sh 'AWS_REGION=us-east-2 terraform plan'
            }
        }
        stage('3.Manual Approval') {
            input {
                message "Should we proceed?"
                ok "Yes, we should."
                parameters{
                    choice (name: 'Manual_Approval', choices: ['Approve','Reject'], description: 'Approve or Reject the deployment')
                }
            }
             steps {
                echo "Deployment ${Manual_Approval}"
            }          
        }
        stage('4.Terraform Deploy') {              
            steps { 
                echo 'Terraform ${params.Deployment_Type} phase'  
                sh "AWS_REGION=us-east-2 terraform ${params.Deployment_Type} --auto-approve"
                sh("""scripts/update-kubeconfig.sh""")                
                }
                }
        stage ('5. Email Notification') {
            steps {
               mail bcc: 'd.dampes@yahoomail.com', body: '''Terraform deployment is completed.
               Let me know if the changes look okay.
               Thanks verymuch,
               Dominion System Technologies,
              +1 (313) 413-1477''', cc: 'd.dampes@yahoomail.com', from: '', replyTo: '', subject: 'Terraform Infra deployment completed!!!', to: 'd.dampes@yahoomail.com'
                          
               }    
          }
     }       
} 
*/
/*
pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
        choice(name: 'Deployment_Type', choices: ['apply', 'destroy'], description: 'The deployment type')
    }
    environment {
        EMAIL_TO = 'd.dampes@yahoomail.com'
        AWS_REGION = 'us-east-2'
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
            input {
                message "Should we proceed?"
                ok "Yes, we should."
                parameters {
                    choice(name: 'Manual_Approval', choices: ['Approve', 'Reject'], description: 'Approve or Reject the deployment')
                }
            }
            steps {
                echo "Deployment decision: ${Manual_Approval}"
                script {
                    if (Manual_Approval == 'Reject') {
                        error('Deployment rejected by the user.')
                    }
                }
            }
        }

        stage('4. Terraform Deploy') {
            when {
                expression {
                    return Manual_Approval == 'Approve'
                }
            }
            steps {
                echo "Terraform ${params.Deployment_Type} phase"
                sh "AWS_REGION=${env.AWS_REGION} terraform ${params.Deployment_Type} --auto-approve"
                sh "scripts/update-kubeconfig.sh" // Assuming this script updates Kubernetes configuration
            }
        }

        stage('5. Email Notification') {
            steps {
                mail bcc: 'd.dampes@yahoomail.com',
                     body: '''Terraform deployment is completed.
                              Let me know if the changes look okay.
                              Thanks very much,
                              Dominion System Technologies,
                              +1 (313) 413-1477''',
                     cc: 'd.dampes@yahoomail.com',
                     subject: 'Terraform Infra Deployment Completed!!!',
                     to: 'd.dampes@yahoomail.com'
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
        AWS_REGION = 'us-east-2'
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
                              Thanks yo smp updated and port open,
                              Dominion System Technologies,
                              +1 (313) 413-1477''',
                     cc: 'ngwahermann@gmail.com',
                     subject: 'Terraform Infra Deployment Completed!!!',
                     to: 'ngwahermann@gmail.com'
            }
        }
    }
}
