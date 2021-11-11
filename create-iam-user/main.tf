terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "sandbox"
  region  = "eu-west-1"
}

resource "aws_iam_user" "cloudwatch" {
  name = "cloudwatch_logz.io"
}

resource "aws_iam_access_key" "cloudwatch" {
  user = aws_iam_user.cloudwatch.name
}

resource "aws_iam_user_policy" "cloudwatch" {
  name = "test"
  user = aws_iam_user.cloudwatch.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
