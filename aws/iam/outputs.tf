output "iam_role_name" {
  value       = aws_iam_role.role.id
  sensitive   = false
  description = "Name/ID of the iam role"
}
