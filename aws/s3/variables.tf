variable "bucket_name" {
  type        = string
  description = "Globally unique name of the bucket"
  nullable    = false
  sensitive   = false
}

variable "block_bucket_public_access" {
  type        = bool
  description = "Should the public access to the bucket be blocked?"
  default     = true
  nullable    = false
  sensitive   = false
}

variable "is_rest_encrypted" {
  type        = bool
  description = "Is data encrypted at rest"
  default     = false
  nullable    = false
  sensitive   = false
}

variable "versioning" {
  type        = bool
  description = "Enable or disable version on the bucket"
  default     = true
  nullable    = false
  sensitive   = false
}

variable "bucket_acl" {
  type        = string
  description = "public or private"
  default     = "private"
  nullable    = false
  sensitive   = false
}

variable "cors_rules" {
  type        = list(map(any))
  default     = []
  description = "List of CORS rules"
  nullable    = false
  sensitive   = false
}

variable "bucket_policy" {
  type        = any
  description = "Bucket policy"
  default     = null
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