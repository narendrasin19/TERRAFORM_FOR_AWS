# ============================================================================
#                          TERRAFORM AWS PROVIDER CONFIGURATION
# ============================================================================
# This file configures the AWS provider with the necessary credentials and 
# specifies the AWS region for deploying the resources. Ensure that the access 
# key and secret key are securely managed and avoid hardcoding sensitive 
# information in production environments.
# ============================================================================

# AWS Provider configuration
provider "aws" {
  access_key = "xxxxxxxx"        # Replace with your AWS Access Key
  secret_key = "xxxxxxxx"  # Replace with your AWS Secret Key
  region     = "us-east-2"                   # Specify the AWS region
}

# ============================================================================
#                               SECURITY WARNING
# ============================================================================
# WARNING: Never commit your AWS credentials to version control. Use environment 
# variables, AWS Vault, or AWS IAM roles for more secure management of credentials.
# ============================================================================


