output "secret" {
  value = aws_iam_access_key.cloudwatch.encrypted_secret
}
