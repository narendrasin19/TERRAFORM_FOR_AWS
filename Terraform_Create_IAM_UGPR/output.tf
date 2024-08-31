output "iam_group_name" {
  value = aws_iam_group.admingroup.name
}

output "iam_group_arn" {
  value = aws_iam_group.admingroup.arn
}

output "iam_user1_name" {
  value = aws_iam_user.adminuser1.name
}

output "iam_user1_arn" {
  value = aws_iam_user.adminuser1.arn
}

output "iam_user2_name" {
  value = aws_iam_user.adminuser2.name
}

output "iam_user2_arn" {
  value = aws_iam_user.adminuser2.arn
}

output "iam_policy_attachment_name" {
  value = aws_iam_policy_attachment.admin_users_attach.name
}

output "iam_policy_attachment_arn" {
  value = aws_iam_policy_attachment.admin_users_attach.policy_arn
}

output "iam_role_name" {
  value = aws_iam_role.adminrole.name
}

output "iam_role_arn" {
  value = aws_iam_role.adminrole.arn
}

output "iam_role_policy_attachment_name" {
  value = aws_iam_role_policy_attachment.admin_role_attach.role
}

output "iam_role_policy_arn" {
  value = aws_iam_role_policy_attachment.admin_role_attach.policy_arn
}

