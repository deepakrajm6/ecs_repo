pipeline {
    agent any
    environment {
       ACCESS_KEY = "${ACCESS_KEY}"
       SECRET_KEY = "${SECRET_KEY}"
       AWS_REGION = "${AWS_REGION}"
       ECR_REPOSITORY = "${ECR_REPOSITORY}"
       ECS_CLUSTER = "${ECS_CLUSTER}"
       TASK_ROLE_NAME = "${TASK_ROLE_NAME}"
       TASK_DEFINITION_NAME = "${TASK_DEFINITION_NAME}"
       CONTAINER_NAME = "${CONTAINER_NAME}"
       DOCKER_IMAGE = "${DOCKER_IMAGE}"
       VARNAME1 = "${VARNAME1}"
       VARNAME2 = "${VARNAME2}"
       VARNAME3 = "${VARNAME3}"
       VARNAME4 = "${VARNAME4}"
       VARNAME5 = "${VARNAME5}"
       VARVAL1 = "${VARVAL1}"
       VARVAL2 = "${VARVAL2}"
       VARVAL3 = "${VARVAL3}"
       VARVAL4 = "${VARVAL4}"
       VARVAL5 = "${VARVAL5}"
       PORT_NUMBER = "${PORT_NUMBER}"
       SECURITY_GROUP_LB = "${SECURITY_GROUP_LB}"
       SECURITY_GROUP_ECS = "${SECURITY_GROUP_ECS}"
       LB_NAME = "${LB_NAME}"
       SUBNET1 = "${SUBNET1}"
       SUBNET2 = "${SUBNET2}"
       TARGET_GROUP = "${TARGET_GROUP}"
       SECURITY_POLICY = "${SECURITY_POLICY}"
       CERTIFICATE_ARN = "${CERTIFICATE_ARN}"
       ZONE_ID = "${ZONE_ID}"
       HOSTED_ZONE = "${HOSTED_ZONE}"
       HEALTH_CHECK_PATH = "${HEALTH_CHECK_PATH}"
       VPC_ID = "${VPC_ID}"
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
       		-var 'ACCESS_KEY=${ACCESS_KEY}' \
       		-var 'SECRET_KEY=${SECRET_KEY}' \
       		-var 'AWS_REGION=${AWS_REGION}' \
        	-var 'ECR_REPOSITORY=${ECR_REPOSITORY}' \
       		-var 'ECS_CLUSTER=${ECS_CLUSTER}' \
       		-var 'TASK_ROLE_NAME=${TASK_ROLE_NAME}' \
       		-var 'TASK_DEFINITION_NAME=${TASK_DEFINITION_NAME}' \
       		-var 'CONTAINER_NAME=${CONTAINER_NAME}' \
       		-var 'DOCKER_IMAGE=${DOCKER_IMAGE}' \
        	-var 'VARNAME1=${VARNAME1}' \
       		-var 'VARNAME2=${VARNAME2}' \
       		-var 'VARNAME3=${VARNAME3}' \
       		-var 'VARNAME4=${VARNAME4}' \
       		-var 'VARNAME5=${VARNAME5}' \
       		-var 'VARVAL1=${VARVAL1}' \
       		-var 'VARVAL2=${VARVAL2}' \
       		-var 'VARVAL3=${VARVAL3}' \
       		-var 'VARVAL4=${VARVAL4}' \
       		-var 'VARVAL5=${VARVAL5}' \
       		-var 'PORT_NUMBER=${PORT_NUMBER}' \
       		-var 'SECURITY_GROUP_LB=${SECURITY_GROUP_LB}' \
       		-var 'SECURITY_GROUP_ECS=${SECURITY_GROUP_ECS}' \
       		-var 'LB_NAME=${LB_NAME}' \
       		-var 'SUBNET1=${SUBNET1}' \
       		-var 'SUBNET2=${SUBNET2}' \
       		-var 'TARGET_GROUP=${TARGET_GROUP}' \
       		-var 'SECURITY_POLICY=${SECURITY_POLICY}' \
       		-var 'CERTIFICATE_ARN=${CERTIFICATE_ARN}' \
       		-var 'ZONE_ID=${ZONE_ID}' \
       		-var 'HOSTED_ZONE=${HOSTED_ZONE}' \
		-var 'HEALTH_CHECK_PATH=${HEALTH_CHECK_PATH}' \
		-var 'VPC_ID=${VPC_ID}'
                """
            }
        }
        stage('Terraform Destroy') {
            steps {
                sh """
                terraform $action -auto-approve \
		-var 'ACCESS_KEY=${ACCESS_KEY}' \
                -var 'SECRET_KEY=${SECRET_KEY}' \
                -var 'AWS_REGION=${AWS_REGION}' \
                -var 'ECR_REPOSITORY=${ECR_REPOSITORY}' \
                -var 'ECS_CLUSTER=${ECS_CLUSTER}' \
                -var 'TASK_ROLE_NAME=${TASK_ROLE_NAME}' \
                -var 'TASK_DEFINITION_NAME=${TASK_DEFINITION_NAME}' \
                -var 'CONTAINER_NAME=${CONTAINER_NAME}' \
                -var 'DOCKER_IMAGE=${DOCKER_IMAGE}' \
                -var 'VARNAME1=${VARNAME1}' \
                -var 'VARNAME2=${VARNAME2}' \
                -var 'VARNAME3=${VARNAME3}' \
                -var 'VARNAME4=${VARNAME4}' \
                -var 'VARNAME5=${VARNAME5}' \
                -var 'VARVAL1=${VARVAL1}' \
                -var 'VARVAL2=${VARVAL2}' \
                -var 'VARVAL3=${VARVAL3}' \
                -var 'VARVAL4=${VARVAL4}' \
                -var 'VARVAL5=${VARVAL5}' \
                -var 'PORT_NUMBER=${PORT_NUMBER}' \
                -var 'SECURITY_GROUP_LB=${SECURITY_GROUP_LB}' \
                -var 'SECURITY_GROUP_ECS=${SECURITY_GROUP_ECS}' \
                -var 'LB_NAME=${LB_NAME}' \
                -var 'SUBNET1=${SUBNET1}' \
                -var 'SUBNET2=${SUBNET2}' \
                -var 'TARGET_GROUP=${TARGET_GROUP}' \
                -var 'SECURITY_POLICY=${SECURITY_POLICY}' \
                -var 'CERTIFICATE_ARN=${CERTIFICATE_ARN}' \
                -var 'ZONE_ID=${ZONE_ID}' \
                -var 'HOSTED_ZONE=${HOSTED_ZONE}' \
		-var 'HEALTH_CHECK_PATH=${HEALTH_CHECK_PATH}' \
		-var 'VPC_ID=${VPC_ID}'
                """
            }
        }
    }
}

