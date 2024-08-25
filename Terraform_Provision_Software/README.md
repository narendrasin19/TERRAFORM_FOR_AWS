# Terraform AWS EC2 Instance Setup

This Terraform configuration sets up an EC2 instance on AWS and provisions it with Nginx using SSH key-based authentication.

## Prerequisites

- **AWS Account**: You need an active AWS account.
- **Terraform**: Ensure you have Terraform installed on your local machine.
- **AWS CLI**: AWS CLI should be configured with your credentials.
- **SSH Key Pair**: You need a public/private SSH key pair for connecting to the instance.

## Project Structure

```
.
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── backend.tf
├── terraform.tfvars
└── installNginx.sh
```

## main.tf Configuration
The `main.tf` file contains the main resources for this Terraform project:

### AWS Key Pair
```hcl
resource "aws_key_pair" "levelup_key" {
    key_name   = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}
```

- **key_name**: The name of the SSH key pair.
- **public_key**: The path to your public SSH key, specified as a variable.

### AWS EC2 Instance

```hcl
resource "aws_instance" "MyFirstInstance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.levelup_key.key_name

  tags = {
    Name = "custom_instance"
  }

  provisioner "file" {
      source      = "installNginx.sh"
      destination = "/tmp/installNginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh",  # Remove CR characters.
      "sudo /tmp/installNginx.sh",
    ]
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}
```

- **ami**: The AMI ID used to launch the instance, dynamically selected based on the AWS region.
- **instance_type**: The type of instance to launch (`t2.micro` in this case).
- **key_name**: The name of the SSH key pair to associate with the instance.
- **tags**: Tags applied to the instance for easy identification.
- **provisioner "file"**: Uploads the `installNginx.sh` script to the instance.
- **provisioner "remote-exec"**: Executes commands on the instance to install Nginx.
- **connection**: Configures SSH connection settings, including the use of the private key.

## Variables
- **PATH_TO_PUBLIC_KEY**: Path to the public SSH key.
- **PATH_TO_PRIVATE_KEY**: Path to the private SSH key.
- **INSTANCE_USERNAME**: The username for SSH connection.
- **AWS_REGION**: The AWS region where the instance is deployed.
- **AMIS**: A map of AMI IDs for different AWS regions.

## Usage Instructions
1. **Initialize Terraform:**
   ```sh
   terraform init
   ```

2. **Plan the deployment:**
   ```sh
   terraform plan
   ```

3. **Apply the configuration:**
   ```sh
   terraform apply
   ```

   Confirm with "yes" to create the resources.

4. **Access the EC2 Instance:**
   Use SSH to connect to the instance using the private key.

5. **Verify Nginx Installation:**
   Check if Nginx is running on the instance by accessing the public IP in a web browser.

## Cleanup

To remove all resources created by this Terraform configuration:

```sh
terraform destroy
```

## Notes
- Ensure your AWS credentials are properly configured before running the Terraform commands.
- Make sure the `installNginx.sh` script is executable and properly configured.
