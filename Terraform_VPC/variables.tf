# AWS Access Key
variable "AWS_ACCESS_KEY" {
    type    = string
    default = "AKIASMSIZOF42P2VUDSZ"
}

# AWS Secret Key
variable "AWS_SECRET_KEY" {}

# AWS Region
variable "AWS_REGION" {
    default = "us-east-2"
}

# Security Groups
variable "Security_Group" {
    type    = list
    default = ["sg-24076", "sg-90890", "sg-456789"]
}

# AMIs by Region
variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}

# Path to Private Key
variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
}

# Path to Public Key
variable "PATH_TO_PUBLIC_KEY" {
    default = "levelup_key.pub"
}

# Instance Username
variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}
