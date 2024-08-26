# Terraform Configuration: AWS EC2 Instance with Latest Ubuntu AMI

This Terraform configuration sets up an AWS EC2 instance using the latest available Ubuntu 16.04 AMI and deploys it in a specified availability zone.

## Prerequisites

Before using this configuration, ensure you have the following:

- An AWS account with appropriate permissions.
- Terraform installed on your local machine.
- AWS CLI configured with your credentials.

## Configuration Details

### Data Sources

1. **aws_availability_zones**
   - Retrieves a list of available AWS Availability Zones.
   - Used to specify the Availability Zone where the EC2 instance will be launched.

2. **aws_ami**
   - Fetches the latest Ubuntu 16.04 AMI (Xenial) available from Canonical.
   - Filters applied:
     - Name pattern: `ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*`
     - Virtualization type: `hvm`

### Resources

1. **aws_instance**
   - Creates an EC2 instance using the latest Ubuntu 16.04 AMI.
   - Instance type: `t2.micro` (suitable for low-traffic workloads or testing).
   - The instance is tagged with the name `custom_instance`.
   - Deployed in the second available AWS Availability Zone (based on the list retrieved).

## How to Use

1. **Initialize Terraform:**
   
   terraform init
   

2. **Preview the Plan:**
  
   terraform plan
 

3. **Apply the Configuration:**
   
   terraform apply
   
   - Confirm the action when prompted. Terraform will provision the resources in your AWS account.

4. **Destroy the Resources:**
   - To clean up and destroy the resources, use the following command:
  
   terraform destroy
   

## Customization

- **Instance Type:** Modify the `instance_type` in the `aws_instance` resource block to change the EC2 instance type.
- **Availability Zone:** The instance is currently set to launch in the second availability zone. You can modify the index `[1]` in `data.aws_availability_zones.available.names[1]` to target a different zone.

## Notes

- This configuration is set up for Ubuntu 16.04 (Xenial). You may want to update the AMI filters if you require a different version or another Linux distribution.
- Ensure that the chosen `t2.micro` instance type fits within your AWS free tier or budget if not using the free tier.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


