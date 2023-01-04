variable "name" {
  type        = string
  description = "Name of the loadbalancer"
  sensitive   = false
  nullable    = false
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of VPC subnet ids where this lb will be placed"
  sensitive   = false
  nullable    = false
}

variable "sg_ids" {
  type        = list(string)
  description = "List of SG ids which allow the traffic from/out of lb"
  default     = []
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

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
  sensitive   = false
  nullable    = false
}

variable "target_port" {
  type        = number
  description = "Port which is used to send/recieve data to/from the target group"
  default     = 80
  sensitive   = false
  nullable    = false
}

variable "deregistration_delay" {
  type        = number
  description = "Time(in seconds) allowed for the instances in the target group to deregister themselves and stop serving requests"
  default     = 100
  sensitive   = false
  nullable    = false
}

variable "slow_start" {
  type        = number
  description = "Starting time(in seconds) of the instance before the health check pings are sent to the instance"
  default     = 120
  sensitive   = false
  nullable    = false
}

variable "health_check_enabled" {
  type        = bool
  default     = true
  description = "Is health check enabled for this LB?"
  sensitive   = false
  nullable    = false
}

variable "healthy_threshold" {
  type        = number
  description = "How many consecutive successful pings after we deem the instance healthy?"
  default     = 2
  sensitive   = false
  nullable    = false
}

variable "unhealthy_threshold" {
  type        = number
  description = "How many consecutive unsuccessful pings after we deem the instance unhealthy?"
  default     = 9
  sensitive   = false
  nullable    = false
}

variable "interval" {
  type        = number
  description = "How much time(in seconds) to wait before sending the next ping to target instance?"
  default     = 20
  sensitive   = false
  nullable    = false
}

variable "timeout" {
  type        = number
  description = "Timeout(in seconds) if no reply comes back from the pings"
  default     = 5
  sensitive   = false
  nullable    = false
}

variable "health_check_path" {
  type        = string
  description = "Health check url to hit"
  default     = "/"
  sensitive   = false
  nullable    = false
}
