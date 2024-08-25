# Terraform EC2 Instance Setup

- This repository contains Terraform configuration files to provision an Amazon EC2 instance   using AWS.

## Prerequisites

- Terraform installed (version 1.0 or higher)
- AWS CLI configured with appropriate permissions
- AWS key pair, security group, and subnet IDs

## File Overview

- `provider.tf`: Configures the AWS provider with the region.
- `main.tf`: Defines the EC2 instance resource and its configuration.

## Configuration

### `provider.tf`

Specifies the AWS region for Terraform operations.

- hcl
- provider "aws" {
-   region = "us-east-2"
- }

## Usage
- Initialize Terraform: Run terraform init to initialize the configuration.
- Plan: Run terraform plan to see the changes that will be made.
- Apply: Run terraform apply to create the EC2 instance.

## Cleanup
- To destroy the resources created by Terraform, run:
- terraform destroy
