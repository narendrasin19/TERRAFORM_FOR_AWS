# This file contains the core Terraform configuration for your infrastructure. 
# It defines the resources you want to create, such as EC2 instances, S3 buckets, VPCs, etc.
# The main configuration file where you need to define your AWS resources in main.tf file.
# main.tf

# This file contains the resource definition for creating your EC2 instance.
resource "aws_instance" "MyFirstInstance" {
  count         = 1
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}


