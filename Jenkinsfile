pipeline {
    agent any
    environment {
       ACCESS_KEY = "${ACCESS_KEY}"
       SECRET_KEY = "${SECRET_KEY}"
       AWS_REGION = "${AWS_REGION}"
       JD_NAME = "${JD_NAME}"
       ECR_IMAGE = "${ECR_IMAGE}"
       CPU_VALUE = "${CPU_VALUE}"
       MEM_VALUE = "${MEM_VALUE}"
       ENV1_NAME = "${ENV1_NAME}"
       ENV1_VALUE = "${ENV1_VALUE}"
       ENV2_NAME = "${ENV2_NAME}"
       ENV2_VALUE = "${ENV2_VALUE}"
       ENV3_NAME = "${ENV3_NAME}"
       ENV3_VALUE = "${ENV3_VALUE}"
       ENV4_NAME = "${ENV4_NAME}"
       ENV4_VALUE = "${ENV4_VALUE}"
       ENV5_NAME = "${ENV5_NAME}"
       ENV5_VALUE = "${ENV5_VALUE}"
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
                -var 'JD_NAME=${JD_NAME}' \
                -var 'ECR_IMAGE=${ECR_IMAGE}' \
                -var 'CPU_VALUE=${CPU_VALUE}' \
                -var 'MEM_VALUE=${MEM_VALUE}' \
                -var 'ENV1_NAME=${ENV1_NAME}' \
                -var 'ENV1_VALUE=${ENV1_VALUE}' \
                -var 'ENV2_NAME=${ENV2_NAME}' \
                -var 'ENV2_VALUE=${ENV2_VALUE}' \
                -var 'ENV3_NAME=${ENV3_NAME}' \
                -var 'ENV3_VALUE=${ENV3_VALUE}' \
                -var 'ENV4_NAME=${ENV4_NAME}' \
                -var 'ENV4_VALUE=${ENV4_VALUE}' \
                -var 'ENV5_NAME=${ENV5_NAME}' \
                -var 'ENV5_VALUE=${ENV5_VALUE}'                
                """
            }
        }
        stage('Terraform Destroy') {
            steps {
                sh """
                terraform $action -auto-approve \
                -var 'JD_NAME=${JD_NAME}' \
                -var 'ECR_IMAGE=${ECR_IMAGE}' \
                -var 'CPU_VALUE=${CPU_VALUE}' \
                -var 'MEM_VALUE=${MEM_VALUE}' \
                -var 'ENV1_NAME=${ENV1_NAME}' \
                -var 'ENV1_VALUE=${ENV1_VALUE}' \
                -var 'ENV2_NAME=${ENV2_NAME}' \
                -var 'ENV2_VALUE=${ENV2_VALUE}' \
                -var 'ENV3_NAME=${ENV3_NAME}' \
                -var 'ENV3_VALUE=${ENV3_VALUE}' \
                -var 'ENV4_NAME=${ENV4_NAME}' \
                -var 'ENV4_VALUE=${ENV4_VALUE}' \
                -var 'ENV5_NAME=${ENV5_NAME}' \
                -var 'ENV5_VALUE=${ENV5_VALUE}'
                """
            }
        }
    }
}

