variable "domain" {
  type        = string
  description = "The domain name you want this hosted zone to be associated with."
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
