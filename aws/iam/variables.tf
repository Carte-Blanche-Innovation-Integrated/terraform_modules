variable "should_create" {
  type        = bool
  default     = true
  description = "Should all the resources in this module be created? This flag is helpful when conditionally creating this module"
  nullable    = false
  sensitive   = false
}

variable "role_name" {
  type        = string
  description = "Name of the iam role."
  nullable    = false
  sensitive   = false
}

variable "assume_role_policy" {
  type        = string
  default     = ""
  description = "Provide the assume role policy. If not provided then by default EC2 assume role policy will be used."
  nullable    = false
  sensitive   = false
}

variable "aws_managed_policies" {
  type        = list(string)
  default     = []
  description = "List of ARNs of AWS managed iam policies to be attached to the role."
  nullable    = true
  sensitive   = false
}

variable "new_policies" {
  type = list(
    object(
      {
        name        = string
        description = string
        policy      = any
      }
    )
  )
  default     = []
  description = "List of json encoded policies (new) to be created and then attached to this role."
  nullable    = true
  sensitive   = false
}

variable "common_tags" {
  type        = map(string)
  description = "A map of common tags to be applied on all the created resources"
  default     = {}
  nullable    = false
  sensitive   = false
}

variable "create_instance_profile" {
  type        = bool
  default     = true
  description = "Should create instance profile?"
  nullable    = false
  sensitive   = false
}
