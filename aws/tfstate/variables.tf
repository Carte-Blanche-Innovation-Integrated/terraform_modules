variable "name" {
  type        = string
  description = "This name will be used as s3 bucket name and dynamodb table name."
  nullable    = false
  sensitive   = false
}

variable "common_tags" {
  type        = map(string)
  description = "A map of common tags to be applied on all the created resources"
  default     = {}
  nullable    = false
  sensitive   = false
}
