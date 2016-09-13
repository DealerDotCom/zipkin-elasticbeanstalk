# zipkin-elasticbeanstalk

Simple way to get zipkin server running in AWS ElasticBeanstalk

## Bootstrapping

You can use the AWS Web Console to create your Docker application and environment OR go through the following steps.

```
aws s3 mb elasticbeanstalk-${AWS_REGION}-${AWS_ACCOUNT_ID}

aws elasticbeanstalk create-application --application-name zipkin

# Solution stacks names found here: http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html
# Choose the latest docker one
aws elasticbeanstalk create-environment --application-name zipkin --environment-name zipkin --solution-stack-name ${SOLUTION_STACK_NAME}
```

## Configuring

All config values can be set in `.ebextensions/env.config`. Valid values include all those from
https://github.com/openzipkin/zipkin/blob/master/zipkin-server/README.md

The image version should be updated in `Dockerrun.aws.json`
