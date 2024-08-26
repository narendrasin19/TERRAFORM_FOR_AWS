
# Data Source: AWS Availability Zones
data "aws_availability_zones" "avilable" {}

# Data Source: Latest Ubuntu AMI
data "aws_ami" "latest-ubuntu" {
  most_recent = true
  # AMI Owner (Canonical)
  owners = ["099720109477"]

# Filter: Ubuntu Xenial 16.04 AMI
  filter {
    name = "name"
    values = "ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"
  }
 # Filter: HVM Virtualization Type
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Resource: AWS EC2 Instance
resource "aws_instance" "MyFirstInstnace" {
  # AMI ID (From Data Source)
  ami           = data.aws_ami.latest-ubuntu.id
  # Instance Type
  instance_type = "t2.micro"
  
  # Availability Zone (From Data Source)
  availability_zone = data.aws_availability_zones.avilable.names[1]
  # Tags for Instance
  tags = {
    Name = "custom_instance"
  }

}