output "iam_role_name" {
  value       = aws_iam_role.role.id
  sensitive   = false
  description = "Name/ID of the iam role"
}

output "iam_role_arn" {
  value       = aws_iam_role.role.arn
  sensitive   = false
  description = "ARN of the iam role"
}
