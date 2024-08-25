# This file is used to configure remote state storage, 
#such as storing the Terraform state file in an S3 bucket.

# backend.tf

terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "path/to/my/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

# Note: Replace my-terraform-state-bucket, path/to/my/terraform.tfstate, and terraform-lock-table with your actual S3 bucket name, state file path, and DynamoDB table name for state locking.