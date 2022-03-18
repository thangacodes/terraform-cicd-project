pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('jenkins-aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key-id')
    }
    stage('Git checkouts'){
        steps{
            echo "Going to clone the github repository"
            git branch: 'main', url: 'https://github.com/send2durai/terraform-cicd-project.git'
        }
    }
    stage ('Going to initialize terraform plugin w.r.t aws provider'){
        steps{
            echo "Executing Terraform init command"
            sh 'terraform init'
        }
    }
    stage ('Going to format the terraform code'){
        steps{
            echo "Executing Terraform fmt command"
            sh 'terraform fmt'
        }
    }
    stage ('Going to validate the terraform code'){
        steps{
            echo "Executing Terraform validate the code that we written"
            sh 'terraform validate'
        }
    }
    stage ('Going to end of the jenkins pipeline'){
        steps{
            echo "Happy Coding"
        }
    }
}
