# This script provides a basic EC2 instance setup, including optional parameters like a key pair, security group, subnet, and availability zone. 
# Modify these parameters based on your specific AWS environment and requirements.

# main.tf
resource "aws_instance" "example" {
  ami           = "ami-05803413c51f242b7" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  # Adding a basic tag
  tags = {
    Name = "MyFirstInstance" #Instance Name
  }

  # Adding a key pair (replace with your own key pair name if needed)
  key_name = "your-key-pair-name"

  # Adding a security group (optional, defaults will be applied if not specified)
  vpc_security_group_ids = ["sg-0123456789abcdef0"]
  
  # Adding a subnet ID (optional, defaults will be applied if not specified)
  subnet_id = "subnet-0123456789abcdef0"

  # Adding an availability zone (optional, defaults will be applied if not specified)
  availability_zone = "us-east-2a"

  # Adding a root volume size (optional, defaults will be applied if not specified)
  root_block_device {
    volume_size = 8 # Size in GB
  }
}


## Notes:

## AMI ID: The ami parameter should be replaced with a valid AMI ID for the desired region and operating system.
## Key Pair: Replace "your-key-pair-name" with your actual EC2 key pair name.
## Security Group ID: Replace "sg-0123456789abcdef0" with your actual security group ID.
## Subnet ID: Replace "subnet-0123456789abcdef0" with your actual subnet ID.
## Availability Zone: Replace "us-east-2a" with the availability zone of your choice.
## Root Block Device: Adjust the volume_size if you need a different size for the root volume.