# output.tf

# Output for S3 bucket name
output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.levelup_s3bucket.bucket
}

# Output for S3 bucket ARN
output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.levelup_s3bucket.arn
}
