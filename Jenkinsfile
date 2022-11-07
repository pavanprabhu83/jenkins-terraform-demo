pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: "environment file to used for deployment")
        booleanParam(name: 'autoApprove', defaultValue: false, description: "Run apply after generation plan")
        booleanParam(name: 'destory', defaultValue: false, description: "to destory resources")
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                script{
                    dir("terraform")
                    {
                        git "https://github.com/pavanprabhu83/jenkins-terraform-demo.git"
                    }
                }
            } 
        }

        stage('Plan') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'

                sh 'terraform plan -input=false -out tfplan'
                sh 'terraform show tfplan > tfplan.txt'
            }
        }

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
                not {
                    equals expected: true, actual: params.destroy
                }
            }

            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Confirm do you want to apply this plan?"
                    parameters:[text(name: 'Plan', description: 'Review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            steps {
                sh 'terraform apply -input=false -out tfplan'
            }
        }

        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
            
            steps {
                sh 'terraform destroy --auto-approve'
            }
        }
    }
}