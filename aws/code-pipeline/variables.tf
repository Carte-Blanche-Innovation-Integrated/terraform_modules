variable "pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
  sensitive   = false
  nullable    = false
}

variable "stages" {
  type        = list(any)
  description = "A list of stages that constitute this pipeline"
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
