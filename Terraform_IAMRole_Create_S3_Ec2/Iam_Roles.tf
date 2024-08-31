# 4. Define an IAM Role for S3 Access
resource "aws_iam_role" "s3_levelupbucket_role" {
  name               = "s3-levelupbucket-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# 5. Define a Policy to Attach to the IAM Role for S3 Access
resource "aws_iam_role_policy" "s3_levelupbucket_role_policy" {
  name   = "s3-levelupbucket-role-policy"
  role   = aws_iam_role.s3_levelupbucket_role.id
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
        "arn:aws:s3:::levelup-bucket-141",
        "arn:aws:s3:::levelup-bucket-141/*"
      ]
    }
  ]
}
EOF
}

# 6. Define an Instance Profile to Use the IAM Role
resource "aws_iam_instance_profile" "s3_levelupbucket_role_instanceprofile" {
  name = "s3-levelupbucket-role"
  role = aws_iam_role.s3_levelupbucket_role.name
}
