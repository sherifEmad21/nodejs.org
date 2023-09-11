#! /bin/bash

aws configure set aws_access_key_id ACCESS_KEY

aws configure set aws_secret_access_key SECRET_KEY

# ecr_repo=$(terraform output -raw ecr_url)

sudo chmod 666 /var/run/docker.sock

aws ecr get-login-password --region eu-west-3 | docker login --username AWS --password-stdin ECR_REPO

MOD_DOCKER_IMG=$(echo IMG_NAME | sed "s|:|-|g")

docker tag IMG_NAME ECR_REPO:$MOD_DOCKER_IMG

docker push ECR_REPO:$MOD_DOCKER_IMG