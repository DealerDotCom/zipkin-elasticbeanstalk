# zipkin-elasticbeanstalk

Simple way to get zipkin server running in AWS ElasticBeanstalk

## Configuring

All config values can be set in `.ebextensions/env.config`. Valid values include all those from
https://github.com/openzipkin/zipkin/blob/master/zipkin-server/README.md

The image version should be updated in `Dockerrun.aws.json`
