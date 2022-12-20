variable "domain" {
  type        = string
  description = "The domain u want this hosted zone to be associated with."
  nullable    = false
  sensitive   = false
}

variable "records" {
  type = list(object(
    {
      record    = string
      type      = string
      ttl       = number
      points_to = list(string)
    }
  ))
  description = "List of records to add to the hosted zone"
  default     = []
  nullable    = false
  sensitive   = false
}
