# This file provides documentation for your Terraform project. It’s a good practice to include a README file that explains the purpose of the project, how to use the Terraform configurations, and any prerequisites.

# Terraform AWS EC2 Instance

This Terraform project sets up an AWS EC2 instance with the following configuration:

- **AMI:** `ami-05803413c51f242b7`
- **Instance Type:** `t2.micro`
- **AWS Region:** `us-east-2`

## Prerequisites

Before using this Terraform configuration, ensure you have the following:

- **Terraform Installed:** Make sure Terraform is installed on your machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
- **AWS Account:** You need an AWS account with appropriate IAM permissions to create and manage EC2 instances.
- **S3 Bucket and DynamoDB Table:** If using a remote backend for state management, ensure you have an S3 bucket and DynamoDB table set up in your AWS account.

## Files and Directories

- **`main.tf`**: This file defines the AWS EC2 instance resource.
- **`provider.tf`**: Configures the AWS provider with the necessary region and credentials.
- **`variables.tf`**: Declares variables that can be customized for different environments.
- **`terraform.tfvars`**: Contains sensitive variable values such as AWS access keys (this file should be excluded from version control).
- **`outputs.tf`**: Specifies the outputs for the EC2 instance, such as its ID and public IP address.
- **`backend.tf`**: Configures the remote backend for storing Terraform state in an S3 bucket.
- **`.gitignore`**: Lists files and directories to be ignored by Git, including `terraform.tfvars` and other sensitive files.
- **`README.md`**: Provides documentation for the Terraform project.

## Usage

Follow these steps to deploy the EC2 instance:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/narendrasin19/terraform-aws-ec2.git
   cd terraform-aws-ec2
