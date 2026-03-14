#!/bin/bash

set -e

exec > /var/log/user-data.log 2>&1

REGION="us-east-1"
ACCOUNT_ID="330857832776"
REPOSITORY="twitter-repo"
IMAGE_TAG="latest"

APP_PORT=8082
CONTAINER_PORT=8080

dnf update -y
dnf install -y docker aws-cli

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

sleep 10

aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$IMAGE_TAG

docker stop blogging-app || true
docker rm blogging-app || true

docker run -d \
--name blogging-app \
-p $APP_PORT:$CONTAINER_PORT \
--restart always \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY:$IMAGE_TAG
