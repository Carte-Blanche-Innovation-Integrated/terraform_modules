variable "pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
  sensitive   = false
  nullable    = false
}

variable "connection_arn" {
  type        = string
  description = "ARN of the codestar connection to github"
  sensitive   = false
  nullable    = false
}


variable "full_repo_id" {
  type        = string
  description = "Full repo name of github"
  sensitive   = false
  nullable    = false
}

variable "branch_name" {
  type        = string
  description = "Name of the branch to deploy"
  sensitive   = false
  nullable    = false
}

variable "code_deploy_app_name" {
  type        = string
  description = "Name of the CodeDeploy app"
  sensitive   = false
  nullable    = false
}

variable "code_deploy_dpgrp_name" {
  type        = string
  description = "Name of the CodeDeploy deployment group"
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

variable "code_pipeline_policy" {
  type        = string
  description = "Provide an IAM policy for CodePipeline role otherwise a default policy will be applied"
  default     = ""
  nullable    = false
  sensitive   = false
}
