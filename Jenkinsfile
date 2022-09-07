pipeline {
    agent any
    tools {
        "org.jenkinsci.plugins.terraform.TerraformInstallation" "terraform"
    }

    environment {
        TF_INPUT = "0"
        TF_IN_AUTOMATION = "TRUE"
        TF_LOG = "WARN"
        AWS_ACCESS_KEY_ID = credentials('aws_access_key')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    }

    stages {
        stage('TerraformInit'){
            steps {
                sh 'cd ansible-notes/Iac_Scripts/EC2-components/Jenkinsfile'
                    sh 'terraform --version'
                    sh 'terraform init'
                }
            }
        }
        stage('TerraformValidate'){
            steps {
                sh 'cd ansible-notes/Iac_Scripts/EC2-components/Jenkinsfile'
                sh 'terraform validate'
                }
            }
        stage('TerraformPlan'){
            steps {
                sh 'cd ansible-notes/Iac_Scripts/EC2-components/Jenkinsfile'
                    script {
                        try {
                           sh 'terraform plan'
                        } catch (err) {
                            sh 'terraform plan'
                        }
            }
		}
      }
        stage('TerraformApply'){
            steps {
                script{
                    def apply = false
                    try {
                        input message: 'confirm apply', ok: 'Apply Config'
                        apply = true
                    } 
      					catch (err) {
                        apply = false
                        sh 'cd ansible-notes/Iac_Scripts/EC2-components/Jenkinsfile'
                        sh 'terraform destroy -auto-approve'
                        }
                        currentBuild.result = 'UNSTABLE'
                    }
                    if(apply){
                        sh 'cd ansible-notes/Iac_Scripts/EC2-components/Jenkinsfile'
                        sh 'terraform apply --auto-approve'
                        }
                }
            }
	}
