# Terraform Basics: AWS IAM Users, Groups, and Roles

This guide provides step-by-step instructions to create AWS IAM users, groups, and roles using Terraform. Follow this document to set up your IAM infrastructure, including user groups, users, role policies, and policy attachments.

## Files Overview
- `main.tf`: Contains the main Terraform configuration for creating IAM users, groups, roles, and policy attachments.
- `provider.tf`: Configures the AWS provider with necessary credentials and region.
- `variables.tf`: Defines the input variables for the Terraform configuration.
- `terraform.tfvars`: Provides values for the input variables.
- `output.tf`: Specifies output values to display after deployment.
- `terraform.tfstate` and `terraform.tfstate.backup`: Track the state of your infrastructure.

## Step-by-Step Guide

### Step 1: Initialize Terraform
The first step is to initialize your working directory. This sets up the necessary Terraform environment and downloads the required provider plugins.

# Initialize Terraform
terraform init

