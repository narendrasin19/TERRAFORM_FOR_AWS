# This file defines output values that Terraform will display after the infrastructure is created. 
# Outputs are useful for getting information about the resources created, like instance IP addresses, resource IDs, etc.

#To output the instance ID after creation in outputs.tf file .
#This file is used to output information after your resources are created.

# outputs.tf

output "instance_id" {
  value = aws_instance.MyFirstInstance[0].id
}

output "instance_public_ip" {
  value = aws_instance.MyFirstInstance[0].public_ip
}

