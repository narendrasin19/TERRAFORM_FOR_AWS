# Terraform AWS EC2 Instance Configuration

This Terraform configuration sets up an AWS EC2 instance using the latest Ubuntu 24.04 LTS AMI. It also demonstrates how to use data sources, provisioners, and outputs in Terraform.

## Configuration Overview

### Data Sources

1. **AWS Availability Zones**
   - Fetches the available AWS availability zones to use for provisioning the EC2 instance.

2. **Latest Ubuntu AMI**
   - Retrieves the most recent Ubuntu 24.04 LTS AMI from Canonical for use in the EC2 instance.

### Resource

- **AWS EC2 Instance**
  - Creates an EC2 instance with the following specifications:
    - **AMI ID**: Latest Ubuntu 24.04 LTS AMI.
    - **Instance Type**: `t2.micro`.
    - **Availability Zone**: Selected from the available zones.
    - **Tags**: Assigns a name tag to the instance.

### Provisioner

- **Local Execution Provisioner**
  - Executes a local command to append the private IP address of the EC2 instance to a file `my_private_ips.txt`.

### Output

- **Public IP**
  - Outputs the public IP address of the created EC2 instance.

## Prerequisites

- **AWS Account**: You need an active AWS account.
- **Terraform**: Ensure Terraform is installed on your local machine.
- **AWS CLI**: AWS CLI should be configured with your credentials.

## Usage

1. **Initialize Terraform**
   ```bash
   terraform init
