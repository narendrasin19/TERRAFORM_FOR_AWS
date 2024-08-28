# Define AWS Provider Configuration
provider "aws" {
  # AWS Access Key
  access_key = var.AWS_ACCESS_KEY
  
  # AWS Secret Key
  secret_key = var.AWS_SECRET_KEY
  
  # AWS Region
  region     = var.AWS_REGION
}
