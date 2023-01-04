output "sns_topics_arn" {
  value       = length(aws_sns_topic.topics) > 0 ? aws_sns_topic.topics[*].arn : []
  sensitive   = false
  description = "ARNs of all the created SNS topics, if any."
}

output "app_name" {
  value       = aws_codedeploy_app.app.name
  sensitive   = false
  description = "Name of the application"
}

output "deployment_group_name" {
  value       = "${var.app_name}-deployment-group"
  sensitive   = false
  description = "Name of the deployment group"
}
