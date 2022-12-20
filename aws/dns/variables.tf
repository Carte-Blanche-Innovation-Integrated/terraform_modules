variable "domain" {
  type        = string
  description = "The domain name you want this hosted zone to be associated with."
  nullable    = false
  sensitive   = false
}

variable "records" {
  type = list(object(
    {
      name  = string
      type  = string
      ttl   = number
      value = list(string)
    }
  ))
  description = "List of records to add to the hosted zone"
  default     = []
  nullable    = false
  sensitive   = false
}
