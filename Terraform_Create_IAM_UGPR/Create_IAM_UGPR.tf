# Define an IAM user
resource "aws_iam_user" "adminuser1" {
  name = "adminuser1"
}

# Define another IAM user
resource "aws_iam_user" "adminuser2" {
  name = "adminuser2"
}

# Define an IAM policy attachment
resource "aws_iam_policy_attachment" "admin_users_attach" {
  name       = "admin-policy-attach"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  groups     = [aws_iam_group.admingroup.name]
}

# Define an IAM role
resource "aws_iam_role" "adminrole" {
  name = "admin-role"

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

# Define an IAM role policy attachment
resource "aws_iam_role_policy_attachment" "admin_role_attach" {
  role       = aws_iam_role.adminrole.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

