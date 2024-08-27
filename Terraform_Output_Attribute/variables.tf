# This Terraform configuration defines essential variables for deploying AWS resources.
# Variable for AWS Access Key

# variable.tf
variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIASMSIZOF42P2VUDSZ"
}

# Variable for AWS Secret Key
variable "AWS_SECRET_KEY" {}

# Variable for AWS Region
variable "AWS_REGION" {
default = "us-east-2"
}

# Variable for Security Groups
variable "Security_Group"{
    type = list
    default = ["sg-24076", "sg-90890", "sg-456789"]
}

# Variable for AMIs by Region
variable "AMIS" {
    type = map
    default = {
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}


