#These variables are essential for customizing and securely managing your Terraform configurations. 
#They allow you to:
# Define security groups to control network traffic.
# Use different AMIs depending on the AWS region.
# Provide paths to SSH keys for secure instance access.
# Define a default username for SSH connections.

# Define security groups to control network traffic.

# variables.tf

variable "AWS_ACCESS_KEY" {
  type = string
  description = "AWS Access Key"
}

variable "AWS_SECRET_KEY" {
  type = string
  description = "AWS Secret Key"
}

variable "AWS_REGION" {
  type = string
  default = "us-east-2"
  description = "AWS Region"
}


# Define security groups to control network traffic.
  variable "Security_Group"{
    type = list
    default = ["sg-027ac67a0bb93c534", "sg-02980770bc842d899", "sg-456789"]
}

# Use different AMIs depending on the AWS region.
  variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05803413c51f242b7" # You can override the AMI ID here if needed
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"

    }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
} 
                       

