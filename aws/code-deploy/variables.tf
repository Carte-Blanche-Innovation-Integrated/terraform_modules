variable "app_name" {
  type        = string
  description = "Name of the CodeDeploy app"
  sensitive   = false
  nullable    = false
}

variable "common_tags" {
  type        = map(string)
  description = "A map of common tags to be applied on all the created resources"
  default     = {}
  nullable    = false
  sensitive   = false
}

variable "create_iam_role" {
  type        = bool
  default     = true
  description = "Should an IAM role be created for CodeDeploy?"
  nullable    = false
  sensitive   = false
}

variable "create_sns_topics" {
  type        = bool
  default     = false
  description = "Should SNS topics be created for the CodeDeploy app so that we can generate notifications based on the status of deployments on different events. Currently supports 'DeploymentStart', 'DeploymentSuccess', 'DeploymentFailure'"
  nullable    = false
  sensitive   = false
}

variable "target_group_name" {
  type        = string
  description = "Name of the LB target group"
  sensitive   = false
  nullable    = false
}

variable "autoscaling_groups" {
  type        = list(string)
  description = "List of unique ASGs"
  sensitive   = false
  nullable    = false
}
