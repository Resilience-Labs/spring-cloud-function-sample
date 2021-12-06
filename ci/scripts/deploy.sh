#!/bin/bash

function lambda_exists() {
  aws lambda get-function --function-name $1 > /dev/null 2>&1
    if [ 0 -eq $? ]; then
      echo "Lambda '$1' exists! Updating"
      aws lambda update-function-code --profile $AWS_PROFILE \
          --function-name $1 \
          --zip-file fileb://build/libs/awsLamdaWask.jar
    else
      echo "Lambda '$1' does not exist. Creating..."
      aws lambda create-function --profile $AWS_PROFILE \
          --function-name $1 \
          --zip-file fileb://build/libs/awsLamdaWask.jar \
          --role $AWS_ROLE \
          --handler org.springframework.cloud.function.adapter.aws.FunctionInvoker::handleRequest \
          --runtime java11 --timeout 60 --memory-size 300
    fi
}

lambda_exists $1