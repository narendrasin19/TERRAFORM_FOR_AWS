# This file defines input variables that make your Terraform configurations more flexible and reusable. 
# You can define default values and specify variable types here.

# This file defines the variables that are used in main.tf and provider.tf.
# This file defines the variables that are used in main.tf and provider.tf.
# variables.tf

variable "AWS_ACCESS_KEY" {
  description = "The AWS access key"
  type        = string
}

variable "AWS_SECRET_KEY" {
  description = "The AWS secret key"
  type        = string
}

variable "AWS_Region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-2"  # Set your default region here
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-05803413c51f242b7"  # Example AMI ID
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"  # Example instance type
}

variable "security_group_ids" {
  description = "A list of security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = ["sg-027ac67a0bb93c534", "sg-02980770bc842d899"]  # Added another security group ID
}

variable "tags" {
  description = "A map of tags to assign to the EC2 instance"
  type        = map(string)
  default     = {
    Name        = "my-instance"
    Environment = "production"
  }
}
