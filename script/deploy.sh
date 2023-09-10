#! /bin/bash 

sudo apt update -y

sudo apt upgrade -y

sudo apt install docker docker.io -y

sudo apt install awscli -y

aws configure set aws_access_key_id 

aws configure set aws_secret_access_key 

sudo chmod 666 /var/run/docker.sock

aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin ecr_repo

aws eks --region eu-west-3 update-kubeconfig --name eks

MOD_DOCKER_IMG=$(echo  | sed "s|:|-|g")

sed -e "s|DOCKER_IMG|${MOD_DOCKER_IMG}|g" -e "s|ECR_REPO|ecr_repo|g" node-deployment-template.yaml > node-deployment.yaml

kubectl apply -f node-deployment.yaml

# docker pull ecr_repo:$MOD_DOCKER_IMG

# docker run -d -p 3000:3000 ecr_repo:$MOD_DOCKER_IMG