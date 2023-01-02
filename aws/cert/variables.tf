variable "record_fqdn" {
  type        = string
  description = "FQDN for which the certificate is issued"
  nullable    = false
  sensitive   = false
}

variable "zone_id" {
  type        = string
  description = "The Hosted Zone ID"
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
