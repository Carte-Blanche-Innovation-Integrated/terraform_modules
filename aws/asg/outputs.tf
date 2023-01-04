output "asg_name" {
  value       = aws_autoscaling_group.asg.name
  description = "Name of the ASG. It is unique."
}
