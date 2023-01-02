variable "name" {
  type        = string
  description = "Name of the auto scaling group"
  sensitive   = false
  nullable    = false
}

variable "desired_capacity" {
  type        = number
  description = "Number of desired instances running at a time"
  default     = 2
  sensitive   = false
  nullable    = false
}

variable "max_size" {
  type        = number
  description = "Maximum number of instances that can be run in this AutoSG at once"
  default     = 2
  sensitive   = false
  nullable    = false
}

variable "min_size" {
  type        = number
  description = "Minimum number of instances that can be run in this AutoSG at once"
  default     = 2
  sensitive   = false
  nullable    = false
}

variable "launch_template_id" {
  type        = string
  description = "ID of the EC2 launch template"
  sensitive   = false
  nullable    = false
}

variable "target_group_arns" {
  type        = list(string)
  description = "List of ARNs of the LB target group"
  sensitive   = false
  nullable    = false
}

variable "create_auto_scaling_policy" {
  type        = bool
  description = "Should the auto scaling policy be created?"
  default     = false
  sensitive   = false
  nullable    = false
}

variable "scaling_adjustment" {
  type        = number
  description = "Number of instances by which to scale"
  default     = 4
  sensitive   = false
  nullable    = false
}

variable "adjustment_type" {
  type        = string
  description = "Whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity"
  default     = "ChangeInCapacity"
  sensitive   = false
  nullable    = false
}

variable "scaling_cooldown" {
  type        = number
  description = "Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
  default     = 300
  sensitive   = false
  nullable    = false
}
