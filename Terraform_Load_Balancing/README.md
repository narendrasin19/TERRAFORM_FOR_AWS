# Terraform AWS Load Balancing Configuration

This repository contains Terraform configuration files for setting up an AWS infrastructure with Elastic Load Balancer (ELB), Auto Scaling, EC2 instances, and related resources. The setup is designed to create a robust, scalable web application environment on AWS.

## Directory Structure

The directory contains the following Terraform configuration files:

- **`Ec2_Auto_Scaling.tf`**: Configures AWS Auto Scaling groups and policies for scaling EC2 instances based on demand.
- **`elb.tf`**: Sets up an Elastic Load Balancer (ELB) along with security groups for the ELB and EC2 instances.
- **`generate_ssh_key.tf`**: Generates an SSH key pair for secure access to the EC2 instances.
- **`key_pair.tf`**: Configures the AWS key pair resource for EC2 instances.
- **`provider.tf`**: Defines the AWS provider and its configuration settings.
- **`terraform.tfvars`**: Contains variable values for Terraform configurations.
- **`vpc.tf`**: Sets up the Virtual Private Cloud (VPC) including subnets, route tables, and other networking components.
- **`Iam_Role.tf`**: Configures IAM roles and policies for accessing AWS services.
- **`output.tf`**: Defines the outputs of the Terraform configuration, such as the public SSH key.
- **`security_group.tf`**: Configures security groups for controlling inbound and outbound traffic.
- **`variables.tf`**: Defines input variables used in the Terraform configurations.

## Key Components

### `elb.tf`

- **Elastic Load Balancer (ELB)**: 
  - Creates an ELB named `levelup-elb` to distribute incoming traffic to EC2 instances.
  - Configures listeners, health checks, cross-zone load balancing, and connection draining.
  
- **Security Groups**:
  - **`levelup-elb-securitygroup`**: Allows HTTP traffic on port 80 to the ELB.
  - **`levelup-instance`**: Allows SSH access on port 22 and HTTP traffic from the ELB to the instances.

### `generate_ssh_key.tf`

- **SSH Key Generation**:
  - Generates a new SSH key pair (`levelup_key` and `levelup_key.pub`) if they do not already exist.
  - Outputs the public key content for use in other Terraform resources.

### `provider.tf`

- **AWS Provider**:
  - Configures the AWS provider with region and credentials.

### `terraform.tfvars`

- **Variable Values**:
  - Contains values for the variables defined in `variables.tf`.

### `vpc.tf`

- **Virtual Private Cloud (VPC)**:
  - Sets up the VPC along with public and private subnets.

### `Iam_Role.tf`

- **IAM Roles**:
  - Configures IAM roles and policies for EC2 instances and other AWS resources.

### `output.tf`

- **Outputs**:
  - Exposes the public SSH key content for use in other configurations.

### `security_group.tf`

- **Security Groups**:
  - Configures security groups to control access to various AWS resources.

### `variables.tf`

- **Variables**:
  - Defines input variables for the Terraform configurations.

## Getting Started

1. **Install Terraform**: Ensure you have Terraform installed on your local machine.

2. **Initialize Terraform**:
   ```bash
   terraform init

