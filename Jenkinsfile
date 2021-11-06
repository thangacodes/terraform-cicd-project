pipeline {
    agent any
    stages {
        stage('Code Checkout') {
            steps{
                git branch: 'main', url: 'https://github.com/send2durai/terraform-cicd-project.git'
            }
        }
        stage ("Terraform Init") {
            steps {
                echo "going to initialize the terraform module and download the required plugin"
                sh 'terraform init'
            }
        }
        stage("Terraform Plan"){
            steps{
                echo "going to evaluates a Terraform configuration to determine the desired state of all the resources it declares"
                sh 'terraform plan'
            }
        }
        stage("Terraform Apply"){
            steps{
                echo "going to executes the actions proposed in terraform plan"
                sh 'terraform apply --auto-approve'
            }
        }
    }
    post {
        always {
            echo "Going to send out an Job Notifications"
        }
        failure {
            slackSend channel: 'devops', message: 'Hey DevOps Team  #########  Jenkins Pipeline Job is Failure  #########'
        }
        success {
            slackSend channel: 'devops', message: 'Hey DevOps Team  #########  Jenkins Pipeline Job is Succeed  #########'
        }
    }
}
