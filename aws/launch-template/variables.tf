variable "name" {
  type        = string
  description = "Name of the launch template"
  sensitive   = false
  nullable    = false
}

variable "description" {
  type        = string
  description = "Description of the launch template"
  sensitive   = false
  nullable    = false
}

variable "instance_profile_arn" {
  type        = string
  description = "ARN of the instance profile which will be attached to the instances"
  nullable    = false
  sensitive   = false
}

variable "instance_type" {
  type        = string
  description = "Family of the instance"
  default     = "t2.micro"
  sensitive   = false
  nullable    = false
}

variable "key_pair_name" {
  type        = string
  description = "Name of the key pair. Should be created manually from the AWS console."
  default     = null
  sensitive   = false
  nullable    = true
}

variable "associate_public_ip" {
  type        = bool
  description = "Should a public ip address be attached with the instance?"
  default     = true
  sensitive   = false
  nullable    = false
}

variable "sgs" {
  type        = list(string)
  description = "List of SG ids for EC2 instance."
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

variable "user_data_file_path" {
  type        = string
  description = "Path of the file in which user data is stored."
  default     = ""
  sensitive   = false
  nullable    = false
}
