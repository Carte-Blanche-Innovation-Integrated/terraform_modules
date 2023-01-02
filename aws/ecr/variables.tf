variable "ecr_repo_name" {
  type        = string
  description = "Name of the repo for the ECR"
  sensitive   = false
  nullable    = false
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "Should the image tags be mutable/replaceable?"
  sensitive   = false
  nullable    = false
}

variable "force_delete" {
  type        = bool
  default     = false
  description = "If true, will delete the repository even if it contains images. Defaults to false."
  sensitive   = false
  nullable    = false
}

variable "scan_on_push" {
  type        = bool
  default     = true
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
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
