variable "identifier" {
  type        = string
  description = "description"
  sensitive   = false
  nullable    = false

  validation {
    condition     = length(var.identifier) >= 1 && length(var.identifier) <= 63
    error_message = "Must contain from 1 to 63 letters, numbers, or hyphens."
  }
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of IDs of all the subnets where this DB instance can be placed."
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

variable "allow_major_version_upgrade" {
  type        = bool
  description = "Should the major version be updated automatically?"
  default     = false
  nullable    = false
  sensitive   = false
}

variable "allocated_storage" {
  type        = number
  description = "Storage in GBs"
  default     = 30
  nullable    = false
  sensitive   = false
}

variable "apply_immediately" {
  type        = bool
  description = "Should the changes be applied immediately on the DB instance? It will take it down for some short amount of time."
  default     = false
  nullable    = false
  sensitive   = false
}

variable "backup_retention_period" {
  type        = number
  description = "How many days will the backup be retained?"
  default     = 3
  nullable    = false
  sensitive   = false
}

variable "backup_window" {
  type        = string
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled"
  default     = "22:00-23:00"
  nullable    = false
  sensitive   = false
}

variable "db_name" {
  type        = string
  description = "Name of the master database"
  nullable    = false
  sensitive   = false
}

variable "delete_automated_backups" {
  type        = bool
  description = "Whether to remove automated backups immediately after the DB instance is deleted"
  default     = false
  nullable    = false
  sensitive   = false
}

variable "postgres_engine_version" {
  type        = string
  description = "Version of postgres"
  default     = "14.5"
  nullable    = false
  sensitive   = false
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if 'skip_final_snapshot' is set to false"
  default     = ""
  nullable    = false
  sensitive   = false
}

variable "instance_class" {
  type        = string
  description = "Type of instance like t3.micro etc"
  default     = "db.t3.micro"
  nullable    = false
  sensitive   = false
}

variable "maintenance_window" {
  type        = string
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Sun:01:00-Sun:02:00"
  nullable    = false
  sensitive   = false
}

variable "max_allocated_storage" {
  type        = number
  description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  default     = 50
  nullable    = false
  sensitive   = false
}

variable "monitoring_interval" {
  type        = number
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = 60
  nullable    = false
  sensitive   = false
}

variable "multi_az" {
  type        = bool
  description = "Should the database be deployed in multi AZs?"
  default     = false
  nullable    = false
  sensitive   = false
}

variable "password" {
  type        = string
  description = "Master password for the DB"
  nullable    = false
  sensitive   = true
}

variable "is_public" {
  type        = bool
  description = "Is this instance publicly accessible?"
  default     = false
  nullable    = false
  sensitive   = false
}

variable "skip_final_snapshot" {
  type        = bool
  default     = true
  description = "When destroying the database should it be backed up?"
  nullable    = false
  sensitive   = false
}

variable "username" {
  type        = string
  description = "Master username for the DB"
  nullable    = false
  sensitive   = true
}

variable "sg_ids" {
  type        = list(string)
  description = "List of ids of allowed security groups for the incoming traffic for DB"
  default     = []
  nullable    = false
  sensitive   = true
}

variable "read_replicas" {
  type        = number
  description = "Number of read replicas to be created"
  default     = 0
  nullable    = false
  sensitive   = true
}
