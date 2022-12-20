variable "role_name" {
  type        = string
  description = "Name of the iam role."
  nullable    = false
  sensitive   = false
}

variable "assume_role_policy" {
  type = string
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
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
