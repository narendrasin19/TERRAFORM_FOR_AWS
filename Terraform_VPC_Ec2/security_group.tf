# Define the AWS Security Group resource
resource "aws_security_group" "allow-levelup-ssh" {

  # VPC to which the security group belongs
  vpc_id      = aws_vpc.levelupvpc.id
  
  # Security group name and description
  name        = "allow-levelup-ssh"
  description = "Security group that allows SSH connection"

  # Outbound rules (egress)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound rules (ingress) for SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for the security group
  tags = {
    Name = "allow-levelup-ssh"
  }
}
