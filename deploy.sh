#!/bin/bash

FILE_NAME="zipkin-$(date +%s)"
FILE_EXT=".zip"

REGION=us-east-1
ACCOUNT_ID=$(aws ec2 describe-security-groups --group-names 'Default' --query 'SecurityGroups[0].OwnerId' --output text --region ${REGION})

zip ${FILE_NAME} -r .ebextensions Dockerrun.aws.json

S3_BUCKET=elasticbeanstalk-${REGION}-${ACCOUNT_ID}
aws s3 cp ${FILE_NAME}${FILE_EXT} s3://${S3_BUCKET}/zipkin/${FILE_NAME}${FILE_EXT}
aws elasticbeanstalk create-application-version --region ${REGION} --application-name zipkin --version-label ${FILE_NAME} --source-bundle S3Bucket=${S3_BUCKET},S3Key=zipkin/${FILE_NAME}${FILE_EXT}

aws elasticbeanstalk update-environment --region ${REGION} --application-name zipkin --environment-name zipkin --version-label ${FILE_NAME}

rm zipkin*.zip
