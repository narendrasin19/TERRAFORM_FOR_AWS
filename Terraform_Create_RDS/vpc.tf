# 1. Create AWS VPC
resource "aws_vpc" "levelupvpc" {
  cidr_block             = "10.0.0.0/16"        # The IP range for the VPC
  instance_tenancy       = "default"            # Allows shared hardware tenancy
  enable_dns_support     = true                 # Enables DNS resolution within the VPC
  enable_dns_hostnames   = true                 # Enables DNS hostnames for instances

  tags = {
    Name = "levelupvpc"                        # Tag for easy identification
  }
}

# 2. Public Subnet in Custom VPC - Subnet 1
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.1.0/24"       # Subnet IP range
  map_public_ip_on_launch = true                # Automatically assign public IPs
  availability_zone       = "us-east-2a"        # Availability zone

  tags = {
    Name = "levelupvpc-public-1"
  }
}

# 3. Public Subnet in Custom VPC - Subnet 2
resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.2.0/24"       # Subnet IP range
  map_public_ip_on_launch = true                # Automatically assign public IPs
  availability_zone       = "us-east-2b"        # Availability zone

  tags = {
    Name = "levelupvpc-public-2"
  }
}

# 4. Public Subnet in Custom VPC - Subnet 3
resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.3.0/24"       # Subnet IP range
  map_public_ip_on_launch = true                # Automatically assign public IPs
  availability_zone       = "us-east-2c"        # Availability zone

  tags = {
    Name = "levelupvpc-public-3"
  }
}

# 5. Private Subnet in Custom VPC - Subnet 1
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.4.0/24"       # Subnet IP range
  map_public_ip_on_launch = false               # No public IPs assigned
  availability_zone       = "us-east-2a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}

# 6. Private Subnet in Custom VPC - Subnet 2
resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.5.0/24"       # Subnet IP range
  map_public_ip_on_launch = false               # No public IPs assigned
  availability_zone       = "us-east-2b"

  tags = {
    Name = "levelupvpc-private-2"
  }
}

# 7. Private Subnet in Custom VPC - Subnet 3
resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.6.0/24"       # Subnet IP range
  map_public_ip_on_launch = false               # No public IPs assigned
  availability_zone       = "us-east-2c"

  tags = {
    Name = "levelupvpc-private-3"
  }
}

# 8. Custom Internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelupvpc.id               # Attaches to the VPC

  tags = {
    Name = "levelup-gw"
  }
}

# 9. Routing Table for the Custom VPC
resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.levelupvpc.id
  route {
    cidr_block = "0.0.0.0/0"                   # Default route for all outbound traffic
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

  tags = {
    Name = "levelup-public-1"
  }
}

# 10. Route Table Association - Public Subnet 1
resource "aws_route_table_association" "levelup-public-1-a" {
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelup-public.id
}

# 11. Route Table Association - Public Subnet 2
resource "aws_route_table_association" "levelup-public-2-a" {
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelup-public.id
}

# 12. Route Table Association - Public Subnet 3
resource "aws_route_table_association" "levelup-public-3-a" {
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelup-public.id
}

# 13. RDS Subnet Group
resource "aws_db_subnet_group" "mariadb-subnets" {
  name        = "mariadb-subnets"
  description = "Amazon RDS subnet group"
  subnet_ids  = [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id]

  tags = {
    Name = "mariadb-subnets"
  }
}

# 14. RDS Parameter Group
resource "aws_db_parameter_group" "levelup-mariadb-parameters" {
  name        = "levelup-mariadb-parameters"
  family      = "mariadb10.4"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

# 15. RDS Instance
resource "aws_db_instance" "levelup-mariadb" {
  allocated_storage       = 20                          # 20 GB of storage
  engine                  = "mariadb"
  engine_version          = "10.4.34"                   # Update this version if needed
  instance_class          = "db.t3.micro"               # Change to a compatible instance class
  identifier              = "mariadb-instance"
  username                = "root"                      # Username
  password                = "mariadb141"                # Password
  db_subnet_group_name    = aws_db_subnet_group.mariadb-subnets.name
  parameter_group_name    = aws_db_parameter_group.levelup-mariadb-parameters.name
  multi_az                = false                       # Set to true for high availability
  vpc_security_group_ids  = [aws_security_group.allow-mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30                          # Backup retention period
  availability_zone       = aws_subnet.levelupvpc-private-1.availability_zone # Preferred AZ
  skip_final_snapshot     = true                        # Skip final snapshot on destroy

  tags = {
    Name = "levelup-mariadb"
  }
}
