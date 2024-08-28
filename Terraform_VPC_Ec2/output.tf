# 1. Output for Public Key Content
output "public_key_content" {
  description = "Content of the public key"
  value       = data.local_file.public_key.content
}

# 2. Output for NAT Gateway Public IP
output "nat_gateway_public_ip" {
  description = "Public IP of the NAT Gateway"
  value       = aws_nat_gateway.levelup-nat-gw.public_ip
}

# 3. Output for EC2 Instance ID
output "ec2_instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.MyFirstInstance.id
}

# 4. Output for EC2 Instance Public IP
output "ec2_instance_public_ip" {
  description = "Public IP address of the created EC2 instance"
  value       = aws_instance.MyFirstInstance.public_ip
}

# 5. Output for EC2 Instance AMI
output "ec2_instance_ami" {
  description = "AMI of the created EC2 instance"
  value       = aws_instance.MyFirstInstance.ami
}

# 6. Output for EC2 Instance Type
output "ec2_instance_type" {
  description = "Type of the created EC2 instance"
  value       = aws_instance.MyFirstInstance.instance_type
}

# 7. Output for EC2 Instance Key Name
output "ec2_instance_key_name" {
  description = "Key name used for the EC2 instance"
  value       = aws_instance.MyFirstInstance.key_name
}

# 8. Output for Internet Gateway ID
output "internet_gateway_id" {
  value       = aws_internet_gateway.levelup-gw.id
  description = "The ID of the Internet Gateway"
}

# 9. Output for Elastic IP ID
output "eip_id" {
  description = "Allocation ID of the Elastic IP"
  value       = aws_eip.levelup-nat.allocation_id
}

# 10. Output for Elastic IP Public IP
output "eip_public_ip" {
  description = "Public IP of the Elastic IP"
  value       = aws_eip.levelup-nat.public_ip
}

# 11. Output for Private Route Table ID
output "private_route_table_id" {
  description = "ID of the Private Route Table"
  value       = aws_route_table.levelup-private.id
}

# 12. Output for Public Route Table ID
output "public_route_table_id" {
  description = "ID of the Public Route Table"
  value       = aws_route_table.levelup-public.id
}

# 13. Output for NAT Gateway ID
output "nat_gateway_id" {
  value       = aws_nat_gateway.levelup-nat-gw.id
  description = "The ID of the NAT Gateway"
}

# 14. Output for Security Group ID
output "security_group_id" {
  description = "ID of the Security Group allowing SSH"
  value       = aws_security_group.allow-levelup-ssh.id
}

# 15. Output for Subnet IDs
output "subnet_private_1_id" {
  description = "ID of the first private subnet"
  value       = aws_subnet.levelupvpc-private-1.id
}

output "subnet_public_1_id" {
  description = "ID of the first public subnet"
  value       = aws_subnet.levelupvpc-public-1.id
}

# 16. Output for Key Pair Fingerprint
output "key_pair_fingerprint" {
  description = "Fingerprint of the Key Pair"
  value       = aws_key_pair.levelup_key.fingerprint
}

# 17. Output for VPC ID
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.levelupvpc.id
}

# 18. Output for Route Table Associations
output "route_table_association_private_1" {
  description = "ID of the private route table association for subnet 1"
  value       = aws_route_table_association.level-private-1-a.id
}

output "route_table_association_private_2" {
  description = "ID of the private route table association for subnet 2"
  value       = aws_route_table_association.level-private-1-b.id
}

output "route_table_association_public_1" {
  description = "ID of the public route table association for subnet 1"
  value       = aws_route_table_association.levelup-public-1-a.id
}

output "route_table_association_public_2" {
  description = "ID of the public route table association for subnet 2"
  value       = aws_route_table_association.levelup-public-2-a.id
}

# 19. Output for Public Subnets
output "public_subnet_ids" {
  value = [
    aws_subnet.levelupvpc-public-1.id,
    aws_subnet.levelupvpc-public-2.id,
    aws_subnet.levelupvpc-public-3.id,
  ]
  description = "The IDs of the public subnets"
}

# 20. Output for Private Subnets
output "private_subnet_ids" {
  value = [
    aws_subnet.levelupvpc-private-1.id,
    aws_subnet.levelupvpc-private-2.id,
    aws_subnet.levelupvpc-private-3.id,
  ]
  description = "The IDs of the private subnets"
}

# 21. Output for EIP Allocation ID
output "eip_allocation_id" {
  value       = aws_eip.levelup-nat.id
  description = "The Allocation ID of the Elastic IP"
}

# 22. Output for Key Pair
output "key_pair_name" {
  value       = aws_key_pair.levelup_key.key_name
  description = "Name of the Key Pair"
}

