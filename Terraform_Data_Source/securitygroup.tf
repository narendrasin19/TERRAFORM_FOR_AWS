# Data Source: AWS IP Ranges for US East Regions
data "aws_ip_ranges" "us_east_ip_range" {
    regions = ["us-east-1","us-east-2"]
    services = ["ec2"]
}

# Resource: AWS Security Group Definition
resource "aws_security_group" "sg-custom_us_east" {
    # Security Group Name
    name = "custom_us_east"

# Ingress Rule: Allow HTTPS Traffic from Specific AWS IP Ranges
    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.us_east_ip_range.cidr_blocks, 0, 50)
    }
# Tags: Metadata Information from AWS IP Ranges Data
    tags = {
        CreateDate = data.aws_ip_ranges.us_east_ip_range.create_date
        SyncToken = data.aws_ip_ranges.us_east_ip_range.sync_token
    }
}