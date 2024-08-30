# Create an AWS EC2 instance with specified configuration
resource "aws_instance" "MyFirstInstance" {
  
  # Select the AMI based on the AWS region from the variable map 'AMIS'
  ami = lookup(var.AMIS, var.AWS_REGION)
  
  # Define the instance type as 't2.micro'
  instance_type = "t2.micro"
  
  # Specify the availability zone where the instance will be created
  availability_zone = "us-east-2a"
  
  # Use the key pair 'levelup_key' for SSH access
  key_name = aws_key_pair.levelup_key.key_name
  
  # Attach the security group allowing SSH access
  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  
  # Place the instance in the specified public subnet
  subnet_id = aws_subnet.levelupvpc-public-1.id
  
  # Tag the instance with a custom name
  tags = {
    Name = "custom_instance"
  }
}
