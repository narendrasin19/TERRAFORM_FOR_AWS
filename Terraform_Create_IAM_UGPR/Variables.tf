# Variable for AWS Access Key
variable "AWS_ACCESS_KEY" {
  description = "AWS Access Key ID for authentication."
  type        = string
  default     = "AKIASMSIZOF42P2VUDSZ"  # Default access key (should be secured)
}

# Variable for AWS Secret Key (keep this value secure, usually provided at runtime or through environment variables)
variable "AWS_SECRET_KEY" {
  description = "AWS Secret Access Key for authentication."
  type        = string
  sensitive   = true  # Sensitive data, should be secured and not exposed
}

# Variable for AWS Region to deploy resources
variable "AWS_REGION" {
  description = "AWS Region where resources will be deployed."
  type        = string
  default     = "us-east-2"  # Default AWS region
}

# Variable for IAM user group name
variable "IAM_GROUP_NAME" {
  description = "Name of the IAM user group."
  type        = string
  default     = "admin-group"  # Default IAM user group name
}

# Variable for IAM policy ARN
variable "IAM_POLICY_ARN" {
  description = "ARN of the IAM policy to attach."
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"  # Default IAM policy ARN
}

# Variable for IAM role name
variable "IAM_ROLE_NAME" {
  description = "Name of the IAM role."
  type        = string
  default     = "admin-role"  # Default IAM role name
}
