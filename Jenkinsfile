pipeline {
    agent any
    stages {
        stage('Code Checkout') {
            steps{
                git branch: 'main', credentialsId: '77f45d28-6802-4968-a123-0bc5db63066b', url: 'https://github.com/send2durai/terraform-cicd-project.git'
            }
        }
        stage ("Terraform Init") {
            steps {
                echo "going to initialize the terraform module and download the required plugin"
                sh 'terraform init'
            }
        }
        stage("Terraform Formatt"){
            steps{
                echo "going to rewrite Terraform configuration files to a canonical format and style"
                sh 'terraform fmt'
            }
        }
        stage("Terraform Validate"){
            steps{
                echo "going to validates the configuration files in a directory"
                sh 'terraform validate'
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
