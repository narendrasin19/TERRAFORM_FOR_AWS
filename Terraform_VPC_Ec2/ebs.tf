# EBS Volume Creation and Attachment

## Create an EBS Volume in the Same Availability Zone as the EC2 Instance
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "us-east-2b"  # Ensure this matches with the EC2 instance AZ
  size              = 50
  type              = "gp2"

  tags = {
    Name = "Secondary Volume Disk"
  }
}

## Attach the EBS Volume to the Specified EC2 Instance
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.MyFirstInstance.id
}
