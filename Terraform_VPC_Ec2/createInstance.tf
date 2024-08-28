# Define the AWS EC2 instance resource
resource "aws_instance" "MyFirstInstance" {
  
  # AMI (Amazon Machine Image) specification
  ami                  = lookup(var.AMIS, var.AWS_REGION)
  
  # Instance type configuration
  instance_type        = "t2.micro"
  
  # Key pair for SSH access
  key_name             = aws_key_pair.levelup_key.key_name
  
  # Security group assignment
  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  
  # Subnet assignment
  subnet_id            = aws_subnet.levelupvpc-public-2.id

  # Tags for the instance
  tags = {
    Name = "custom_instance"
  }
}


