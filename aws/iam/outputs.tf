output "iam_role_name" {
  value       = var.should_create ? aws_iam_role.role[0].id : null
  sensitive   = false
  description = "Name/ID of the iam role"
}

output "iam_role_arn" {
  value       = var.should_create ? aws_iam_role.role[0].arn : null
  sensitive   = false
  description = "ARN of the iam role"
}

output "instance_profile_arn" {
  value       = var.create_instance_profile ? aws_iam_instance_profile.profile.arn : null
  sensitive   = false
  description = "ARN of the instance profile, if any."
}
