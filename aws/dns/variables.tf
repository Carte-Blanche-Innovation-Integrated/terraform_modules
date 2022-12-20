variable "domain" {
  type        = string
  description = "The domain u want this hosted zone to be associated with."
  nullable    = false
  sensitive   = false
}

variable "records" {
  type = list(object(
    {
      subdomain = string
      type      = string
      ttl       = number
      records   = list(string)
    }
  ))
  description = "description"
  default     = []
  nullable    = false
  sensitive   = false
}
