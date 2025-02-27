#!/bin/bash

echo "Starting DynamoDB Local..."
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb &
sleep 5

export AWS_ACCESS_KEY_ID=local
export AWS_SECRET_ACCESS_KEY=local
export AWS_DEFAULT_REGION=us-west-2

aws configure set aws_access_key_id local
aws configure set aws_secret_access_key local
aws configure set region us-west-2
aws configure set output json

aws dynamodb create-table \
    --table-name orders \
    --attribute-definitions AttributeName=id,AttributeType=S \
    --key-schema AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://localhost:8000

tail -f /dev/null