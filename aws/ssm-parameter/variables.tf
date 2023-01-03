variable "name" {
  type        = string
  description = "Name of the parameter"
  nullable    = false
  sensitive   = false
}

variable "description" {
  type        = string
  description = "Description of the parameter"
  nullable    = false
  sensitive   = false
}

variable "type" {
  type        = string
  description = "Type of the parameter. Valid types are String, StringList and SecureString"
  default     = "SecureString"
  nullable    = false
  sensitive   = false
}

variable "value" {
  type        = any
  description = "Value of the parameter"
  nullable    = false
  sensitive   = true
}

variable "common_tags" {
  type        = map(string)
  description = "A map of common tags to be applied on all the created resources"
  default     = {}
  nullable    = false
  sensitive   = false
}
