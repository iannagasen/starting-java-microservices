#!/usr/bin/env bash

### COMMENTED THIS CODE SINCE #############################################################
### DOCKER COMPOSE WILL BE USE RATHER THAN MANUAL DOCKER COMMANDS #########################
###########################################################################################
#
#bash ./gradlew :microservices:product-service:build
#cd microservices/product-service
#
#echo 'Building Product Service Container'
#docker build -t product-service .
#
#if [[ $(docker images | grep product-service) != '' ]]
#then
#  echo 'Product Service Container was build'
#  echo 'Ready for running...'
#fi
#
#docker run -d \                             # run in detached mode
#  -p 8080:8080 \                            # port 8080
#  -e "SPRING_PROFILES_ACTIVE=docker" \      # set environment variable
#  --name my-prd-srv \                       # set the name
#  product-service
#

echo 'Gradle is Building the jar'
sleep 2
bash ./gradlew build
echo 'Gradle is finish building...'

echo 'Docker is building the images'
sleep 2
docker-compose build
echo 'Docker is finished building...'
echo -e $(docker images | grep chapter04)

echo 'Docker preparing to run the containers...'
sleep 2
docker-compose up -d
echo 'Containers are now running'
echo 'Run `docker-compose logs -f` to monitor each containers logs'
echo 'Run `docker-compose down to shut down the containerized services`'


