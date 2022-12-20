variable "name" {
  type        = string
  description = "This name will be used as s3 bucket name and dynamodb table name."
  nullable    = false
  sensitive   = false
}
