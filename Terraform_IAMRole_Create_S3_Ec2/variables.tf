# 1. AWS Access Key Variable Declaration (Sensitive information should be managed securely)
variable "AWS_ACCESS_KEY" {
  type    = string
  default = ""  # Prefer setting this through environment variables
  description = "AWS Access Key ID"
  sensitive = true
}

# 2. AWS Secret Key Variable Declaration (Marked as sensitive)
variable "AWS_SECRET_KEY" {
  type    = string
  description = "AWS Secret Access Key"
  sensitive = true
}

# 3. AWS Region Variable Declaration
variable "AWS_REGION" {
  type    = string
  default = "us-east-2"
  description = "AWS Region to deploy resources"
}

# 4. AMI Mapping Variable Declaration
variable "AMIS" {
  type    = map(string)
  default = {
    us-east-1 = "ami-0f40c8f97004632f9"
    us-east-2 = "ami-05692172625678b4e"
    us-west-2 = "ami-0352d5a37fb4f603f"
    us-west-1 = "ami-0f40c8f97004632f9"
  }
  description = "Map of AMI IDs by AWS region"
}

# 5. Path to Private Key Variable Declaration
variable "PATH_TO_PRIVATE_KEY" {
  type    = string
  default = "levelup_key"
  description = "Path to the private SSH key file"
}

# 6. Path to Public Key Variable Declaration
variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "levelup_key.pub"
  description = "Path to the public SSH key file"
}

# 7. Instance Username Variable Declaration
variable "INSTANCE_USERNAME" {
  type    = string
  default = "ubuntu"
  description = "Default username for SSH access to the EC2 instance"
}

