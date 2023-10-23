#!/usr/bin/env bash

# Check if the correct number of arguments are provided

# if [ $# -ne 2 ]; then
#   echo "Usage: $0 run <service>"
#   exit 1
# fi

command=$1
service=$2

if [ "$command" == 'run' ]
then
  if [ "$service" == 'all' ]
  then
    java -jar microservices/product-composite-service/build/libs/*.jar &
    java -jar microservices/product-service/build/libs/*.jar &
    java -jar microservices/recommendation-service/build/libs/*.jar &
    java -jar microservices/review-service/build/libs/*.jar &
  elif [ "$service" == 'product' ]
  then
    java -jar microservices/product-service/build/libs/*.jar &
  else
    echo "Unknown service: $service"
  fi
elif [ "$command" == 'stop-jobs' ]
then
  kill $(jobs -p)
else
  echo "Unknown command: $command"
fi