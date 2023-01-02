output "template_id" {
  value       = aws_launch_template.template.id
  sensitive   = false
  description = "ID of the launch template"
}

output "template_arn" {
  value       = aws_launch_template.template.arn
  sensitive   = false
  description = "ARN of the launch template"
}

output "template_latest_version" {
  value       = aws_launch_template.template.latest_version
  sensitive   = false
  description = "Latest version of the launch template"
}
