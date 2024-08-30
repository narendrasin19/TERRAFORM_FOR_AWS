# Variable for AWS Access Key
variable "AWS_ACCESS_KEY" {
  type    = string
  default = "AKIASMSIZOF42P2VUDSZ"  # Default access key (should be secured)
}

# Variable for AWS Secret Key (keep this value secure, usually provided at runtime or through environment variables)
variable "AWS_SECRET_KEY" {}

# Variable for AWS Region to deploy resources
variable "AWS_REGION" {
  default = "us-east-2"  # Default AWS region
}

# Mapping of AMI IDs per AWS region
variable "AMIS" {
  type = map  # Defines a map of region-specific AMI IDs
  default = {
    us-east-1 = "ami-0f40c8f97004632f9"  # AMI ID for us-east-1 region
    us-east-2 = "ami-05692172625678b4e"  # AMI ID for us-east-2 region
    us-west-2 = "ami-0352d5a37fb4f603f"  # AMI ID for us-west-2 region
    us-west-1 = "ami-0f40c8f97004632f9"  # AMI ID for us-west-1 region
  }
}

# Variable for the path to the private key file
variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"  # Default path to the private key file
}

# Variable for the path to the public key file
variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"  # Default path to the public key file
}

# Variable for the instance username (usually set according to the AMI's default user)
variable "INSTANCE_USERNAME" {
  default = "ubuntu"  # Default username for instance access
}
