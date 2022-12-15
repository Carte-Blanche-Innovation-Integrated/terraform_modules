output "sg_id" {
  value       = aws_security_group.sg.id
  sensitive   = false
  description = "ID of the security group"
}

output "sg_arn" {
  value       = aws_security_group.sg.arn
  sensitive   = false
  description = "ARN of the security group"
}
