# root@ubuntu-terraform:~/TERRAFORM_FOR_AWS/Terraform_Basics# cat output.tf
# output.tf

# Output for the public IP of the AWS instance
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = aws_instance.example.public_ip
}

# Output for the private IP of the AWS instance
output "instance_private_ip" {
  description = "The private IP address of the EC2 instance."
  value       = aws_instance.example.private_ip
}

# Output for the public DNS of the AWS instance
output "instance_public_dns" {
  description = "The public DNS name of the EC2 instance."
  value       = aws_instance.example.public_dns
}

# Output for the ID of the AWS instance
output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.example.id
}

# Output for the availability zone of the AWS instance
output "instance_availability_zone" {
  description = "The availability zone of the EC2 instance."
  value       = aws_instance.example.availability_zone
}

# Output for the AMI used by the AWS instance
output "instance_ami" {
  description = "The AMI ID used by the EC2 instance."
  value       = aws_instance.example.ami
}

# Output for the instance type of the AWS instance
output "instance_type" {
  description = "The instance type of the EC2 instance."
  value       = aws_instance.example.instance_type
}

# Output for the tags assigned to the AWS instance
output "instance_tags" {
  description = "The tags assigned to the EC2 instance."
  value       = aws_instance.example.tags
}
