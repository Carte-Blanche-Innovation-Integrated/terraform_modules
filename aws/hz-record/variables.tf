variable "zone_id" {
  type        = string
  description = "The Hosted Zone ID"
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
