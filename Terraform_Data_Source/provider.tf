# Provider Configuration: AWS
provider "aws" {
  # Access Key Configuration
  access_key = var.AWS_ACCESS_KEY
  # Secret Key Configuration
  secret_key = var.AWS_SECRET_KEY
  # Region Configuration
  region     = var.AWS_REGION
}