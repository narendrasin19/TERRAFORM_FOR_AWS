# This file provides documentation for your Terraform project. It’s a good practice to include a README file that explains the purpose of the project, how to use the Terraform configurations, and any prerequisites.

# Terraform AWS EC2 Instance

This Terraform project sets up an AWS EC2 instance with the following configuration:

- AMI: `ami-05803413c51f242b7`
- Instance Type: `t2.micro`
- AWS Region: `us-east-2`

## Prerequisites

- Terraform installed
- AWS account with appropriate IAM permissions
- S3 bucket and DynamoDB table for state management (if using remote backend)

## Files and Directories

- `main.tf`: Defines the EC2 instance resource.
- `provider.tf`: Configures the AWS provider.
- `variables.tf`: Declares variables used in the Terraform configuration.
- `terraform.tfvars`: Contains sensitive variable values (not tracked in version control).
- `outputs.tf`: Specifies outputs for the EC2 instance ID and public IP.
- `backend.tf`: Configures the remote backend for state storage.
- `.gitignore`: Lists files and directories to be ignored by Git.
- `README.md`: Documentation for the project.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/narendrasin19/terraform-aws-ec2.git
   cd terraform-aws-ec2
