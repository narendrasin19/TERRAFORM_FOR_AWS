# Terraform Basics: AWS EC2 Instance Setup

## Overview
This project provides a basic setup for provisioning an AWS EC2 instance using Terraform. The configuration includes defining an instance with optional parameters like security group, subnet, and availability zone. 

## Files in the Project
- **CreateEc2.tf**: Contains the main Terraform configuration for creating an EC2 instance.
- **provider.tf**: Configures the AWS provider with necessary credentials and region settings.
- **output.tf**: Defines outputs to display useful information after the EC2 instance is created.
- **terraform.tfstate**: Maintains the state of the managed infrastructure and configuration.
- **terraform.tfstate.backup**: A backup of the last known state, useful for state recovery.

## Prerequisites
- Terraform installed on your local machine.
- An AWS account with IAM user credentials that have the necessary permissions to create EC2 instances.
- AWS CLI installed and configured (optional but recommended for managing AWS resources).

## Getting Started

### 1. Clone the Repository
Clone this repository to your local machine:
git clone https://github.com/your-username/Terraform_Basics.git
cd Terraform_Basics
==============================================================================
# Terraform Basics: AWS EC2 Instance Setup
=============================================================================
This guide provides step-by-step instructions for setting up a basic AWS EC2 instance using Terraform. Follow these steps to configure, plan, and deploy your infrastructure.

## Files Overview
- `provider.tf`: Configures the AWS provider.
- `CreateEc2.tf`: Contains the Terraform configuration to create an EC2 instance.
- `output.tf`: Defines the output variables, such as the instance's public IP.

## Step-by-Step Guide

### Step 1: Initialize Terraform
The first step is to initialize your working directory. This downloads the necessary provider plugins and sets up your Terraform environment.
# Initialize Terraform
terraform init

Description: Initializes the Terraform working directory. Downloads necessary provider plugins specified in your configuration (e.g., AWS provider).

Step 2: Validate the Configuration
Before deploying any resources, validate the syntax and structure of your configuration files.


# Validate the configuration files
terraform validate
Description: Checks the configuration files for syntax errors.
Ensures your code is syntactically correct and ready for deployment.

Step 3: Plan the Infrastructure Changes
Create an execution plan that shows what actions Terraform will take when you apply the configuration.

# Generate and review the execution plan
terraform plan
Description: Compares the current state with your configuration.
Proposes changes, such as creating, modifying, or destroying resources.
Allows you to review the plan to ensure changes match expectations.

Step 4: Apply the Configuration
Apply the configuration to create or update resources on AWS.


# Apply the configuration to deploy the resources
terraform apply

Description: Applies the changes required to reach the desired state of the configuration.
Creates the EC2 instance and other resources defined in your configuration files.
Prompts for confirmation before proceeding with deployment. Type yes when prompted.

Step 5: Verify the Deployment
After applying the configuration, verify that the EC2 instance and other resources have been created successfully by checking the AWS Management Console or using AWS CLI commands.

Step 6: Destroy the Infrastructure (Optional)
To clean up the resources and remove everything created by Terraform, use the destroy command.


# Destroy the infrastructure and clean up resources
terraform destroy
Description: Removes all resources defined in your configuration.
Provides a safe way to clean up and remove infrastructure no longer needed.
Prompts for confirmation before destroying resources. Type yes to confirm.
Example Terraform Configuration Files

# provider.tf

provider "aws" {
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
  region     = "us-east-2"
}


# CreateEc2.tf

# Main Terraform configuration for EC2 instance
resource "aws_instance" "example" {

  # Specify the AMI ID for the EC2 instance
  ami           = "ami-05803413c51f242b7" # Amazon Linux 2 AMI

  # Define the instance type
  instance_type = "t2.micro"

  # Adding a basic tag to the instance
  tags = {
    Name = "MyFirstInstance" # Instance Name
  }

  # Adding a key pair (optional, replace with your own key pair name if needed)
  # key_name = "your-key-pair-name"

  # Specify the security group ID (optional, defaults will be applied if not specified)
  vpc_security_group_ids = ["sg-027ac67a0bb93c534"]

  # Define the subnet ID (optional, defaults will be applied if not specified)
  subnet_id = "subnet-03f665de6ce29e442"

  # Specify the availability zone (optional, defaults will be applied if not specified)
  availability_zone = "us-east-2a"

  # Configure the root block device (optional, defaults will be applied if not specified)
  root_block_device {
    volume_size = 8 # Size in GB
  }
}


# output.tf

# Output the public IP of the EC2 instance
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

Summary
Initialize with terraform init to set up your environment. 
Validate with terraform validate to ensure correct configuration.
Plan with terraform plan to review proposed changes.
Apply with terraform apply to deploy the infrastructure.
Destroy with terraform destroy when cleanup is needed.
Ensure that each step is followed correctly to avoid deployment issues, and always review the execution plan before applying changes to production environments.

