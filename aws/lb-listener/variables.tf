variable "lb_arn" {
  type        = string
  description = "ARN of the loadbalancer"
  sensitive   = false
  nullable    = false
}

variable "listener" {
  type        = map(any)
  description = "Listener object"
  sensitive   = false
  nullable    = false
}

variable "action" {
  type        = map(any)
  description = "Action object"
  sensitive   = false
  nullable    = false
}

variable "redirect" {
  type        = map(any)
  description = "Listener redirect object, if any"
  default     = {}
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
