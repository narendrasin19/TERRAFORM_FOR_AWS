# 1. AWS Access Key Variable Declaration
variable "AWS_ACCESS_KEY" {
    type    = string
    default = "AKIASMSIZOF42P2VUDSZ"
}

# 2. AWS Secret Key Variable Declaration
variable "AWS_SECRET_KEY" {}

# 3. AWS Region Variable Declaration
variable "AWS_REGION" {
    default = "us-east-2"
}

# 4. AMI Mapping Variable Declaration
variable "AMIS" {
    type    = map
    default = {
        us-east-1 = "ami-0f40c8f97004632f9"
        us-east-2 = "ami-05692172625678b4e"
        us-west-2 = "ami-0352d5a37fb4f603f"
        us-west-1 = "ami-0f40c8f97004632f9"
    }
}

# 5. Path to Private Key Variable Declaration
variable "PATH_TO_PRIVATE_KEY" {
    default = "levelup_key"
}

# 6. Path to Public Key Variable Declaration
variable "PATH_TO_PUBLIC_KEY" {
    default = "levelup_key.pub"
}

# 7. Instance Username Variable Declaration
variable "INSTANCE_USERNAME" {
    default = "ubuntu"
}
