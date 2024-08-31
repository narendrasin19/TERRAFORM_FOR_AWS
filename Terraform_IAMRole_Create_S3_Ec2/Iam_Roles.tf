# Iam_Roles.tf 
# 1. Define an IAM role for accessing S3
resource "aws_iam_role" "s3_levelupbucket_role" {
  name               = "s3-levelupbucket-role"
  
  # 1.1. Assume role policy that allows EC2 instances to assume this role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Sid": ""
    }
  ]
}
EOF
}

# 2. Define a policy to attach to the IAM role for S3 access
resource "aws_iam_role_policy" "s3_levelupmybucket_role_policy" {
  name   = "s3-levelupmybucket-role-policy"
  role   = aws_iam_role.s3_levelupbucket_role.id

  # 2.1. Policy granting full access to a specific S3 bucket and its objects
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::levelup-bucket-141",     # ARN of the S3 bucket
        "arn:aws:s3:::levelup-bucket-141/*"    # ARN of objects within the bucket
      ]
    }
  ]
}
EOF
}

# 3. Define an instance profile to use the IAM role
resource "aws_iam_instance_profile" "s3_levelupbucket_role_instanceprofile" {
  name = "s3-levelupbucket-role"
  role = aws_iam_role.s3_levelupbucket_role.name  # Reference to the IAM role
}
