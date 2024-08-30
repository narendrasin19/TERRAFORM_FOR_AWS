# Terraform Infrastructure Configuration

This repository contains Terraform configuration files for setting up a basic AWS infrastructure, including VPC, subnets, EC2 instances, RDS instances, security groups, and related network resources. Below is an overview of each component and its purpose.

## Table of Contents

1. [VPC and Subnets](#vpc-and-subnets)
2. [EC2 Instances](#ec2-instances)
3. [RDS Instances](#rds-instances)
4. [Security Groups](#security-groups)
5. [SSH Key Management](#ssh-key-management)
6. [Outputs](#outputs)
7. [Usage](#usage)

## VPC and Subnets

### VPC

- **Resource**: `aws_vpc.levelupvpc`
- **CIDR Block**: `10.0.0.0/16`
- **Features**:
  - DNS support and DNS hostnames enabled
  - Default instance tenancy

### Public Subnets

- **Resource**: `aws_subnet.levelupvpc-public-1`
- **CIDR Block**: `10.0.1.0/24`
- **Availability Zone**: `us-east-2a`
- **Resource**: `aws_subnet.levelupvpc-public-2`
- **CIDR Block**: `10.0.2.0/24`
- **Availability Zone**: `us-east-2b`
- **Resource**: `aws_subnet.levelupvpc-public-3`
- **CIDR Block**: `10.0.3.0/24`
- **Availability Zone**: `us-east-2c`

### Private Subnets

- **Resource**: `aws_subnet.levelupvpc-private-1`
- **CIDR Block**: `10.0.4.0/24`
- **Availability Zone**: `us-east-2a`
- **Resource**: `aws_subnet.levelupvpc-private-2`
- **CIDR Block**: `10.0.5.0/24`
- **Availability Zone**: `us-east-2b`
- **Resource**: `aws_subnet.levelupvpc-private-3`
- **CIDR Block**: `10.0.6.0/24`
- **Availability Zone**: `us-east-2c`

## EC2 Instances

### Instance

- **Resource**: `aws_instance.MyFirstInstance`
- **Details**:
  - Public IP address and instance ID are outputted for reference.

## RDS Instances

### MariaDB Instance

- **Resource**: `aws_db_instance.levelup-mariadb`
- **Engine**: MariaDB
- **Engine Version**: 10.4.34
- **Instance Class**: db.t3.micro
- **Allocated Storage**: 20 GB
- **Backup Retention**: 30 days
- **Multi-AZ Deployment**: Disabled
- **Parameter Group**: `aws_db_parameter_group.levelup-mariadb-parameters`
- **Subnet Group**: `aws_db_subnet_group.mariadb-subnets`

## Security Groups

### Security Group for SSH Access

- **Resource**: `aws_security_group.allow-levelup-ssh`
- **Description**: Allows inbound SSH (port 22) from any IP address.

### Security Group for MariaDB

- **Resource**: `aws_security_group.allow-mariadb`
- **Description**: Allows inbound MariaDB traffic (port 3306) from instances within the SSH security group.

## SSH Key Management

### Generate SSH Key

- **Resource**: `null_resource.generate_ssh_key`
- **Description**: Uses a local-exec provisioner to generate a new SSH key pair if one does not already exist.

### Public Key Data Source

- **Resource**: `data.local_file.public_key`
- **Description**: Reads the public key from the generated SSH key pair for use in other resources.

## Outputs

### RDS Instance Outputs

- **`db_instance_endpoint`**: Endpoint of the RDS instance.
- **`db_instance_arn`**: ARN of the RDS instance.
- **`db_subnet_group_name`**: Name of the DB subnet group.

### EC2 Instance Outputs

- **`ec2_instance_public_ip`**: Public IP address of the EC2 instance.
- **`ec2_instance_id`**: ID of the created EC2 instance.

### Key Pair Output

- **`key_pair_name`**: Name of the SSH key pair.

### Network Resources Outputs

- **`internet_gateway_id`**: ID of the Internet Gateway.
- **`security_group_id`**: ID of the security group that allows SSH.
- **`route_table_id`**: ID of the route table for the public subnets.

## Usage

1. **Initialize Terraform**: Run `terraform init` to initialize the working directory.
2. **Plan the Configuration**: Run `terraform plan` to preview the changes that will be made.
3. **Apply the Configuration**: Run `terraform apply` to apply the configuration and create the resources.
4. **Destroy the Configuration**: Run `terraform destroy` to delete all the resources created by this configuration.

Make sure to replace placeholder values with actual values specific to your environment before applying the configuration.

# ===================================================================================================================================================
# steps for accessing the EC2 instance and RDS MariaDB:

# Terraform Deployment and Access Instructions

## Overview
This README provides instructions for deploying AWS resources using Terraform and accessing the deployed EC2 instance and RDS MariaDB instance.

## 1. Terraform Deployment

### 1.1 Initialize Terraform
To start with Terraform, initialize the working directory containing the Terraform configuration files:
# terraform init

1.2 Apply Terraform Configuration
Apply the configuration to create the resources defined in the .tf files:
# terraform apply
Review the planned changes and confirm to apply them.

2. Access EC2 Instance from Your Laptop

2.1 Obtain the Public IP of the EC2 Instance
Retrieve the public IP of your EC2 instance using Terraform:
# terraform output ec2_instance_public_ip

2.2 Connect Using SSH
Open a terminal window on your laptop and connect to the EC2 instance using the SSH command. Replace your_key.pem with the path to your private key and ec2_public_ip with the public IP obtained:

# ssh -i "your_key.pem" ubuntu@ec2_public_ip
Ensure your private key file has the correct permissions:
# chmod 400 your_key.pem

3. Access MariaDB from the EC2 Instance
3.1 Install MariaDB Client on EC2 Instance
Connect to your EC2 instance using SSH (as described above).

Update the package list:
# sudo apt-get update
Install the MariaDB client:
# sudo apt-get install mariadb-client

3.2 Connect to MariaDB Instance
Retrieve the RDS endpoint using Terraform:
# terraform output db_instance_endpoint
Connect to the RDS MariaDB instance using the MariaDB client. Replace mariadb_endpoint, root, and mariadb141 with the RDS endpoint, username, and password respectively:
# mysql -h mariadb_endpoint -u root -p
Enter the password (mariadb141) when prompted.

4. Access RDS MariaDB from Your Laptop
4.1 Ensure Security Group Allows Access
Update the security group associated with the RDS instance to allow inbound traffic on port 3306 from your laptop’s IP address.

4.2 Obtain RDS Endpoint and Port
Retrieve the RDS endpoint using Terraform:
# terraform output db_instance_endpoint

4.3 Connect Using MariaDB Client on Your Laptop
Install the MariaDB client on your laptop if not already installed.
Connect to the RDS MariaDB instance using the MariaDB client. Replace mariadb_endpoint, root, and mariadb141 with the RDS endpoint, username, and password respectively:

# mysql -h mariadb_endpoint -P 3306 -u root -p
Enter the password (mariadb141) when prompted.

Terraform Outputs
1. RDS Instance Outputs
db_instance_endpoint: The endpoint of the RDS instance.
db_instance_arn: The ARN of the RDS instance.
db_subnet_group_name: The name of the DB subnet group.

2. EC2 Instance Outputs
ec2_instance_public_ip: Public IP of the EC2 instance.
ec2_instance_id: ID of the created EC2 instance.

3. Key Pair Output
key_pair_name: Name of the key pair.

4. Network Resources Outputs
internet_gateway_id: ID of the Internet Gateway.
security_group_id: ID of the security group that allows SSH.
route_table_id: ID of the route table for the public subnets.

Summary
From Your Laptop:

Retrieve the EC2 instance's public IP.
Connect to the EC2 instance using SSH with your private key.
From EC2 Instance:

Install MariaDB client.
Connect to the RDS MariaDB instance using the MariaDB client.
Directly From Your Laptop:

Ensure RDS security group allows your IP address.
Connect to the RDS MariaDB instance using the MariaDB client.
Follow these steps to securely access and manage your EC2 instance and MariaDB database.

sql

This `README.md` file now contains comprehensive instructions for deploying AWS resources
