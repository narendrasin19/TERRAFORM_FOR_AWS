# 1. Create a Random ID for S3 Bucket Name Suffix
resource "random_id" "s3_bucket_suffix" {
  byte_length = 8  # 1.1. Length of the random ID in bytes to ensure uniqueness
}

# 2. Create an AWS S3 Bucket with Unique Name
resource "aws_s3_bucket" "levelup_s3bucket" {
  bucket = "levelup-bucket-${random_id.s3_bucket_suffix.hex}"  # 2.1. Bucket name with a unique suffix
}

# 3. Create an ACL for the AWS S3 Bucket
#resource "aws_s3_bucket_acl" "levelup_s3bucket_acl" {
#  bucket = aws_s3_bucket.levelup_s3bucket.id  # 3.1. Reference to the S3 bucket
#  acl    = "private"                          # 3.2. Access control list set to private
#}
