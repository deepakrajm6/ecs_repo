pipeline {
    agent any
    environment {
       ACCESS_KEY = "${ACCESS_KEY}"
       SECRET_KEY = "${SECRET_KEY}"
       AWS_REGION = "${AWS_REGION}"
       ECR_REPOSITORY = "${ECR_REPOSITORY}"
    }
    stages {
        stage('Terraform init') {
            steps {
                sh "terraform init"
            }
        }
        stage('Terraform Apply') {
            steps {
                sh """
                terraform $action -auto-approve \
                -var 'ECR_REPOSITORY=${ECR_REPOSITORY}'
                """
            }
        }
        stage('Terraform Destroy') {
            steps {
                sh """
                terraform $action -auto-approve \
                -var 'ECR_REPOSITORY=${ECR_REPOSITORY}'
                """
            }
        }
    }
}

