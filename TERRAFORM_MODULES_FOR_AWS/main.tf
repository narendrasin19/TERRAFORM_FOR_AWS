module "ec2_cluster" {
    source = "github.com/terraform-aws-modules/terraform-aws-ec2-instance.git"
    # https://github.com/terraform-aws-modules/terraform-aws-ec2-instance.git

    name    = "my-cluster"
    ami     = "ami-05803413c51f242b7"
    instance_type          = "t2.micro"
    subnet_id   = "subnet-0970c96c1bee1b287"

    tags = {
    Terraform   = "true"
    Environment = "dev"
    }
}
