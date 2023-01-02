variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = []
  description = "A list of CIDR blocks for the public subnets"
  nullable    = false
  sensitive   = false
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = []
  description = "A list of CIDR blocks for the private subnets"
  nullable    = false
  sensitive   = false
}

variable "enable_nat" {
  type        = bool
  default     = false
  description = "Whether to create nat gateways or not."
  nullable    = false
  sensitive   = false
}

variable "single_nat" {
  type        = bool
  default     = true
  description = "Should create only one nat, hooked up with all private subnets?"
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
