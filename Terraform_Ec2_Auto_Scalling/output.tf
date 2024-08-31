output "iam_instance_profile_arn" {
  description = "The ARN of the IAM instance profile."
  value       = aws_iam_instance_profile.s3_levelupbucket_role_instanceprofile.arn
}

output "iam_role_arn" {
  description = "The ARN of the IAM role."
  value       = aws_iam_role.s3_levelupbucket_role.arn
}

output "iam_role_policy_id" {
  description = "The ID of the IAM role policy."
  value       = aws_iam_role_policy.s3_levelupbucket_role_policy.id
}

output "key_pair_fingerprint" {
  description = "The fingerprint of the EC2 key pair."
  value       = aws_key_pair.levelup_key.fingerprint
}

output "key_pair_id" {
  description = "The ID of the EC2 key pair."
  value       = aws_key_pair.levelup_key.key_pair_id
}

output "public_key_file" {
  description = "The path to the public key file used for the EC2 key pair."
  value       = "./levelup_key.pub"
}
