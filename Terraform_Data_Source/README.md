# Terraform AWS EC2 Instance Setup Using Data Sources

This Terraform configuration uses AWS data sources to create an EC2 instance with the latest Ubuntu AMI and within an available AWS availability zone. Follow this guide to set up your EC2 instance efficiently using Terraform's data source features.

## Project Overview

This project includes the following:

- **Data Sources**: Fetch information about AWS availability zones and the latest Ubuntu AMI.
- **Resources**: Deploy an EC2 instance based on the data retrieved from the data sources.

## Files Overview

- **`main.tf`**: Contains the main Terraform configuration, including data sources and the EC2 instance resource definition.
- **`provider.tf`**: Configures the AWS provider with necessary credentials and region information.
- **`variables.tf`**: Defines input variables used across the Terraform configuration.
- **`terraform.tfvars`**: Provides values for the input variables.
- **`securitygroup.tf`**: Configures security groups for your EC2 instance.
- **`terraform.tfstate`** and **`terraform.tfstate.backup`**: Maintain the state of your infrastructure and track resources created by Terraform.

## Prerequisites

Ensure you have the following prerequisites before running the Terraform scripts:

- **Terraform**: Installed on your machine. [Download Terraform](https://www.terraform.io/downloads)
- **AWS Account**: AWS credentials with permissions to create EC2 instances and other required resources.
- **AWS CLI**: Configured on your local machine for verification purposes (optional).

## Step-by-Step Guide

### Step 1: Initialize Terraform

The first step is to initialize your Terraform working directory. This will download the required provider plugins.


# Initialize Terraform
terraform init


