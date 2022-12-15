variable "sg_name" {
  type        = string
  description = "Name of the security group"
  nullable    = false
  sensitive   = false
}

variable "sg_description" {
  type        = string
  description = "Description of the security group"
  default     = "Managed by Terraform"
  nullable    = false
  sensitive   = false
}

variable "sg_vpc_id" {
  type        = string
  description = "ID of the vpc where sg is placed"
  nullable    = false
  sensitive   = false
}

variable "rules" {
  type = list(
    object(
      {
        type      = string
        to_port   = number
        from_port = number
        protocol  = string
      }
    )
  )
  default = [
    {
      type      = "ingress"
      to_port   = 0
      from_port = 0
      protocol  = "all"
    },
    {
      type      = "egress"
      to_port   = 0
      from_port = 0
      protocol  = "all"
    }
  ]
  description = "List of all ingress/egress rules to be attached to the sg"
  nullable    = false
  sensitive   = false

  validation {
    condition     = var.rules.type == "ingress" || var.rules.type == "egress"
    error_message = "'type' can be either 'ingress' or 'egress'"
  }
}
