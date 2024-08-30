# Heading: Terraform Outputs

## 1. RDS Instance Outputs

# Output the endpoint of the RDS instance
output "db_instance_endpoint" {
  description = "1.1 The endpoint of the RDS instance"
  value       = aws_db_instance.levelup-mariadb.endpoint
}

# Output the ARN of the RDS instance
output "db_instance_arn" {
  description = "1.2 The ARN of the RDS instance"
  value       = aws_db_instance.levelup-mariadb.arn
}

# Output the name of the DB subnet group
output "db_subnet_group_name" {
  description = "1.3 The name of the DB subnet group"
  value       = aws_db_subnet_group.mariadb-subnets.name
}

## 2. EC2 Instance Outputs

# Output the public IP of the EC2 instance
output "ec2_instance_public_ip" {
  description = "2.1 Public IP of the EC2 instance"
  value       = aws_instance.MyFirstInstance.public_ip
}

# Output the ID of the created EC2 instance
output "ec2_instance_id" {
  description = "2.2 ID of the created EC2 instance"
  value       = aws_instance.MyFirstInstance.id
}

## 3. Key Pair Output

# Output the name of the key pair
output "key_pair_name" {
  description = "3.1 Name of the key pair"
  value       = aws_key_pair.levelup_key.key_name
}

## 4. Network Resources Outputs

# Output the ID of the Internet Gateway
output "internet_gateway_id" {
  description = "4.1 ID of the Internet Gateway"
  value       = aws_internet_gateway.levelup-gw.id
}

# Output the ID of the security group that allows SSH
output "security_group_id" {
  description = "4.2 ID of the security group that allows SSH"
  value       = aws_security_group.allow-levelup-ssh.id
}

# Output the ID of the route table for the public subnets
output "route_table_id" {
  description = "4.3 ID of the route table for the public subnets"
  value       = aws_route_table.levelup-public.id
}
