# Iam_Role.tf
# 1. Define an IAM Role for EC2 Access to S3
resource "aws_iam_role" "s3_levelupbucket_role" {
  name               = "s3-levelupbucket-role"                # 1.1. IAM Role name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })  # 1.2. Assume role policy document
}

# 2. Define a Policy for the IAM Role
resource "aws_iam_role_policy" "s3_levelupbucket_role_policy" {
  name   = "s3-levelupbucket-role-policy"                  # 2.1. Policy name
  role   = aws_iam_role.s3_levelupbucket_role.id            # 2.2. Attach policy to IAM Role
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:*"],
        Resource = [
          "arn:aws:s3:::levelup-bucket-141",               # 2.3. ARN of the S3 bucket
          "arn:aws:s3:::levelup-bucket-141/*"              # 2.4. ARN of objects within the bucket
        ]
      }
    ]
  })                                                       # 2.5. Policy document
}

# 3. Define an Instance Profile for the IAM Role
resource "aws_iam_instance_profile" "s3_levelupbucket_role_instanceprofile" {
  name = "s3-levelupbucket-role-instanceprofile"             # 3.1. Instance profile name
  role = aws_iam_role.s3_levelupbucket_role.name             # 3.2. Attach IAM Role to Instance Profile
}

