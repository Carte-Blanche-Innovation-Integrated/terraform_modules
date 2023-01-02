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
        cidrs     = list(string)
        sg        = string
      }
    )
  )
  default = [
    {
      type      = "ingress"
      to_port   = 0
      from_port = 0
      protocol  = "all"
      cidrs     = ["0.0.0.0/0"]
      sg        = ""
    },
    {
      type      = "egress"
      to_port   = 0
      from_port = 0
      protocol  = "all"
      cidrs     = ["0.0.0.0/0"]
      sg        = ""
    }
  ]
  description = "List of all ingress/egress rules to be attached to the sg"
  nullable    = false
  sensitive   = false

  validation {
    condition     = sort(distinct(var.rules[*].type)) == tolist(["egress", "ingress"])
    error_message = "'type' can be either 'egress' or 'ingress'"
  }
}

variable "common_tags" {
  type        = map(string)
  description = "A map of common tags to be applied on all the created resources"
  default     = {}
  nullable    = false
  sensitive   = false
}
