# 1. Define External IP for NAT Gateway
resource "aws_eip" "levelup-nat" {
  domain = "vpc"  # Updated from vpc = true
}

# 2. Define NAT Gateway
resource "aws_nat_gateway" "levelup-nat-gw" {
  allocation_id = aws_eip.levelup-nat.id
  subnet_id     = aws_subnet.levelupvpc-public-1.id
  depends_on    = [aws_internet_gateway.levelup-gw]
}

# 3. Route Table for Private Subnets
resource "aws_route_table" "levelup-private" {
  vpc_id = aws_vpc.levelupvpc.id
  
  # Route configuration to use NAT Gateway
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.levelup-nat-gw.id
  }

  # Tags for the route table
  tags = {
    Name = "levelup-private"
  }
}

# 4. Route Table Association for Private Subnet 1
resource "aws_route_table_association" "level-private-1-a" {
  subnet_id      = aws_subnet.levelupvpc-private-1.id
  route_table_id = aws_route_table.levelup-private.id
}

# 5. Route Table Association for Private Subnet 2
resource "aws_route_table_association" "level-private-1-b" {
  subnet_id      = aws_subnet.levelupvpc-private-2.id
  route_table_id = aws_route_table.levelup-private.id
}

# 6. Route Table Association for Private Subnet 3
resource "aws_route_table_association" "level-private-1-c" {
  subnet_id      = aws_subnet.levelupvpc-private-3.id
  route_table_id = aws_route_table.levelup-private.id
}
