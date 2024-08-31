# vpc.tf
# 1. Create AWS VPC
resource "aws_vpc" "levelupvpc" {
  cidr_block             = "10.0.0.0/16"
  instance_tenancy       = "default"
  enable_dns_support     = true
  enable_dns_hostnames   = true
  # enable_classiclink   = false

  tags = {
    Name = "levelupvpc"
  }
}

# 2. Create Public Subnets in Custom VPC

## Public Subnet 1
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2a"

  tags = {
    Name = "levelupvpc-public-1"
  }
}

## Public Subnet 2
resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2b"

  tags = {
    Name = "levelupvpc-public-2"
  }
}

## Public Subnet 3
resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-2c"

  tags = {
    Name = "levelupvpc-public-3"
  }
}

# 3. Create Private Subnets in Custom VPC

## Private Subnet 1
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-2a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}

## Private Subnet 2
resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-2b"

  tags = {
    Name = "levelupvpc-private-2"
  }
}

## Private Subnet 3
resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id                  = aws_vpc.levelupvpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-2c"

  tags = {
    Name = "levelupvpc-private-3"
  }
}

# 4. Create Custom Internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelupvpc.id

  tags = {
    Name = "levelup-gw"
  }
}

# 5. Create Routing Table for the Custom VPC
resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.levelupvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

  tags = {
    Name = "levelup-public"
  }
}

# 6. Associate Routing Table with Public Subnets

## Route Table Association for Public Subnet 1
resource "aws_route_table_association" "levelup-public-1-a" {
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelup-public.id
}

## Route Table Association for Public Subnet 2
resource "aws_route_table_association" "levelup-public-2-a" {
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelup-public.id
}

## Route Table Association for Public Subnet 3
resource "aws_route_table_association" "levelup-public-3-a" {
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelup-public.id
}
