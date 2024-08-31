root@ubuntu-terraform:~/TERRAFORM_FOR_AWS/Terraform_Basics# cat CreateEc2.tf
# ============================================================================
#                          TERRAFORM AWS EC2 INSTANCE
# ============================================================================
# This Terraform script provisions a basic EC2 instance on AWS with optional
# parameters such as key pair, security group, subnet, and availability zone.
# Adjust these parameters to suit your AWS environment and requirements.
# ============================================================================

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

# ============================================================================
#                               NOTES
# ============================================================================
# AMI ID: Replace the ami parameter with a valid AMI ID for your desired region
#         and operating system.
# Key Pair: Uncomment and replace "your-key-pair-name" with your actual EC2 key pair name.
# Security Group ID: Replace "sg-027ac67a0bb93c534" with your actual security group ID.
# Subnet ID: Replace "subnet-03f665de6ce29e442" with your actual subnet ID.
# Availability Zone: Replace "us-east-2a" with your preferred availability zone.
# Root Block Device: Adjust the volume_size if you need a different size for the root volume.
# ============================================================================
