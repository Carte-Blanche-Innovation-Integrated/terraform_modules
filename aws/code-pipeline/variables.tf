variable "pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
  sensitive   = false
  nullable    = false
}

variable "stages" {
  type = list(object({
    name   = string
    action = map(any)
  }))
  description = "A list of stages that constitute this pipeline"
  sensitive   = false
  nullable    = true

  validation {
    condition     = length(var.stages) >= 2
    error_message = "Minimum of at least two stage blocks is required"
  }
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