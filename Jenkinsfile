pipeline {
    agent any

    environment {
        USER_CREDENTIALS = credentials('docker_account')
        DOCKER_IMAGE = "node-docker:v2"
        //  DOCKER_IMAGE = "node-docker:v${BUILD_ID}"
        MOD_DOCKER_IMAGE="${DOCKER_IMAGE}".replaceAll(':', '-')
        DOCKER_USERNAME = "${USER_CREDENTIALS_USR}"
        DOCKER_PASSWORD = "${USER_CREDENTIALS_PSW}"

        AWS_CREDENTIALS = credentials('aws_credentials')
        ACCESS_KEY = "${AWS_CREDENTIALS_USR}"
        SECRET_KEY = "${AWS_CREDENTIALS_PSW}"
    }

    stages {
        // stage("install dependencies") {

        //     steps {
        //         sh 'npm ci'
        //     }
        //     post {
        //         success {
        //             echo "Dependencies installed successfully"
        //         }
        //         failure {
        //             echo "Something went wrong please try again later"
        //         }

        //     }

        // }

        // stage("Test&Build"){
        //     parallel {
        //         stage("Test") {

        //             steps {
        //                 sh 'npm run test:unit'
        //             }

        //         }
        //         stage("Build") {

        //             steps {
        //                 sh 'npm run build'
        //             }

        //         }
        //     }
        // }

        // stage('Sonarqube scan') {
        //     steps {
        //         script{
        //             def sonarScannerHome = tool name: 'sq1', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
        //             withSonarQubeEnv(installationName: "sq1") {
        //                 sh """
        //                     ${sonarScannerHome}/bin/sonar-scanner \
        //                     -Dsonar.projectKey=nodejs \
        //                     -Dsonar.sources=. \
        //                     -Dsonar.host.url=${env.SONAR_HOST_URL} \
        //                     -Dsonar.login=${env.SONAR_AUTH_TOKEN} \
        //                     -Dsonar.projectName=nodejs \
        //                 """
        //             }
        //         }
        //    }
        // }

        // stage("Sonarqube quality gate check") {
        //     steps {
        //         timeout(time: 2, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }

        // stage('Docker Build') {

        //     steps {
        //         sh "docker build -t ${DOCKER_IMAGE} ."
        //     }
        // }

        // stage('Pass the access keys to provider') {
        //     steps {
        //         dir("./terraform") {
        //             sh """
        //               sed -e "s|ACCESS_KEY_TO_REPLACE|${ACCESS_KEY}|g" -e "s|SECRET_KEY_TO_REPLACE|${SECRET_KEY}|g" terraformvar-template.txt > terraform.tfvars 

        //             """
        //         }
        //     }
        // }

        // stage('Create Infrastructure'){
        //     steps {
        //         dir("./terraform"){
        //             sh 'terraform init'
        //             sh "terraform plan"
        //             sh 'terraform destroy --auto-approve'
        //             sh 'terraform apply --auto-approve'
        //         }
        //     }
        // }

        stage("Push to ECR"){
            steps {
                dir("./script"){
                   script {

                        // def ecr_repo = sh(script: 'cd ../terraform && terraform output -raw ecr_url', returnStdout: true).trim()

                        // sed -e "s|DOCKER_IMG|${DOCKER_IMAGE}|g" -e "s|ECR_REPO|${ecr_repo}|g" node-deployment-template.yaml > node-deployment.yaml

                        sh """
                            
                            
                            sed -e "s|DOCKER_IMG|${DOCKER_IMAGE}|g" -e "s|ECR_REPO|${MOD_DOCKER_IMAGE}|g" node-deployment-template.yaml > node-deployment.yaml

                            cat node-deployment.yaml

                        """



                        // sh """
                        //     sed -e "s|ACCESS_KEY|${ACCESS_KEY}|g" -e "s|SECRET_KEY|${SECRET_KEY}|g" -e "s|IMG_NAME|${DOCKER_IMAGE}|g" -e "s|ECR_REPO|${ecr_repo}|g" pushToECR-template.sh > pushToECR.sh
                        // """

                        // sh 'chmod +x pushToECR.sh'
                        // sh "./pushToECR.sh"
                   }

                }

            }
        }


        // stage("Deploy to EKS") {
        //     when {
        //         branch 'dev'
        //     }
        //     steps {
        //         dir("./script") {
        //             script {
        //                 def ecr_repo = sh(script: 'cd ../terraform && terraform output -raw ecr_url', returnStdout: true).trim()
                        
        //                 sh """
        //                     sed -e "s|ACCESS_KEY|${ACCESS_KEY}|g" -e "s|SECRET_KEY|${SECRET_KEY}|g" -e "s|IMG_NAME|${DOCKER_IMAGE}|g" -e "s|ECR_REPO|${ecr_repo}|g" deploy-template.sh > deploy.sh
        //                 """
        //                 sh "chmod +x deploy.sh"
        //                 sh "./deploy.sh"
        //             }
        //         }
        //     }

        //     post {
        //         success {
        //             echo "Successfully deployed to AWS"
        //         }

        //         failure {
        //             dir("./terraform") {
        //                 sh 'terraform destroy --auto-approve'
        //             }
        //         }
        //     }
        // }

        // stage("Smoke test on deployment") {
        //     when {
        //         branch 'dev'
        //     }

        //     steps {
        //         dir("./terraform/EC2") {
        //             script {
        //                 def ecr_repo = sh(script: 'cd ../ECR && terraform output -raw ecr_url', returnStdout: true).trim()
                        
        //                 sh """
        //                     sed -e "s|ACCESS_KEY|${ACCESS_KEY}|g" -e "s|SECRET_KEY|${SECRET_KEY}|g" -e "s|IMG_NAME|${DOCKER_IMAGE}|g" -e "s|ECR_REPO|${ecr_repo}|g" dockerRun-template.sh > dockerRun.sh
        //                 """
        //                 sh 'terraform init'
        //                 sh 'terraform plan'
        //                 sh 'terraform destroy --auto-approve'
        //                 sh 'terraform apply --auto-approve'
        //             }
        //         }
        //     }

        //     post {
        //         success {
        //             echo "Smoke test successful"
        //         }

        //         failure {
        //             echo "Public IP not available yet. Please wait and try again later."
        //         }

        //     }
        // }


    }
}
