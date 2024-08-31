# 1. Create a Random ID for S3 Bucket Name Suffix
resource "random_id" "bucket_suffix" {
  byte_length = 8  # 1.1. Length of the random ID in bytes to ensure uniqueness
}

# 2. Create an AWS S3 Bucket with Unique Name
resource "aws_s3_bucket" "levelup_s3bucket" {
  bucket = "levelup-bucket-${random_id.bucket_suffix.hex}"  # 2.1. Bucket name with a unique suffix
  acl    = "private"                                        # 2.2. Access control list set to private
}
