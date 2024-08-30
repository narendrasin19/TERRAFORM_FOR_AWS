# Security Group for levelupvpc to allow SSH access
resource "aws_security_group" "allow-levelup-ssh" {
  
  # Associates the security group with the specified VPC
  vpc_id      = aws_vpc.levelupvpc.id
  
  # Name and description of the security group
  name        = "allow-levelup-ssh"
  description = "security group that allows SSH connections"

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0             # Starting port (0 allows all ports)
    to_port     = 0             # Ending port (0 allows all ports)
    protocol    = "-1"          # Protocol '-1' means all protocols are allowed
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic to any IP address
  }

  # Ingress rule allowing SSH (port 22) from any IP address
  ingress {
    from_port   = 22            # SSH port
    to_port     = 22            # SSH port
    protocol    = "tcp"         # TCP protocol
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH access from any IP address
  }

  # Tags for identifying the security group
  tags = {
    Name = "allow-levelup-ssh"
  }
}

# Security Group for MariaDB allowing inbound access from the levelup SSH group
resource "aws_security_group" "allow-mariadb" {
  
  # Associates the security group with the specified VPC
  vpc_id      = aws_vpc.levelupvpc.id
  
  # Name and description of the security group
  name        = "allow-mariadb"
  description = "security group for MariaDB"

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0             # Starting port (0 allows all ports)
    to_port     = 0             # Ending port (0 allows all ports)
    protocol    = "-1"          # Protocol '-1' means all protocols are allowed
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic to any IP address
  }

  # Ingress rule allowing MariaDB access (port 3306) from the allow-levelup-ssh security group
  ingress {
    from_port        = 3306                            # MariaDB port
    to_port          = 3306                            # MariaDB port
    protocol         = "tcp"                           # TCP protocol
    security_groups  = [aws_security_group.allow-levelup-ssh.id] # Allows access from SSH security group
  }

  # Tags for identifying the security group
  tags = {
    Name = "allow-mariadb"
  }
}

