# Configure the AWS provider with access credentials and region
provider "aws" {

  # Access key for AWS account (retrieved from variable 'AWS_ACCESS_KEY')
  access_key = var.AWS_ACCESS_KEY

  # Secret key for AWS account (retrieved from variable 'AWS_SECRET_KEY')
  secret_key = var.AWS_SECRET_KEY

  # AWS region where resources will be created (retrieved from variable 'AWS_REGION')
  region = var.AWS_REGION
}
