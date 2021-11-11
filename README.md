Repo implementing this: https://docs.logz.io/shipping/prometheus-sources/aws-ec2-prometheus.html#Procedure

- [x] Set up IAM user (Terraform): https://docs.logz.io/shipping/prometheus-sources/aws-ec2-prometheus.html#set-up-your-iam-user
- [ ] https://docs.logz.io/shipping/prometheus-sources/aws-ec2-prometheus.html#collect-cloudwatch-metrics

1. Prerequisites are an AWS and logz.io account
1. Create IAM user and dummy EC2 instance by running `terraform init && terraform apply` in `setup-aws/` (requires a sandbox AWS profile)
1. Setup `.env` file with the following:

```
   AWS_ACCESS_KEY_ID=<<AWS_ACCESS_KEY_ID>> \
   AWS_SECRET_ACCESS_KEY=<<AWS_SECRET_ACCESS_KEY>> \
   AWS_DEFAULT_REGION=<<AWS_DEFAULT_REGION>> \
   LOGZIO_REGION=<<LOGZIO_REGION>> \
   LOGZIO_TOKEN=<<PROMETHEUS-METRICS-SHIPPING-TOKEN>> \
   AWS_NAMESPACES=<<AWS_NAMESPACES>> \
   SCRAPE_INTERVAL=<<SCRAPE_INTERVAL>> \
   P8S_LOGZIO_NAME=<<P8S_LOGZIO_NAME>> \

```

1. Run `run-docker.sh`
1. Check `http://localhost:5001/config/cloudwatch` and `http://localhost:5001/config/otel` to view service configurations
