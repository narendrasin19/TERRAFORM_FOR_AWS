// output.tf

// Output for public key content
output "public_key_content" {
  description = "Content of the public key"
  value       = data.local_file.public_key.content
}

// Output for Auto Scaling Group name
output "autoscaling_group_name" {
  description = "Name of the AWS Auto Scaling Group"
  value       = aws_autoscaling_group.levelup-autoscaling.name
}

// Output for Auto Scaling Group ARN
output "autoscaling_group_arn" {
  description = "ARN of the AWS Auto Scaling Group"
  value       = aws_autoscaling_group.levelup-autoscaling.arn
}

// Output for Auto Scaling Policy ARN (CPU Scale-Up)
output "autoscaling_policy_cpu_up_arn" {
  description = "ARN of the AWS Auto Scaling Policy for CPU Scale-Up"
  value       = aws_autoscaling_policy.levelup-cpu-policy.arn
}

// Output for Auto Scaling Policy ARN (CPU Scale-Down)
output "autoscaling_policy_cpu_down_arn" {
  description = "ARN of the AWS Auto Scaling Policy for CPU Scale-Down"
  value       = aws_autoscaling_policy.levelup-cpu-policy-scaledown.arn
}

// Output for CloudWatch Alarm Name (CPU High Usage)
output "cloudwatch_cpu_alarm_name" {
  description = "Name of the CloudWatch Alarm for High CPU Usage"
  value       = aws_cloudwatch_metric_alarm.levelup-cpu-alarm.alarm_name
}

// Output for CloudWatch Alarm Name (CPU Low Usage)
output "cloudwatch_cpu_alarm_scaledown_name" {
  description = "Name of the CloudWatch Alarm for Low CPU Usage"
  value       = aws_cloudwatch_metric_alarm.levelup-cpu-alarm-scaledown.alarm_name
}

// Output for Elastic Load Balancer Name
output "elb_name" {
  description = "Name of the AWS Elastic Load Balancer"
  value       = aws_elb.levelup-elb.name
}

// Output for IAM Instance Profile Name
output "iam_instance_profile_name" {
  description = "Name of the IAM Instance Profile"
  value       = aws_iam_instance_profile.s3_levelupbucket_role_instanceprofile.name
}

// Output for IAM Role Name
output "iam_role_name" {
  description = "Name of the IAM Role"
  value       = aws_iam_role.s3_levelupbucket_role.name
}

// Output for IAM Role Policy Name
output "iam_role_policy_name" {
  description = "Name of the IAM Role Policy"
  value       = aws_iam_role_policy.s3_levelupbucket_role_policy.name
}

// Output for Internet Gateway ID
output "internet_gateway_id" {
  description = "ID of the AWS Internet Gateway"
  value       = aws_internet_gateway.levelup-gw.id
}

// Output for Key Pair Name
output "key_pair_name" {
  description = "Name of the AWS Key Pair"
  value       = aws_key_pair.levelup_key.key_name
}

// Output for Launch Configuration Name
output "launch_configuration_name" {
  description = "Name of the AWS Launch Configuration"
  value       = aws_launch_configuration.levelup-launchconfig.name
}
