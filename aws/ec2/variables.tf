variable "instance_name" {
  type        = string
  description = "Name of the ec2 instance."
  sensitive   = false
  nullable    = false
}

variable "iam_role_name" {
  type        = string
  description = "Name of the iam role, needed to create an instance profile for ec2."
  default     = null
  sensitive   = false
  nullable    = true
}

variable "ebs_vols" {
  type        = list(number)
  description = "List that contains the size of one or more EBS volumes."
  default     = []
  sensitive   = false
  nullable    = false

  validation {
    condition     = try(length(var.ebs_vols), 0) < 12
    error_message = "Can't attach more than 11 volumes with an instance at once."
  }
}

variable "should_create_eip" {
  type        = bool
  description = "If the created instance should have an EIP attached to it."
  default     = true
  sensitive   = false
  nullable    = false
}

variable "instance_type" {
  type        = string
  description = "Family of the instance"
  default     = "t2.micro"
  sensitive   = false
  nullable    = false
}

variable "user_data_file_path" {
  type        = string
  description = "Path of the file in which user data is stored."
  default     = null
  sensitive   = false
  nullable    = true
}

variable "key_pair_name" {
  type        = string
  description = "Name of the key pair. Should be created manually from the AWS console."
  default     = null
  sensitive   = false
  nullable    = true
}

variable "vpc_id" {
  type        = string
  description = "ID of the vpc you want to place the instance inside."
  default     = null
  sensitive   = false
  nullable    = true
}

variable "enable_monitoring" {
  type        = bool
  description = "Should the detailed monitoring for this instance be enabled?"
  default     = true
  sensitive   = false
  nullable    = false
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

variable "instance_termination_protection" {
  type        = bool
  description = "Should instance deletion protection be enabled?"
  default     = false
  sensitive   = false
  nullable    = false
}
